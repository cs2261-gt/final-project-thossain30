# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 342 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1





extern int lost;
extern int won;
extern int TPCollected;
int hOff;
int vOff;



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

extern TOILETPAPER paper[10];
extern ANISPRITE player;
# 3 "main.c" 2
# 1 "gameBackground.h" 1
# 22 "gameBackground.h"
extern const unsigned short gameBackgroundTiles[2752];


extern const unsigned short gameBackgroundMap[2048];


extern const unsigned short gameBackgroundPal[256];
# 4 "main.c" 2
# 1 "winBackground.h" 1
# 22 "winBackground.h"
extern const unsigned short winBackgroundTiles[720];


extern const unsigned short winBackgroundMap[1024];


extern const unsigned short winBackgroundPal[256];
# 5 "main.c" 2
# 1 "MenuBackground.h" 1
# 22 "MenuBackground.h"
extern const unsigned short MenuBackgroundTiles[11072];


extern const unsigned short MenuBackgroundMap[1024];


extern const unsigned short MenuBackgroundPal[256];
# 6 "main.c" 2
# 1 "loseBackground.h" 1
# 22 "loseBackground.h"
extern const unsigned short loseBackgroundTiles[1104];


extern const unsigned short loseBackgroundMap[1024];


extern const unsigned short loseBackgroundPal[256];
# 7 "main.c" 2
# 1 "pauseBackground.h" 1
# 22 "pauseBackground.h"
extern const unsigned short pauseBackgroundTiles[1664];


extern const unsigned short pauseBackgroundMap[1024];


extern const unsigned short pauseBackgroundPal[256];
# 8 "main.c" 2
# 1 "instructionBackground.h" 1
# 22 "instructionBackground.h"
extern const unsigned short instructionBackgroundTiles[6928];


extern const unsigned short instructionBackgroundMap[1024];


extern const unsigned short instructionBackgroundPal[256];
# 9 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 10 "main.c" 2


void initialize();
void goToMenu();
void menu();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();

void srand();
void rand();

enum
{
    MENU,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    LOSE,
    WIN
};
int state;

unsigned short buttons;
unsigned short oldButtons;

int seed;
int TPCollected;
int lost;
int won;

int main()
{

    while (1)
    {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state)
        {
        case MENU:
            menu();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case LOSE:
            lose();
            break;
        case WIN:
            win();
            break;
        }
    }
    return 0;
}

void initialize()
{
    TPCollected = 0;


    DMANow(3, MenuBackgroundPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, MenuBackgroundTiles, &((charblock *)0x6000000)[0], 22144 / 2);
    DMANow(3, MenuBackgroundMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<7) | (0<<14);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
}
void goToMenu()
{


    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = MENU;


    seed = 0;
}
void menu()
{
    initialize();
    seed++;
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToGame();
        initGame();
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))
    {
        goToInstructions();
    }
}
void goToInstructions()
{
    DMANow(3, instructionBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructionBackgroundTiles, &((charblock *)0x6000000)[1], 13856 / 2);
    DMANow(3, instructionBackgroundMap, &((screenblock *)0x6000000)[21], 2048 / 2);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((21)<<8) | (0<<14) | (0<<7);
    (*(unsigned short *)0x4000000) = 0 | (1<<9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = INSTRUCTIONS;
}
void instructions()
{
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
    {
        goToMenu();
    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        srand(seed);
        goToGame();
        initGame();
    }
}

void gotoPause()
{
    DMANow(3, pauseBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseBackgroundTiles, &((charblock *)0x6000000)[1], 3328 / 2);
    DMANow(3, pauseBackgroundMap, &((screenblock *)0x6000000)[19], 2048 / 2);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((19)<<8) | (0<<14);
    (*(unsigned short *)0x4000000) = 0 | (1<<9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = PAUSE;
}
void pause()
{
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
        goToGame();
    else if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
        goToMenu();
}
void goToLose()
{
    DMANow(3, loseBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseBackgroundTiles, &((charblock *)0x6000000)[1], 2208 / 2);
    DMANow(3, loseBackgroundMap, &((screenblock *)0x6000000)[17], 2048 / 2);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((17)<<8) | (0<<14);
    (*(unsigned short *)0x4000000) = 0 | (1<<9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = LOSE;
}
void lose()
{
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToMenu();
    }
}
void goToWin()
{
    DMANow(3, winBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, winBackgroundTiles, &((charblock *)0x6000000)[1], 1440 / 2);
    DMANow(3, winBackgroundMap, &((screenblock *)0x6000000)[18], 2048 / 2);
    (*(volatile unsigned short*)0x400000A) = ((1)<<2) | ((18)<<8) | (0<<14);
    (*(unsigned short *)0x4000000) = 0 | (1<<9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = WIN;
}
void win()
{
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToMenu();
    }
}
void goToGame()
{
    DMANow(3, gameBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameBackgroundTiles, &((charblock *)0x6000000)[0], 5504 / 2);
    DMANow(3, gameBackgroundMap, &((screenblock *)0x6000000)[24], 4096 / 2);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((24)<<8) | (1<<14) | (1<<7);
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = GAME;
}
void game()
{
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))
    {
        goToWin();
    }
    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))))
    {
        goToLose();
    }
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        gotoPause();
    }
}
