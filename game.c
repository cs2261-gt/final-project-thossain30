#include "game.h"
#include "myLib.h"
#include "spritesheet.h"
#include <stdlib.h>

int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
extern int lost;
extern int won;
extern int TPCollected;
TOILETPAPER paper[TOTALPAPER];
ANISPRITE player;
CUSTOMER customers[TOTALCUSTOMER];
int playerTimer;

void initPlayer()
{
    player.curFrame = 0;
    player.aniState = 0;
    player.cdel = 1;
    player.rdel = 1;
    player.height = 32;
    player.width = 32;
    player.worldRow = SCREENHEIGHT / 2 - player.width / 2 + vOff;
    player.worldCol = SCREENWIDTH / 2 - player.height / 2 + hOff;
}
void drawPlayer()
{
    shadowOAM[0].attr0 = player.screenRow | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.screenCol | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame * 4, player.aniState * 4) | ATTR2_PALROW(0);
}
void updatePlayer()
{
    playerTimer++;
    if (BUTTON_HELD(BUTTON_LEFT))
    {
        if (player.screenCol > 0)
        {
            player.worldCol -= player.cdel;
            if (hOff >= 0 && player.screenCol < SCREENWIDTH / 2)
            {
                hOff--;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT))
    {
        if (player.worldCol + player.width - 1 < MAPWIDTH - 1)
        {
            player.worldCol += player.cdel;
            if (hOff < MAPWIDTH - SCREENWIDTH && player.screenCol > SCREENWIDTH / 2)
            {
                hOff++;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_UP))
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
    if (BUTTON_HELD(BUTTON_DOWN))
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
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
}
void initPaper()
{
    for (int i = 0; i < TOTALPAPER; i++)
    {
        paper[i].worldCol = (rand() % 479) + 5;
        paper[i].worldRow = (rand() % 220) + 5;
        paper[i].width = 32;
        paper[i].height = 32;
        paper[i].aniState = 0;
        paper[i].curFrame = 1;
        paper[i].active = 1;
    }
}
void drawPaper()
{
    for (int i = 0; i < TOTALPAPER; i++)
    {
        if (paper[i].active)
        {
            shadowOAM[i + 1].attr0 = paper[i].screenRow | ATTR0_SQUARE;
            shadowOAM[i + 1].attr1 = paper[i].screenCol | ATTR1_MEDIUM;
            shadowOAM[i + 1].attr2 = ATTR2_TILEID(paper[i].aniState * 4, paper[i].curFrame * 4);
        }
        if (paper[i].active == 0 || vOff > paper[i].worldRow || hOff > paper[i].worldCol)
        {
            shadowOAM[i + 1].attr0 = ATTR0_HIDE;
        }
    }
}
void updatePaper()
{

    for (int i = 0; i < TOTALPAPER; i++)
    {

        if (collision(player.worldCol, player.worldRow, player.width, player.height,
                      paper[i].worldCol, paper[i].worldRow, paper[i].width, paper[i].height) &&
            paper[i].active)
        {
            paper[i].active = 0;
            TPCollected++;
        }
        if (TPCollected == TOTALPAPER)
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
        customers[i].worldCol = (rand() % 479) + 10;
        customers[i].worldRow = (rand() % 220) + 10;
    }
}
void initGame()
{
    vOff = 96;
    hOff = 9;

    initPlayer();
    initPaper();

    TPCollected = 0;
    won = 0;
    lost = 0;
    playerTimer = 0;
}
void updateGame()
{
    updatePaper();
    updatePlayer();
}
void drawGame()
{
    drawPlayer();
    drawPaper();
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
}
