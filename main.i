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
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
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




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "myLib.h"
void hideSprites();






typedef struct
{
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
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 343 "myLib.h"
typedef struct
{
    const unsigned char *data;
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
int playerHoff;
int screenBlock;
int totalPaper;






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

extern TOILETPAPER paper[22];
extern CUSTOMER customers[6];
extern ANISPRITE player;
extern SANITIZER sanitizer[6];
extern HEART hearts[3];
# 3 "main.c" 2
# 1 "gameBackground.h" 1
# 22 "gameBackground.h"
extern const unsigned short gameBackgroundTiles[7184];


extern const unsigned short gameBackgroundMap[4096];


extern const unsigned short gameBackgroundPal[256];
# 4 "main.c" 2
# 1 "winBackground.h" 1
# 22 "winBackground.h"
extern const unsigned short winBackgroundTiles[5424];


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
extern const unsigned short loseBackgroundTiles[6512];


extern const unsigned short loseBackgroundMap[1024];


extern const unsigned short loseBackgroundPal[256];
# 7 "main.c" 2
# 1 "pauseBackground.h" 1
# 22 "pauseBackground.h"
extern const unsigned short pauseBackgroundTiles[5312];


extern const unsigned short pauseBackgroundMap[1024];


extern const unsigned short pauseBackgroundPal[256];
# 8 "main.c" 2
# 1 "instructionBackground.h" 1
# 22 "instructionBackground.h"
extern const unsigned short instructionBackgroundTiles[6928];


extern const unsigned short instructionBackgroundMap[1024];


extern const unsigned short instructionBackgroundPal[256];
# 9 "main.c" 2
# 1 "diffBackground.h" 1
# 22 "diffBackground.h"
extern const unsigned short diffBackgroundTiles[1120];


extern const unsigned short diffBackgroundMap[1024];


extern const unsigned short diffBackgroundPal[256];
# 10 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 11 "main.c" 2
# 1 "sound.h" 1
SOUND soundA;
SOUND soundB;



void setupSounds();
void playSoundA(const signed char *sound, int length, int loops);
void playSoundB(const signed char *sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSoundA();
void pauseSoundB();
void unpauseSoundA();
void unpauseSoundB();
void stopSound();
void stopSoundA();
void stopSoundB();
# 12 "main.c" 2
# 1 "menuSong.h" 1
# 20 "menuSong.h"
extern const unsigned char menuSong[317934];
# 13 "main.c" 2
# 1 "loseSong.h" 1
# 20 "loseSong.h"
extern const unsigned char loseSong[374131];
# 14 "main.c" 2
# 1 "winSong.h" 1
# 20 "winSong.h"
extern const unsigned char winSong[318006];
# 15 "main.c" 2
# 1 "gameSong.h" 1
# 20 "gameSong.h"
extern const unsigned char gameSong[1100494];
# 16 "main.c" 2
# 1 "pauseNoise.h" 1
# 20 "pauseNoise.h"
extern const unsigned char pauseNoise[84562];
# 17 "main.c" 2
# 1 "owSound.h" 1
# 20 "owSound.h"
extern const unsigned char owSound[3516];
# 18 "main.c" 2
# 1 "punchSound.h" 1
# 20 "punchSound.h"
extern const unsigned char punchSound[4206];
# 19 "main.c" 2
# 1 "collectSound.h" 1
# 20 "collectSound.h"
extern const unsigned char collectSound[12384];
# 20 "main.c" 2
# 1 "sanSound.h" 1
# 20 "sanSound.h"
extern const unsigned char sanSound[13967];
# 21 "main.c" 2
# 40 "main.c"
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
void goToDifficulty();
void difficulty();

void srand();
void rand();

enum
{
    MENU,
    INSTRUCTIONS,
    DIFFICULTY,
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
int playerHealth;
int totalPaper;
int lost;
int won;

int main()
{
    initialize();
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
        case DIFFICULTY:
            difficulty();
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
    playerHealth = 3;
    lost = 0;
    won = 0;
    setupInterrupts();
    setupSounds();

    goToMenu();
}
void goToMenu()
{
    hOff = 0;
    playerHoff = 0;
    vOff = 0;
    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;


    DMANow(3, MenuBackgroundPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, MenuBackgroundTiles, &((charblock *)0x6000000)[0], 22144 / 2);
    DMANow(3, MenuBackgroundMap, &((screenblock *)0x6000000)[24], 2048 / 2);
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | ((24) << 8) | (1 << 7) | (1 << 14);

    (*(unsigned short *)0x4000000) = 0 | (1 << 8) | (1 << 12);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    stopSound();
    playSoundA(menuSong, 317934, 1);

    state = MENU;


    seed = 0;
}
void menu()
{
    seed++;
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))
    {
        goToDifficulty();




    }
    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))))
    {
        goToInstructions();
    }
}

