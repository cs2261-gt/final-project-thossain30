#include "myLib.h"
#include "game.h"
#include "gameBackground.h"
#include "winBackground.h"
#include "MenuBackground.h"
#include "loseBackground.h"
#include "pauseBackground.h"
#include "instructionBackground.h"
#include "diffBackground.h"
#include "spritesheet.h"
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

/*completed
Finished Spritesheet
implemented Collision bitmap
Added sanitizer
Added in sprites for health (hearts)
Finished art for other background states
Animation for collectables
Animation for characters (player and enemy)
Completed sound
Added in number score
Added alpha blending
*/


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

s32 lu_sin(u32 theta);
s32 lu_cos(u32 theta);

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
enum
{
    EASY,
    HARD
};
int state;
extern int diff;

extern s16 sin_lut[514];

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
        buttons = BUTTONS;

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
    playerHealth = 4;
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
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // Load the background's palette and tiles into a desired space in memory
    DMANow(3, MenuBackgroundPal, PALETTE, 256);
    DMANow(3, MenuBackgroundTiles, &CHARBLOCK[0], MenuBackgroundTilesLen / 2);
    DMANow(3, MenuBackgroundMap, &SCREENBLOCK[24], MenuBackgroundMapLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_8BPP | BG_SIZE_WIDE;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    // hide sprites in goTo methods
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    stopSound();
    playSoundA(menuSong, MENUSONGLEN - 100, 1);

    state = MENU;

    // Begin the seed randomization
    seed = 0;
}
void menu()
{
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToDifficulty();
    }
    if (BUTTON_PRESSED(BUTTON_A))
    {
        goToInstructions();
    }
}

void goToDifficulty()
{
    DMANow(3, diffBackgroundPal, PALETTE, diffBackgroundPalLen / 2);
    DMANow(3, diffBackgroundTiles, &CHARBLOCK[1], diffBackgroundTilesLen / 2);
    DMANow(3, diffBackgroundMap, &SCREENBLOCK[23], diffBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(23) | BG_SIZE_SMALL | BG_4BPP;
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = DIFFICULTY;
}
void difficulty()
{
    waitForVBlank();
    //Easy mode (cheat)
    if (BUTTON_PRESSED(BUTTON_A))
    {
        totalPaper = 10;
        diff = EASY;
        srand(seed);
        stopSound();
        playSoundA(gameSong, GAMESONGLEN - 120, 1);
        initGame();
        goToGame();
    }
    //Hard mode (not cheat)
    if (BUTTON_PRESSED(BUTTON_B))
    {
        totalPaper = 20;
        diff = HARD;
        srand(seed);
        stopSound();
        playSoundA(gameSong, GAMESONGLEN - 120, 1);
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToMenu();
    }
}
void goToInstructions()
{
    DMANow(3, instructionBackgroundPal, PALETTE, instructionBackgroundPalLen / 2);
    DMANow(3, instructionBackgroundTiles, &CHARBLOCK[1], instructionBackgroundTilesLen / 2);
    DMANow(3, instructionBackgroundMap, &SCREENBLOCK[21], instructionBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(21) | BG_SIZE_SMALL | BG_4BPP;
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = INSTRUCTIONS;
}
void instructions()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToMenu();
    }
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToDifficulty();
    }
}

void gotoPause()
{
    playSoundB(pauseNoise, PAUSENOISELEN, 1);
    DMANow(3, pauseBackgroundPal, PALETTE, loseBackgroundPalLen / 2);
    DMANow(3, pauseBackgroundTiles, &CHARBLOCK[1], pauseBackgroundTilesLen / 2);
    DMANow(3, pauseBackgroundMap, &SCREENBLOCK[19], pauseBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(19) | BG_SIZE_SMALL | BG_8BPP;
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = PAUSE;
}
void pause()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        stopSoundB();
        unpauseSoundA();
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        stopSound();
        playSoundA(menuSong, MENUSONGLEN - 110, 1);
        goToMenu();
    }
}
void goToLose()
{
    DMANow(3, loseBackgroundPal, PALETTE, loseBackgroundPalLen / 2);
    DMANow(3, loseBackgroundTiles, &CHARBLOCK[1], loseBackgroundTilesLen / 2);
    DMANow(3, loseBackgroundMap, &SCREENBLOCK[17], loseBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(17) | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = LOSE;
}
void lose()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        stopSound();
        goToMenu();
        playSoundA(menuSong, MENUSONGLEN - 110, 1);
    }
}
void goToWin()
{
    DMANow(3, winBackgroundPal, PALETTE, winBackgroundPalLen / 2);
    DMANow(3, winBackgroundTiles, &CHARBLOCK[1], winBackgroundTilesLen / 2);
    DMANow(3, winBackgroundMap, &SCREENBLOCK[18], winBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(18) | BG_SIZE_SMALL;
    REG_DISPCTL = MODE0 | BG1_ENABLE;

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = WIN;
}
void win()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        stopSound();
        playSoundA(menuSong, MENUSONGLEN - 120, 1);
        goToMenu();
    }
}
void goToGame()
{
    DMANow(3, gameBackgroundPal, PALETTE, gameBackgroundPalLen / 2);
    DMANow(3, gameBackgroundTiles, &CHARBLOCK[0], gameBackgroundTilesLen / 2);
    DMANow(3, gameBackgroundMap, &SCREENBLOCK[28], gameBackgroundMapLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE | 2;
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BLDCNT = BLD_STD | BLD_WHITE | BLD_OBJa | BLD_BG0b;

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);

    state = GAME;
}
void game()
{
    updateGame();
    drawGame();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    if (won)
    {
        goToWin();
        stopSound();
        playSoundA(winSong, WINSONGLEN - 120, 1);
    }
    if (lost)
    {
        goToLose();
        stopSound();
        playSoundA(loseSong, LOSESONGLEN - 120, 1);
    }
    if (BUTTON_PRESSED(BUTTON_START))
    {
        pauseSoundA();
        gotoPause();
    }
}