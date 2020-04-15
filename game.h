#include "myLib.h"

#define MAPWIDTH 1024
#define MAPHEIGHT 256

extern int lost;
extern int won;
extern int TPCollected;
int hOff;
int vOff;
int playerHoff;
int screenBlock;

#define TOTALPAPER 10
#define TOTALCUSTOMER 3

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

typedef struct pool
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
typedef struct
{
    int screenRow;
    int screenCol;
    int worldCol;
    int worldRow;
    int height;
    int width;
    int livesRemaining;
    int curFrame;
    int aniState;
    int active;
    int follow;
} CUSTOMER;

extern TOILETPAPER paper[TOTALPAPER];
extern CUSTOMER customers[TOTALCUSTOMER];
extern ANISPRITE player;
