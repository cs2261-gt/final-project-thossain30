#include "game.h"
#include "myLib.h"
#include "spritesheet.h"
#include <stdlib.h>

OBJ_ATTR shadowOAM[128];
extern int lost;
extern int won;
extern int TPCollected;
TOILETPAPER paper[TOTALPAPER];
int playerTimer;

void initPlayer()
{
    player.curFrame = 0;
    player.aniState = 0;
    player.cdel = 1;
    player.rdel = 1;
    player.height = 32;
    player.width = 32;
    player.worldRow = 200;
    player.worldCol = 140;
    player.hide = 1;
}
void initPaper()
{
    for (int i = 0; i < TOTALPAPER; i++)
    {
        paper[i].col = (rand() % 500) + 5;
        paper[i].row = (rand() % 240) + 5;
        paper[i].width = 32;
        paper[i].height = 32;
        paper[i].aniState = 0;
        paper[i].curFrame = 1;
        paper[i].active = 1;
    }
}
void initGame()
{
    initPlayer();
    initPaper();

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    TPCollected = 0;
    won = 0;
    lost = 0;
    playerTimer = 0;
}