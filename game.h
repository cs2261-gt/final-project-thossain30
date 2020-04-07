#include "myLib.h"

extern int lost;
extern int won;
extern int TPCollected;

#define TOTALPAPER 10

void initGame();
void drawGame();
void updateGame();
void initPlayer();
void drawPlayer();
void updatePlayer();
void initPaper();
void drawPaper();
void updatePaper();

typedef struct paper
{
    int row;
    int col;
    int height;
    int width;
    int curFrame;
    int aniState;
    int active;
} TOILETPAPER;

extern TOILETPAPER paper[TOTALPAPER];
extern ANISPRITE player;
