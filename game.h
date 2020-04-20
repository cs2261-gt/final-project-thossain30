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
int totalPaper;

#define TOTALCUSTOMER 6
#define TOTALPAPER 30
#define TOTALSAN 6
#define TOTALHEARTS 3

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
void initSanitizer();
void drawSanitizer();
void updateSanitizer();
void initHeart();
void drawHeart();

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
    int aniCounter;
    int numFrames;
} TOILETPAPER, SANITIZER;
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
    int prevAniState;
    int active;
    int follow;
    int numFrames;
    int aniCounter;
} CUSTOMER;
typedef struct
{
    int screenRow;
    int screenCol;
    int height;
    int width;
    int active;
    int curFrame;
    int aniState;
} HEART;

extern TOILETPAPER paper[TOTALPAPER];
extern CUSTOMER customers[TOTALCUSTOMER];
extern ANISPRITE player;
extern SANITIZER sanitizer[TOTALSAN];
extern HEART hearts[TOTALHEARTS];