void goToDifficulty()
{
    DMANow(3, diffBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, diffBackgroundTiles, &((charblock *)0x6000000)[1], 2240 / 2);
    DMANow(3, diffBackgroundMap, &((screenblock *)0x6000000)[23], 2048 / 2);
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((23) << 8) | (0 << 14) | (0 << 7);
    (*(unsigned short *)0x4000000) = 0 | (1 << 9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = DIFFICULTY;
}
void difficulty()
{
    waitForVBlank();

    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))))
    {
        totalPaper = 10;
        srand(seed);
        stopSound();
        playSoundA(gameSong, 1100494, 1);
        initGame();
        goToGame();
    }

    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))))
    {
        totalPaper = 22;
        srand(seed);
        stopSound();
        playSoundA(gameSong, 1100494, 1);
        initGame();
        goToGame();
    }
}
void goToInstructions()
{
    DMANow(3, instructionBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructionBackgroundTiles, &((charblock *)0x6000000)[1], 13856 / 2);
    DMANow(3, instructionBackgroundMap, &((screenblock *)0x6000000)[21], 2048 / 2);
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((21) << 8) | (0 << 14) | (0 << 7);
    (*(unsigned short *)0x4000000) = 0 | (1 << 9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = INSTRUCTIONS;
}
void instructions()
{
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2)))))
    {
        goToMenu();
    }
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))
    {
        goToDifficulty();
    }
}

void gotoPause()
{
    playSoundB(pauseNoise, 84562, 1);
    DMANow(3, pauseBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseBackgroundTiles, &((charblock *)0x6000000)[1], 10624 / 2);
    DMANow(3, pauseBackgroundMap, &((screenblock *)0x6000000)[19], 2048 / 2);
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((19) << 8) | (0 << 14) | (1 << 7);
    (*(unsigned short *)0x4000000) = 0 | (1 << 9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = PAUSE;
}
void pause()
{
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))
    {
        stopSoundB();
        goToGame();
    }
    else if ((!(~(oldButtons) & ((1 << 2))) && (~buttons & ((1 << 2)))))
    {
        stopSound();
        playSoundA(menuSong, 317934, 1);
        goToMenu();
    }
}
void goToLose()
{
    DMANow(3, loseBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseBackgroundTiles, &((charblock *)0x6000000)[1], 13024 / 2);
    DMANow(3, loseBackgroundMap, &((screenblock *)0x6000000)[17], 2048 / 2);
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((17) << 8) | (0 << 14);
    (*(unsigned short *)0x4000000) = 0 | (1 << 9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = LOSE;
}
void lose()
{
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))
    {
        stopSound();
        goToMenu();
        playSoundA(menuSong, 317934, 1);
    }
}
void goToWin()
{
    DMANow(3, winBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, winBackgroundTiles, &((charblock *)0x6000000)[1], 10848 / 2);
    DMANow(3, winBackgroundMap, &((screenblock *)0x6000000)[18], 2048 / 2);
    (*(volatile unsigned short *)0x400000A) = ((1) << 2) | ((18) << 8) | (0 << 14);
    (*(unsigned short *)0x4000000) = 0 | (1 << 9);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = WIN;
}
void win()
{
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))
    {
        stopSound();
        playSoundA(menuSong, 317934, 1);
        goToMenu();
    }
}
void goToGame()
{
    unpauseSoundA();
    DMANow(3, gameBackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, gameBackgroundTiles, &((charblock *)0x6000000)[0], 14368 / 2);
    DMANow(3, gameBackgroundMap, &((screenblock *)0x6000000)[28], 8192 / 2);
    (*(volatile unsigned short *)0x4000008) = ((0) << 2) | ((28) << 8) | (1 << 14);
    (*(unsigned short *)0x4000000) = 0 | (1 << 8) | (1 << 12);

    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000010) = hOff;

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    state = GAME;
}
void game()
{
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);

    if (won)
    {
        goToWin();
        stopSound();
        playSoundA(winSong, 318006, 1);
    }
    if (lost)
    {
        goToLose();
        stopSound();
        playSoundA(loseSong, 374131, 1);
    }
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))
    {
        pauseSoundA();
        gotoPause();
    }
}
