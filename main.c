#include "myLib.h"
#include "game.h"
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

void initialize() {}
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
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_A))
    {
        GoToInstructions();
    }
}
void goToInstructions()
{
    DMANow(3, instructionBackgroundPal, PALETTE, instructionBackgroundPalLen / 2);
    DMANow(3, instructionBackgroundTiles, &CHARBLOCK[1], instructionBackgroundTilesLen / 2);
    DMANow(3, instructionBackgroundMap, &SCREENBLOCK[21], instructionBackgroundMapLen / 2);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(21) | BG_SIZE_SMALL;
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
        goToGame();
    }
}
void goToGame()
{
    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = GAME;
}
void game() {}
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
        goToStart();
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