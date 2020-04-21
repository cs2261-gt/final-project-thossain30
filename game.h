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

#define TOTALCUSTOMER 4
#define TOTALPAPER 20
#define TOTALSAN 6
#define TOTALHEARTS 5

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
void initEScore();
void drawEScore();
void initHScore();
void drawHScore();
void initTDigit();
void initODigit();
void drawTDigit();
void drawODigit();
void animateSprites();

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

//for hearts/health
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

//for all score related stuff
typedef struct score
{
    int width;
    int height;
    int curFrame;
    int aniState;
    int screenRow;
    int screenCol;
} ESCORE, HSCORE, TDIGIT, ODIGIT;

extern TOILETPAPER paper[TOTALPAPER];
extern CUSTOMER customers[TOTALCUSTOMER];
extern ANISPRITE player;
extern SANITIZER sanitizer[TOTALSAN];
extern HEART hearts[TOTALHEARTS];
extern ESCORE escore;
extern HSCORE hscore;
extern TDIGIT tDigit;
extern ODIGIT oDigit;
