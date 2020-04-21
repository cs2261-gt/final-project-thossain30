#include "game.h"
#include "myLib.h"
#include "spritesheet.h"
#include "collisionBitmap.h"
#include "gameBackground.h"
#include "sound.h"
#include "menuSong.h"
#include "loseSong.h"
#include "winSong.h"
#include "gameSong.h"
#include "pauseNoise.h"
#include "owSound.h"
#include "punchSound.h"
#include "collectSound.h"
#include "sanSound.h"
#include <stdlib.h>
#include <math.h>

int hOff;
int totalHoff;
int vOff;
int diff;
OBJ_ATTR shadowOAM[128];
extern int lost;
extern int won;
extern int TPCollected;
TOILETPAPER paper[TOTALPAPER];
ANISPRITE player;
CUSTOMER customers[TOTALCUSTOMER];
SANITIZER sanitizer[TOTALSAN];
HEART hearts[TOTALHEARTS];
TOILETPAPER paper[TOTALPAPER];
CUSTOMER customers[TOTALCUSTOMER];
ANISPRITE player;
SANITIZER sanitizer[TOTALSAN];
HEART hearts[TOTALHEARTS];
ESCORE escore;
HSCORE hscore;
TDIGIT tDigit;
ODIGIT oDigit;
int timer;
double speed;
int playerHealth;
int hitflag;
double dx, dy, distance;
int heartCount;
int evy;
enum
{
    EASY,
    HARD
};

