#include "myLib.h"
#include "game.h"
#include "gameBackground.h"
#include "winBackground.h"
#include "MenuBackground.h"
#include "loseBackground.h"
#include "pauseBackground.h"
#include "instructionBackground.h"
#include "spritesheet.h"

// Prototypes
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
int playerHealth;
int lost;
int won;

int main()
{

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
    vOff = 0;
    hOff = 0;
    playerHoff = 0;
    lost = 0;
    won = 0;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // Load the background's palette and tiles into a desired space in memory
    DMANow(3, MenuBackgroundPal, PALETTE, 256);
    DMANow(3, MenuBackgroundTiles, &CHARBLOCK[0], MenuBackgroundTilesLen / 2);
    DMANow(3, MenuBackgroundMap, &SCREENBLOCK[24], MenuBackgroundMapLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(24) | BG_8BPP | BG_SIZE_WIDE;

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
}
void goToMenu()
{

    // hide sprites in goTo methods
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = MENU;

    // Begin the seed randomization
    seed = 0;
}
void menu()
{
    initialize();
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_A))
    {
        goToInstructions();
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
        srand(seed);
        initGame();
        goToGame();
    }
}

void gotoPause()
{
    DMANow(3, pauseBackgroundPal, PALETTE, loseBackgroundPalLen / 2);
    DMANow(3, pauseBackgroundTiles, &CHARBLOCK[1], pauseBackgroundTilesLen / 2);
    DMANow(3, pauseBackgroundMap, &SCREENBLOCK[19], pauseBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(19) | BG_SIZE_SMALL;
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
        goToGame();
    else if (BUTTON_PRESSED(BUTTON_SELECT))
        goToMenu();
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
        goToMenu();
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
        goToMenu();
    }
}
void goToGame()
{
    DMANow(3, gameBackgroundPal, PALETTE, gameBackgroundPalLen / 2);
    DMANow(3, gameBackgroundTiles, &CHARBLOCK[0], gameBackgroundTilesLen / 2);
    DMANow(3, gameBackgroundMap, &SCREENBLOCK[28], gameBackgroundMapLen / 2);
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE;
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

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
    }
    if (lost)
    {
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_START))
    {
        gotoPause();
    }
}