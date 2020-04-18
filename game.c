#include "game.h"
#include "myLib.h"
#include "spritesheet.h"
#include "collisionBitmap.h"
#include "sound.h"
#include "menuSong.h"
#include "loseSong.h"
#include "winSong.h"
#include "gameSong.h"
#include "pauseNoise.h"
#include "owSound.h"
#include "punchSound.h"
#include "collectSound.h"
#include <stdlib.h>
#include <math.h>
/*completed
Finished Spritesheet
implemented Collision bitmap
Added sanitizer
*/

/* To Do
Add Sound
Add in sprites for health
Add in number score
Figure out how to not die from one hit...
Add in animation for all sprites
Work on art for other background states
*/

int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
extern int lost;
extern int won;
extern int TPCollected;
TOILETPAPER paper[TOTALPAPER];
ANISPRITE player;
CUSTOMER customers[TOTALCUSTOMER];
SANITIZER sanitizer[TOTALSAN];
int timer;
int speed;
int playerHealth;
int hitflag;
double dx, dy, distance;
int heartCount;

void initPlayer()
{
    player.curFrame = 0;
    player.aniState = 0;
    player.numFrames = 4;
    player.aniCounter = 0;
    player.cdel = 1;
    player.rdel = 1;
    player.height = 32;
    player.width = 32;
    player.worldRow = 155;
    player.worldCol = 200;
    player.screenRow = player.worldRow;
    player.screenCol = player.worldCol;
    playerHealth = 3;
    hitflag = 0;
}
void drawPlayer()
{
    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame * 4, player.aniState * 4) | ATTR2_PALROW(0);
}
void updatePlayer()
{
    if (BUTTON_HELD(BUTTON_LEFT) && collisionBitmapBitmap[OFFSET(player.worldCol - player.cdel, player.worldRow + (player.height / 4), MAPWIDTH)] != BLACK && collisionBitmapBitmap[OFFSET(player.worldCol - player.cdel, player.worldRow + player.height - 1, MAPWIDTH)] != BLACK)
    {
        if (player.screenCol > 0)
        {
            player.worldCol -= player.cdel;
            if (hOff >= 0 && player.screenCol < SCREENWIDTH / 2)
            {
                hOff--;
                playerHoff--;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && collisionBitmapBitmap[OFFSET(player.worldCol + player.width + player.cdel - 1, player.worldRow + (player.height / 4), MAPWIDTH)] != BLACK && collisionBitmapBitmap[OFFSET(player.worldCol + player.width + player.cdel - 1, player.worldRow + player.height - 1, MAPWIDTH)] != BLACK)
    {
        if (player.worldCol + player.width - 1 < MAPWIDTH - 1)
        {
            player.worldCol += player.cdel;
            if (playerHoff < MAPWIDTH - SCREENWIDTH - 1 && hOff < MAPWIDTH - SCREENWIDTH - 1 && player.screenCol > SCREENWIDTH / 2)
            {
                hOff++;
                playerHoff++;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_UP) && collisionBitmapBitmap[OFFSET(player.worldCol, player.worldRow - player.rdel + (player.height / 4), MAPWIDTH)] != BLACK && collisionBitmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - player.rdel + (player.height / 4), MAPWIDTH)] != BLACK)
    {
        if (player.screenRow > 0)
        {
            player.worldRow -= player.rdel;
            if (vOff >= 0 && player.screenRow < SCREENHEIGHT / 2)
            {
                vOff--;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && collisionBitmapBitmap[OFFSET(player.worldCol + player.width - 1, player.worldRow + player.height + player.rdel - 1, MAPWIDTH)] != BLACK && collisionBitmapBitmap[OFFSET(player.worldCol, player.worldRow + player.height + player.rdel - 1, MAPWIDTH)] != BLACK)
    {
        if (player.worldRow + player.height - 1 < MAPHEIGHT - 1)
        {
            player.worldRow += player.rdel;
            if (vOff < MAPHEIGHT - SCREENHEIGHT && player.screenRow > SCREENHEIGHT / 2)
            {
                vOff++;
            }
        }
    }
    animatePlayer();
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHoff;
}
void initPaper()
{
    for (int i = 0; i < TOTALPAPER; i++)
    {
        paper[i].worldCol = 64 + 128 * i;
        paper[i].width = 32;
        paper[i].height = 32;
        paper[i].aniState = 0;
        paper[i].curFrame = 5;
        paper[i].active = 1;
        if (i < 8)
        {
            paper[i].worldRow = 64;
        }
        else if (i < 16)
        {
            paper[i].worldRow = 128;
        }
        else if (i < 24)
        {
            paper[i].worldRow = 192;
        }
        paper[i].screenRow = paper[i].worldRow;
        paper[i].screenCol = paper[i].worldCol;
    }
}
void drawPaper()
{
    for (int i = 0; i < TOTALPAPER; i++)
    {
        if (paper[i].active)
        {
            shadowOAM[i + 1].attr0 = (ROWMASK & paper[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = (COLMASK & paper[i].screenCol) | ATTR1_MEDIUM;
            shadowOAM[i + 1].attr2 = ATTR2_TILEID(paper[i].aniState * 4, paper[i].curFrame * 4);
        }
        if (paper[i].active == 0 || vOff > paper[i].worldRow || hOff > paper[i].worldCol || vOff + SCREENHEIGHT < paper[i].worldRow || hOff + SCREENWIDTH < paper[i].worldRow)
        {
            shadowOAM[i + 1].attr0 = ATTR0_HIDE;
        }
    }
}
void updatePaper()
{

    for (int i = 0; i < TOTALPAPER; i++)
    {

        if (collision(player.screenCol, player.screenRow, player.width, player.height,
                      paper[i].screenCol, paper[i].screenRow, paper[i].width, paper[i].height) &&
            paper[i].active)
        {
            playSoundB(collectSound, COLLECTSOUNDLEN, 0);
            paper[i].active = 0;
            TPCollected++;
        }
        if (TPCollected == totalPaper)
        {
            won = 1;
        }
        paper[i].screenRow = paper[i].worldRow - vOff;
        paper[i].screenCol = paper[i].worldCol - hOff;
    }
}
void initCustomer()
{
    for (int i = 0; i < TOTALCUSTOMER; i++)
    {
        customers[i].worldCol = 64 + 128 * i;
        customers[i].worldRow = 32 + 16 * i;
        customers[i].aniState = 4;
        customers[i].curFrame = 0;
        customers[i].width = 32;
        customers[i].height = 32;
        customers[i].active = 1;
        customers[i].livesRemaining = 3;
        customers[i].follow = 0;
        customers[i].screenCol = customers[i].worldCol;
        customers[i].screenRow = customers[i].worldRow;
    }
}
void drawCustomer()
{
    for (int i = 0; i < TOTALCUSTOMER; i++)
    {
        if (customers[i].active)
        {
            shadowOAM[i + 50].attr0 = (ROWMASK & customers[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + 50].attr1 = (COLMASK & customers[i].screenCol) | ATTR1_MEDIUM;
            shadowOAM[i + 50].attr2 = ATTR2_TILEID(customers[i].aniState * 4, customers[i].curFrame * 4);
        }
        if (customers[i].active == 0 || vOff > customers[i].worldRow || hOff > customers[i].worldCol || hOff + SCREENWIDTH < customers[i].worldCol || vOff + SCREENHEIGHT < customers[i].worldRow)
        {
            shadowOAM[i + 50].attr0 = ATTR0_HIDE;
        }
    }
}
void updateCustomer()
{
    speed = 2;
    for (int i = 0; i < TOTALCUSTOMER; i++)
    {
        dx = player.screenCol - customers[i].screenCol;
        dy = player.screenRow - customers[i].screenRow;
        distance = sqrt(dx * dx + dy * dy);
        if (customers[i].follow && timer % 2 == 0)
        {
            customers[i].worldCol += speed * (dx / distance);
            customers[i].worldRow += speed * (dy / distance);
        }
        if (hitflag == 1)
        {
            playerHealth--;
            hitflag = 0;
        }

        if (collision(player.screenCol + (player.width / 4), player.screenRow, player.width / 2, player.height, customers[i].screenCol + (customers[i].width / 4), customers[i].screenRow,
                      customers[i].width / 2, customers[i].height) &&
            customers[i].active)
        {
            playSoundB(owSound, OWSOUNDLEN, 0);
            player.worldRow += dy;
            player.worldCol += dx;
            hitflag = 1;
            if (playerHealth == 0)
            {
                lost = 1;
            }
        }
        if (BUTTON_PRESSED(BUTTON_A) && collision(player.screenCol - 15, player.screenRow - 15, player.width + 30, player.height + 30, customers[i].screenCol, customers[i].screenRow, customers[i].width, customers[i].height) &&
            customers[i].active)
        {
            playSoundB(punchSound, PUNCHSOUNDLEN, 0);
            customers[i].livesRemaining--;
            customers[i].follow = 1;
            if (customers[i].livesRemaining == 0)
            {
                customers[i].active = 0;
                for (int j = 24; j < TOTALPAPER; j++)
                {
                    paper[j].worldCol = customers[i].worldCol;
                    paper[j].worldRow = customers[i].worldRow;
                    paper[j].active = 1;
                    break;
                }
            }
        }
        customers[i].screenRow = customers[i].worldRow - vOff;
        customers[i].screenCol = customers[i].worldCol - hOff;
    }
}
void initSanitizer()
{
    for (int i = 0; i < TOTALSAN; i++)
    {
        sanitizer[i].worldCol = 64 + 128 * i;
        sanitizer[i].worldRow = 16;
        sanitizer[i].height = 16;
        sanitizer[i].width = 16;
        sanitizer[i].curFrame = 12;
        sanitizer[i].aniState = 0;
        sanitizer[i].active = 1;
    }
}
void drawSanitizer()
{
    for (int i = 0; i < TOTALSAN; i++)
    {
        if (sanitizer[i].active)
        {
            shadowOAM[i + 100].attr0 = (ROWMASK & sanitizer[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + 100].attr1 = (COLMASK & sanitizer[i].screenCol) | ATTR1_SMALL;
            shadowOAM[i + 100].attr2 = ATTR2_TILEID(sanitizer[i].aniState * 2, sanitizer[i].curFrame * 2);
        }
        if (sanitizer[i].active == 0 || vOff > sanitizer[i].worldRow || hOff > sanitizer[i].worldCol || vOff + SCREENHEIGHT < sanitizer[i].worldRow || hOff + SCREENWIDTH < sanitizer[i].worldRow)
        {
            shadowOAM[i + 100].attr0 = ATTR0_HIDE;
        }
    }
}
void updateSanitizer()
{
    for (int i = 0; i < TOTALSAN; i++)
    {
        if (collision(player.screenCol, player.screenRow, player.width, player.height, sanitizer[i].screenCol, sanitizer[i].screenRow, sanitizer[i].width, sanitizer[i].height) && sanitizer[i].active && playerHealth < 3)
        {
            playerHealth++;
            sanitizer[i].active = 0;
        }
        sanitizer[i].screenCol = sanitizer[i].worldCol - hOff;
        sanitizer[i].screenRow = sanitizer[i].worldRow - vOff;
    }
}
void initGame()
{
    initCustomer();
    initPlayer();
    initPaper();
    initSanitizer();
    vOff = player.worldRow / 2;
    hOff = player.worldCol / 2;
    playerHoff = player.worldCol / 2;
    screenBlock = 28;
    TPCollected = 0;
    totalPaper = 30;
    won = 0;
    lost = 0;
    timer = 0;
}
void updateGame()
{
    timer++;
    if (hOff > 256 && screenBlock < 31)
    {
        screenBlock++;

        hOff -= 256;

        for (int i = 0; i < TOTALCUSTOMER; i++)
        {
            customers[i].worldCol -= 256;
        }
        for (int i = 0; i < totalPaper; i++)
        {
            paper[i].worldCol -= 256;
        }
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE;
    }
    if (hOff < 0 && screenBlock > 28)
    {
        screenBlock--;
        hOff += 256;

        for (int i = 0; i < TOTALCUSTOMER; i++)
        {
            customers[i].worldCol += 256;
        }
        for (int i = 0; i < totalPaper; i++)
        {
            paper[i].worldCol += 256;
        }
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE;
    }
    updatePlayer();
    updateCustomer();
    updatePaper();
    updateSanitizer();
}
void drawGame()
{
    drawPlayer();
    drawPaper();
    drawCustomer();
    drawSanitizer();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}
void animatePlayer()
{
    player.aniState = player.prevAniState;
    player.aniState = 0;
    if (player.aniCounter % 20 == 0)
    {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }
    if (BUTTON_HELD(BUTTON_UP))
        player.aniState = 1;
    if (BUTTON_HELD(BUTTON_DOWN))
        player.aniState = 0;
    if (BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = 2;
    if (BUTTON_HELD(BUTTON_LEFT))
        player.aniState = 3;

    player.aniCounter++;
}