void initPlayer()
{
    player.curFrame = 0;
    player.aniState = 0;
    player.numFrames = 4;  //
    player.aniCounter = 0; //
    player.cdel = 1;
    player.rdel = 1;
    player.height = 32;
    player.width = 32;
    player.worldRow = 155 + vOff;
    player.worldCol = 200 + playerHoff;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHoff;
    playerHealth = 4;
    hitflag = 0;
    evy = 0;
}
void drawPlayer()
{
    shadowOAM[0].attr0 = (ROWMASK & player.screenRow) | ATTR0_SQUARE;
    shadowOAM[0].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 4, player.curFrame * 4) | ATTR2_PALROW(0) | ATTR2_PRIORITY(1);
}
void updatePlayer()
{
    if (BUTTON_HELD(BUTTON_LEFT) && collisionBitmapBitmap[OFFSET(player.worldCol - player.cdel, player.worldRow + (player.height / 4), MAPWIDTH)] != BLACK && collisionBitmapBitmap[OFFSET(player.worldCol - player.cdel, player.worldRow + player.height - 1, MAPWIDTH)] != BLACK)
    {
        if (player.screenCol > 0)
        {
            player.worldCol -= player.cdel;
            if (totalHoff >= 0 && player.screenCol < SCREENWIDTH / 2)
            {
                hOff--;
                playerHoff--;
                totalHoff--;
                if (evy > 0)
                {
                    evy--;
                }
            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT) && collisionBitmapBitmap[OFFSET(player.worldCol + player.width + player.cdel - 1, player.worldRow + (player.height / 4), MAPWIDTH)] != BLACK && collisionBitmapBitmap[OFFSET(player.worldCol + player.width + player.cdel - 1, player.worldRow + player.height - 1, MAPWIDTH)] != BLACK)
    {
        if (player.worldCol + player.width - 1 < MAPWIDTH - 1)
        {
            player.worldCol += player.cdel;
            if (totalHoff < MAPWIDTH - SCREENWIDTH - 1 && hOff < MAPWIDTH - SCREENWIDTH - 1 && player.screenCol > SCREENWIDTH / 2)
            {
                hOff++;
                playerHoff++;
                totalHoff++;
                if (evy < 16)
                {
                    evy++;
                }
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
    REG_BLDY = BLD_EY((evy));
    animateSprites();
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - playerHoff;
}
void initPaper()
{
    for (int i = 0; i < TOTALPAPER; i++)
    {
        paper[i].worldCol = 64 + (128 * (i % 8));
        paper[i].width = 32;
        paper[i].height = 32;
        paper[i].aniState = 0;
        paper[i].curFrame = 5;
        paper[i].numFrames = 4;
        if (i < 8)
        {
            paper[i].worldRow = 64;
            paper[i].active = 1;
        }
        else if (i < 16)
        {
            paper[i].worldRow = 116;
            paper[i].active = 1;
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
            shadowOAM[i + 1].attr2 = ATTR2_TILEID(paper[i].aniState * 4, paper[i].curFrame * 4) | ATTR2_PRIORITY(1);
        }
        if (paper[i].active == 0 || paper[i].screenCol < 0 || paper[i].screenCol > 240 || paper[i].screenRow > 160 || paper[i].screenRow < 0 || vOff > paper[i].worldRow || hOff > paper[i].worldCol || vOff + SCREENHEIGHT < paper[i].worldRow || hOff + SCREENWIDTH < paper[i].worldRow)
        {
            shadowOAM[i + 1].attr0 = ATTR0_HIDE;
        }
    }
}
void updatePaper()
{

    for (int i = 0; i < TOTALPAPER; i++)
    {

        if (collision(player.screenCol + (player.width / 4), player.screenRow, player.width / 2, player.height,
                      paper[i].screenCol, paper[i].screenRow, paper[i].width, paper[i].height) &&
            paper[i].active)
        {
            playSoundB(collectSound, COLLECTSOUNDLEN, 0);
            paper[i].active = 0;
            TPCollected++;
            oDigit.aniState = (oDigit.aniState + 1) % 10;
            if (oDigit.aniState % 10 == 0 && TPCollected > 9)
            {
                tDigit.aniState = (tDigit.aniState + 1) % 10;
            }
        }
        if (TPCollected == totalPaper)
        {
            won = 1;
        }
        paper[i].screenRow = paper[i].worldRow - vOff;
        paper[i].screenCol = paper[i].worldCol - totalHoff;
    }
}
void initCustomer()
{
    for (int i = 0; i < TOTALCUSTOMER; i++)
    {
        customers[i].worldCol = 64 + 256 * i;
        customers[i].worldRow = 32 + 16 * i;
        customers[i].aniState = 4;
        customers[i].curFrame = 1;
        customers[i].numFrames = 5;
        customers[i].aniCounter = 0;
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
            shadowOAM[i + 50].attr2 = ATTR2_TILEID(customers[i].aniState * 4, customers[i].curFrame * 4) | ATTR2_PRIORITY(1);
        }
        if (customers[i].active == 0 || vOff > customers[i].worldRow || totalHoff > customers[i].worldCol || totalHoff + SCREENWIDTH < customers[i].worldCol || vOff + SCREENHEIGHT < customers[i].worldRow)
        {
            shadowOAM[i + 50].attr0 = ATTR0_HIDE;
        }
    }
}
void updateCustomer()
{
    speed = 1.5;
    for (int i = 0; i < TOTALCUSTOMER; i++)
    {
        dx = player.screenCol - customers[i].screenCol;
        dy = player.screenRow - customers[i].screenRow;
        distance = sqrt(dx * dx + dy * dy);
        if (dx > 0 && dy > 0)
        {
            if (dx > dy)
            {
                customers[i].aniState = 6;
            }
            else
            {
                customers[i].aniState = 4;
            }
        }
        if (dx < 0 && dy > 0)
        {
            if (abs(dx) > dy)
            {
                customers[i].aniState = 7;
            }
            else
            {
                customers[i].aniState = 4;
            }
        }
        if (dx > 0 && dy < 0)
        {
            if (abs(dy) > dx)
            {
                customers[i].aniState = 5;
            }
            else
            {
                customers[i].aniState = 6;
            }
        }
        if (dx < 0 && dy < 0)
        {
            if (abs(dx) > abs(dy))
            {
                customers[i].aniState = 7;
            }
            else
            {
                customers[i].aniState = 5;
            }
        }
        if (customers[i].follow && timer % 2 == 0)
        {
            // if (collisionBitmapBitmap[OFFSET(customers[i].worldCol += speed * (int)(dx / distance), customers[i].worldRow, MAPWIDTH)] != BLACK)
            // {
            customers[i].worldCol += speed * (dx / distance);
            //}
            // if (collisionBitmapBitmap[OFFSET(customers[i].worldCol, customers[i].worldRow += speed * (int)(dy / distance), MAPWIDTH)] != BLACK)
            // {
            customers[i].worldRow += speed * (dy / distance);
            //}
        }
        if (hitflag == 1)
        {
            hearts[playerHealth].active = 0;
            playerHealth--;
            hitflag = 0;
        }

        if (collision(player.screenCol + (player.width / 4), player.screenRow, player.width / 2, player.height, customers[i].screenCol + (customers[i].width / 4), customers[i].screenRow,
                      customers[i].width / 2, customers[i].height) &&
            customers[i].active)
        {
            playSoundB(owSound, OWSOUNDLEN, 0);
            if (collisionBitmapBitmap[OFFSET(player.worldCol + (int)dx + 1, player.worldRow + (int)dy + 1, MAPWIDTH)] != BLACK && player.worldRow + (int)dy > 0 && player.worldCol + (int)dx > 0)
            {
                player.worldRow += dy;
                player.worldCol += dx;
                hitflag = 1;
                if (playerHealth == 0)
                {
                    lost = 1;
                }
            }
        }
        if (BUTTON_PRESSED(BUTTON_A))
        {
            player.curFrame = 4;
            if (player.aniCounter % 20 == 0)
            {
                player.curFrame = 0;
            }
            if (collision(player.screenCol - 15, player.screenRow - 15, player.width + 30, player.height + 30, customers[i].screenCol, customers[i].screenRow, customers[i].width, customers[i].height) &&
                customers[i].active)
            {
                playSoundB(punchSound, PUNCHSOUNDLEN, 0);
                customers[i].livesRemaining--;
                customers[i].follow = 1;
            }
            if (customers[i].active && customers[i].livesRemaining == 0)
            {
                customers[i].active = 0;
                for (int j = 16; j < TOTALPAPER; j++)
                {
                    if (paper[j].active == 0)
                    {
                        paper[j].worldCol = customers[i].worldCol;
                        paper[j].worldRow = customers[i].worldRow;
                        paper[j].active = 1;
                        break;
                    }
                }
            }
        }
        customers[i].screenRow = customers[i].worldRow - vOff;
        customers[i].screenCol = customers[i].worldCol - totalHoff;
    }
}
void initSanitizer()
{
    for (int i = 0; i < TOTALSAN; i++)
    {
        sanitizer[i].worldCol = 64 + 128 * i + totalHoff;
        sanitizer[i].worldRow = 16 + vOff;
        sanitizer[i].height = 16;
        sanitizer[i].width = 16;
        sanitizer[i].curFrame = 12;
        sanitizer[i].numFrames = 6;
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
            shadowOAM[i + 100].attr2 = ATTR2_TILEID(sanitizer[i].aniState * 2, sanitizer[i].curFrame * 2) | ATTR2_PRIORITY(1);
        }
        if (sanitizer[i].active == 0 || sanitizer[i].screenCol < 0 || sanitizer[i].screenCol > 240 || sanitizer[i].screenRow > 160 || sanitizer[i].screenRow < 0 || vOff > sanitizer[i].worldRow || totalHoff > sanitizer[i].worldCol || vOff + SCREENHEIGHT < sanitizer[i].worldRow || totalHoff + SCREENWIDTH < sanitizer[i].worldRow)
        {
            shadowOAM[i + 100].attr0 = ATTR0_HIDE;
        }
    }
}
void updateSanitizer()
{
    for (int i = 0; i < TOTALSAN; i++)
    {
        if (collision(player.screenCol, player.screenRow, player.width, player.height, sanitizer[i].screenCol, sanitizer[i].screenRow, sanitizer[i].width, sanitizer[i].height) && sanitizer[i].active && playerHealth < 4)
        {
            playerHealth++;
            hearts[playerHealth].active = 1;
            playSoundB(sanSound, SANSOUNDLEN, 0);
            sanitizer[i].active = 0;
        }
        sanitizer[i].screenCol = sanitizer[i].worldCol - totalHoff;
        sanitizer[i].screenRow = sanitizer[i].worldRow - vOff;
    }
}
void initHeart()
{
    for (int i = 0; i < TOTALHEARTS; i++)
    {
        hearts[i].screenCol = 5 + 18 * i;
        hearts[i].screenRow = 10;
        hearts[i].width = 16;
        hearts[i].height = 16;
        hearts[i].curFrame = 12;
        hearts[i].aniState = 6;
        hearts[i].active = 1;
    }
}
void drawHeart()
{
    for (int i = 0; i < TOTALHEARTS; i++)
    {
        if (hearts[i].active)
        {
            shadowOAM[i + 60].attr0 = (ROWMASK & hearts[i].screenRow) | ATTR0_SQUARE;
            shadowOAM[i + 60].attr1 = (COLMASK & hearts[i].screenCol) | ATTR1_SMALL;
            shadowOAM[i + 60].attr2 = ATTR2_TILEID(hearts[i].aniState * 2, hearts[i].curFrame * 2) | ATTR2_PRIORITY(0);
        }
        else
        {
            shadowOAM[i + 60].attr0 = ATTR0_HIDE;
        }
    }
}
void initEScore()
{
    escore.width = 32;
    escore.height = 8;
    escore.screenCol = 200;
    escore.screenRow = 150;
    escore.aniState = 3;
    escore.curFrame = 26;
}
void drawEScore()
{
    shadowOAM[89].attr0 = (ROWMASK & escore.screenRow) | ATTR0_WIDE;
    shadowOAM[89].attr1 = (COLMASK & escore.screenCol) | ATTR1_SMALL;
    shadowOAM[89].attr2 = ATTR2_TILEID(escore.aniState * 4, escore.curFrame) | ATTR2_PRIORITY(0);
}
void initHScore()
{
    hscore.width = 32;
    hscore.height = 8;
    hscore.screenCol = 200;
    hscore.screenRow = 150;
    hscore.aniState = 4;
    hscore.curFrame = 26;
}
void drawHScore()
{
    shadowOAM[88].attr0 = (ROWMASK & hscore.screenRow) | ATTR0_WIDE;
    shadowOAM[88].attr1 = (COLMASK & hscore.screenCol) | ATTR1_SMALL;
    shadowOAM[88].attr2 = ATTR2_TILEID(hscore.aniState * 4, hscore.curFrame) | ATTR2_PRIORITY(0);
}
void initODigit()
{
    oDigit.width = 8;
    oDigit.height = 8;
    oDigit.screenCol = 192;
    oDigit.screenRow = 150;
    oDigit.aniState = 0;
    oDigit.curFrame = 26;
}
void drawODigit()
{
    shadowOAM[90].attr0 = (ROWMASK & oDigit.screenRow) | ATTR0_SQUARE;
    shadowOAM[90].attr1 = (COLMASK & oDigit.screenCol) | ATTR1_TINY;
    shadowOAM[90].attr2 = ATTR2_TILEID(oDigit.aniState, oDigit.curFrame) | ATTR2_PRIORITY(0);
}
void initTDigit()
{
    tDigit.width = 8;
    tDigit.height = 8;
    tDigit.screenCol = 184;
    tDigit.screenRow = 150;
    tDigit.aniState = 0;
    tDigit.curFrame = 26;
}
void drawTDigit()
{
    shadowOAM[91].attr0 = (ROWMASK & tDigit.screenRow) | ATTR0_SQUARE;
    shadowOAM[91].attr1 = (COLMASK & tDigit.screenCol) | ATTR1_TINY;
    shadowOAM[91].attr2 = ATTR2_TILEID(tDigit.aniState, tDigit.curFrame) | ATTR2_PRIORITY(0);
}
void initGame()
{
    initCustomer();
    initPlayer();
    initHeart();
    initPaper();
    initSanitizer();
    initODigit();
    initTDigit();
    if (diff == EASY)
    {
        initEScore();
    }
    if (diff == HARD)
    {
        initHScore();
    }
    vOff = player.worldRow / 2;
    hOff = player.worldCol / 2;
    playerHoff = player.worldCol / 2;
    totalHoff = player.worldCol / 2;
    screenBlock = 28;
    TPCollected = 0;
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
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | 1;
    }
    if (hOff < 0 && screenBlock > 28)
    {
        screenBlock--;
        hOff += 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | 1;
    }
    updatePlayer();
    updatePaper();
    updateSanitizer();
    updateCustomer();
}
void drawGame()
{
    drawPlayer();
    drawHeart();
    drawPaper();
    drawCustomer();
    drawSanitizer();
    drawTDigit();
    drawODigit();
    if (diff == EASY)
    {
        drawEScore();
    }
    if (diff == HARD)
    {
        drawHScore();
    }
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}
void animateSprites()
{
    player.prevAniState = player.aniState;
    player.aniState = 4;

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

    if (player.aniState == 4)
    {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    }
    else
    {
        player.aniCounter++;
    }
    for (int i = 0; i < TOTALCUSTOMER; i++)
    {
        if (customers[i].follow && customers[i].aniCounter % 20 == 0)
        {
            customers[i].curFrame = (customers[i].curFrame + 1) % customers[i].numFrames;
            if (customers[i].curFrame % customers[i].numFrames == 0)
            {
                customers[i].curFrame++;
            }
        }
        customers[i].aniCounter++;
    }

    for (int i = 0; i < TOTALPAPER; i++)
    {
        if (paper[i].aniCounter % 20 == 0 && paper[i].active)
        {
            paper[i].aniState = (paper[i].aniState + 1) % paper[i].numFrames;
        }
        paper[i].aniCounter++;
    }
    for (int i = 0; i < TOTALSAN; i++)
    {
        if (sanitizer[i].aniCounter % 12 == 0 && sanitizer[i].active)
        {
            sanitizer[i].aniState = (sanitizer[i].aniState + 1) % sanitizer[i].numFrames;
        }
        sanitizer[i].aniCounter++;
    }
}
