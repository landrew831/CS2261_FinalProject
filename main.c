/************************************************************************************
Spongebob's Jellyfishing Adventure

This is a game where the player has to collect jellyfish using
a jellyfishing net and bring it back to the Krusty Krab for
points. The player can only carry at most 3 jellyfish at a time.
There is a King Jellyfish that roams the map and will send the
player back to the Krusty Krab without any jellyfish if the player has at least one
and will chase the player as long as the player has at least one jellyfish.

The player can collect jellyfish by pressing A near them and
can deposit the jellyfish by approaching the doors of the Krusty Krab and pressing B. If
Spongebob collides with the King Jellyfish when he has at least one, Spongebob
will lose all the jellyfish he has captured and be sent back to the Krusty Krab.
There is one blue jellyfish that is worth 3 points if captured.
In addition, Spongebob now has a swinging animation when the player presses A.

BUGS:
    None

CHEAT:
    Pressing Select while in the start screen will make the King Jellyfish not chase
    the player no matter how many jellyfish the player is holding nor will he send the
    player back to the Krusty Krab if they touch each other. The King Jellyfish will also
    turn into King Boo from Mario and fade in and out (alpha blending).

EXTRA STUFF:
    Alpha blending: Code is in goToGame(), goToPause(), goToEnd(), and the attribute
        is turned on in drawKingJellyfish() in game.c. The weights of the layers is in
        drawGame() in game.c
************************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "StartScreen.h"
#include "InstructionScreen.h"
#include "PauseScreen.h"
#include "EndScreen.h"
#include "EndUI.h"
#include "bg.h"
#include "UI.h"
#include "Bubbles.h"
#include "FishtankBubbles.h"
#include "Technique.h"
#include "FUNsong.h"
#include "Tomfoolery.h"


// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstruction();
void instruction();
void goToGame();
void game();
void goToPause();
void pause();
void goToEnd();
void end();

// States
enum {START, INSTRUCTION, GAME, PAUSE, END};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

// Vertical and Horizontal Offset values
unsigned short vOff;
unsigned short hOff;

// Cheat code flag
int cheat;



int main() {

    initialize();

    while(1) {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTION:
                instruction();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case END:
                end();
                break;
        }

    }
}

// Sets up GBA
void initialize() {
    // Turn on the backgrounds and sprites
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    // Initialize the horizontal and vertical offset
    hOff = 0;
    vOff = 0;
    buttons = BUTTONS;

    // Sets up the sounds and interrupts
    setupSounds();
    setupInterrupts();

    // Set up the first state
    goToStart();
}

// Sets up the start state
void goToStart() {
    // Plays the start scren music
    playSoundA(FUNsong, FUNSONGLEN, FUNSONGFREQ, 1);
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    // Overlay two backgrounds on each other
    loadPalette(StartScreenPal);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);
    DMANow(3, BubblesTiles, &CHARBLOCK[0], BubblesTilesLen / 2);
    DMANow(3, BubblesMap, &SCREENBLOCK[30], BubblesMapLen / 2);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(31);
    DMANow(3, StartScreenTiles, &CHARBLOCK[1], StartScreenTilesLen / 2);
    DMANow(3, StartScreenMap, &SCREENBLOCK[31], StartScreenMapLen / 2);

    waitForVBlank();

    // Hides sprites
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Turns the cheat flag off
    cheat = 0;

    // Begin the seed randomization
    seed = 0;

    state = START;
}

// Runs every frame of the start state
void start() {
    seed++;
    // Increase the horizontal offset and move BG0 every frame
    vOff++;
    REG_BG0VOFF = vOff / 3;

    // Caps framerate
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        vOff = 0;
        REG_BG0VOFF = vOff;
        goToInstruction();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        cheat = 1;
    }
}

// Sets up the Instruction state
void goToInstruction() {
    // Plays the instruction screen music
    playSoundA(Technique, TECHNIQUELEN, TECHNIQUEFREQ, 1);

    // Background stuff for the instruction screen
    loadPalette(InstructionScreenPal);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);
    DMANow(3, InstructionScreenTiles, &CHARBLOCK[1], InstructionScreenTilesLen / 2);
    DMANow(3, InstructionScreenMap, &SCREENBLOCK[30], InstructionScreenMapLen / 2);

    // locks fps to 60
    waitForVBlank();

    // Hides sprites
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = INSTRUCTION;
}

// Instruction game state
void instruction() {
    // locks fps to 60
    waitForVBlank();

    // Allows the user to scroll up and down to read the instructions
    if (BUTTON_HELD(BUTTON_UP)) {
        if (vOff > 0) {
            vOff--;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        if (vOff < 96) {
            vOff++;
        }
    }

    // Moves the camera
    REG_BG0VOFF = vOff;

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {

        // Seed the random generator
        srand(seed);

        // Reset the Horizontal offset
        vOff = 0;
        hOff = 0;
        REG_BG0VOFF = vOff;
        REG_BG0HOFF = hOff;

        // Plays the game music
        playSoundA(Tomfoolery, TOMFOOLERYLEN, TOMFOOLERYFREQ, 1);

        goToGame();
        initGame();
    }
}
// Sets up the game state
void goToGame() {
    // Change the background to the game background
    loadPalette(bgPal);
    DMANow(3, UITiles, &CHARBLOCK[0], UITilesLen / 2);
    DMANow(3, UIMap, &SCREENBLOCK[27], UIMapLen / 2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(27);
    DMANow(3, bgTiles, &CHARBLOCK[1], bgTilesLen / 2);
    DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen / 2);
    REG_BG1CNT = BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);

    // Sets up the blending register
    REG_BLDMOD = BG1_B | OBJ_B | BACKDROP_B | BG0_B | NORMAL_TRANS;
    state = GAME;
}

// Runs every frame of the game state
void game() {
    updateGame();
    drawGame();

    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        pauseSound();
        goToPause();
    } else if (time <= 0) {
        vOff = 0;
        hOff = 0;
        REG_BG1HOFF = hOff;
        REG_BG1VOFF = vOff;
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;
        goToEnd();
    }
}

// Sets up the pause state
void goToPause() {
    // Change the background to the pause screen
    loadPalette(PauseScreenPal);
    DMANow(3, PauseScreenTiles, &CHARBLOCK[0], PauseScreenTilesLen / 2);
    DMANow(3, PauseScreenMap, &SCREENBLOCK[31], PauseScreenMapLen / 2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    // Hides all sprites
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Turns blending off during the pause screen
    REG_BLDMOD = 0;
    REG_COLEV = 0;


    waitForVBlank();


    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    // Caps framerate
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSound();
        goToGame();
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        vOff = 0;
        hOff = 0;
        REG_BG1HOFF = hOff;
        REG_BG1VOFF = vOff;
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;

        goToStart();
    }
}

// Sets up the end state
void goToEnd() {
    // Stops any sounds from the game from carrying over
    stopSound();
    // Plays the end screen music
    playSoundA(FishtankBubbles, FISHTANKBUBBLESLEN, FISHTANKBUBBLESFREQ, 1);

    // Change the background to the end screen
    loadPalette(EndScreenPal);
    DMANow(3, EndUITiles, &CHARBLOCK[0], EndUITilesLen / 2);
    DMANow(3, EndUIMap, &SCREENBLOCK[29], EndUIMapLen / 2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(29);
    DMANow(3, EndScreenTiles, &CHARBLOCK[1], EndScreenTilesLen / 2);
    DMANow(3, EndScreenMap, &SCREENBLOCK[30], EndScreenMapLen / 2);
    REG_BG1CNT = BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    // Hides all sprites and draws the player's final score
    hideSprites();
    drawNumber(66, 136, score, 120);
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Turns off blending
    REG_BLDMOD = 0;
    REG_COLEV = 0;

    waitForVBlank();

    state = END;
}

// Runs every frame of the end state
void end() {
    // Caps framerate
    waitForVBlank();

    hOff++;
    REG_BG1HOFF = hOff / 3;

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        vOff = 0;
        hOff = 0;
        REG_BG1HOFF = hOff;
        REG_BG1VOFF = vOff;
        REG_BG0HOFF = hOff;
        REG_BG0VOFF = vOff;

        goToStart();
    }
}

