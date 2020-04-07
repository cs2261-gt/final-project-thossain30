#include "myLib.h"

#define MAPWIDTH 512
#define MAPHEIGHT 256

extern int lost;
extern int won;
extern int TPCollected;
int hOff;
int vOff;

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
void initCustomer();
void drawCustomer();
void updateCustomer();

typedef struct
{
    int screenRow;
    int screenCol;
    int worldCol;
    int worldRow;
    int height;
    int width;
    int curFrame;
    int aniState;
    int active;
} TOILETPAPER;

extern TOILETPAPER paper[TOTALPAPER];
extern ANISPRITE player;
