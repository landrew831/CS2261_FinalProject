#include <stdlib.h>
#include "myLib.h"
#include "game.h"
#include "bg.h"
#include "UI.h"
#include "spritesheet.h"
#include "collisionmap.h"
#include "Coin.h"
#include "Money.h"
#include "Screaming.h"
#include "Whoosh.h"


// Variables
ANISPRITE player;
ANISPRITE kingJellyfish;
ANISPRITE jellyfishes[JELLYFISHCOUNT];
ANISPRITE noName;
int score;
int numCaptured;
int time;

// Alpha blending variables
int changeBlending;
int ghost_blend = 16;

OBJ_ATTR shadowOAM[128];

// Enum for animation states of Spongebob
enum {SPONGERIGHT, SPONGELEFT, SPONGEBACK, SPONGEFRONT, SPONGESWING, SPONGEIDLE};

// Initialize the game
void initGame() {
    // Initialize the player, jellyfishes, the King Jellyfish, and No Name
    initPlayer();
    initJellyfish();
    initKingJellyfish();
    initNoName();

    // Initializes the score, number of jellyfish Spongebob is carrying, the time, and the blending cooldown and weight
    score = 0;
    numCaptured = 0;
    time = 3600;
    changeBlending = 5;
    ghost_blend = 16;

    // Load the background and UI palette, tiles, and map
    loadPalette(bgPal);
    DMANow(3, UITiles, &CHARBLOCK[0], UITilesLen / 2);
    DMANow(3, UIMap, &SCREENBLOCK[27], UIMapLen / 2);
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(27);
    DMANow(3, bgTiles, &CHARBLOCK[1], bgTilesLen / 2);
    DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen / 2);
    REG_BG1CNT = BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(28);

    // Load the spritesheet tiles and palette
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    // Hides all the sprites
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    // Initializes the vOff and hOff
    vOff = 216;
    hOff = 134;
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
}

// Updates the game each frame
void updateGame() {
    // Updates the player
    updatePlayer();

    // Updates the jellyfishes
    for (int i = 0; i < JELLYFISHCOUNT; i++) {
        updateJellyfish(&jellyfishes[i]);
    }

    // Updates the King Jellyfish
    updateKingJellyfish();

    // Updates No Name
    updateNoName();

    // Makes the timer go down
    decreaseTime();

    // Sets the horizontal and vertical offsets of background one
    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
}

// Draws the game each frame
void drawGame() {
    // Draws Spongebob
    drawPlayer();

    // Draws the King Jellyfish
    drawKingJellyfish();

    // Draws No Name
    drawNoName();

    // Draws every jellyfish
    for (int i = 0; i < JELLYFISHCOUNT; i++) {
        drawJellyfish(&jellyfishes[i]);
    }

    // Draws the score to the screen
    drawNumber(144, 64, score, 124);

    // Draws the timer to the screen
    drawNumber(144, 108, time / 60, 126);

    // Draws the number of captured Jellyfish Spongebob has right now
    drawUINet(121);

    // Changes the blending level
    if (kingJellyfish.aniCounter % changeBlending == 0) {
        ghost_blend--;
        if (ghost_blend < 0) {
            ghost_blend = 16;
        }
        REG_COLEV = WEIGHTOFA(ghost_blend) | WEIGHTOFB(16 - ghost_blend);
    }
    DMANow(3, shadowOAM, OAM, 128 * 4);

}

// Initialize the player
void initPlayer() {
    player.rdel = 2;
    player.cdel = 2;
    player.width = 32;
    player.height = 32;
    player.worldRow = 282;
    player.worldCol = 242;
    player.aniCounter = 0;
    player.aniState = SPONGEFRONT;
    player.curFrame = 0;
    player.numFrames = 3;
    player.index = 0;
}

// Handle every-frame actions of the player
void updatePlayer() {
    // Control movement and camera
    if (BUTTON_HELD(BUTTON_UP)
        && collisionmapBitmap[OFFSET(player.worldRow - player.rdel - 1, player.worldCol, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(player.worldRow - player.rdel - 1, player.worldCol + player.width - 1, MAPWIDTH)]) {
        if (vOff > 0 && player.screenRow + player.height / 2 < SCREENHEIGHT / 2) {
            vOff -= player.rdel;
        }
        if (player.worldRow >= player.rdel) {
            player.worldRow -= player.rdel;
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN)
        && collisionmapBitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(player.worldRow + player.height + player.rdel - 1, player.worldCol + player.width - 1, MAPWIDTH)]) {
        if (vOff < MAPHEIGHT - SCREENHEIGHT && player.screenRow + player.height / 2 > SCREENHEIGHT / 2) {
            vOff += player.rdel;
        }
        if (player.worldRow + player.height - 1 < MAPHEIGHT - player.rdel) {
            player.worldRow += player.rdel;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)
        && collisionmapBitmap[OFFSET(player.worldRow, player.worldCol - player.cdel - 1, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol - player.cdel - 1, MAPWIDTH)]) {
        if (hOff > 0 && player.screenCol + player.width / 2 < SCREENWIDTH / 2) {
            hOff -= player.cdel;
        }
        if (player.worldCol >= player.cdel) {
            player.worldCol -= player.cdel;
        }
    }
    if (BUTTON_HELD(BUTTON_RIGHT)
        && collisionmapBitmap[OFFSET(player.worldRow, player.worldCol + player.width + player.cdel - 1, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(player.worldRow + player.height - 1, player.worldCol + player.width + player.cdel - 1, MAPWIDTH)]) {
        if (hOff < MAPWIDTH - SCREENWIDTH && player.screenCol + player.width / 2 > SCREENWIDTH / 2) {
            hOff += player.cdel;
        }
        if (player.worldCol + player.width - 1 < MAPWIDTH - player.cdel) {
            player.worldCol += player.cdel;
        }
    }

    // Allows Spongebob to catch nearby jellyfish as long as he has less than 3
    if (BUTTON_PRESSED(BUTTON_A)) {
        playSoundB(Whoosh, WHOOSHLEN, WHOOSHFREQ, 0);
        for(int j = 0; j < JELLYFISHCOUNT; j++) {
            if (jellyfishes[j].active
                && nearby(player.worldRow, player.worldCol, player.height, player.width, jellyfishes[j].worldRow, jellyfishes[j].worldCol, jellyfishes[j].height, jellyfishes[j].width, 4)
                && numCaptured < 3) {
                jellyfishes[j].active = 0;
                jellyfishes[j].captured = 1;
                jellyfishes[j].hide = 1;
                numCaptured++;
                playSoundB(Coin, COINLEN, COINFREQ, 0);
            }
        }

        // Checks if No Name is eligible to be caught
        if (nearby(player.worldRow, player.worldCol, player.height, player.width, noName.worldRow, noName.worldCol, noName.height, noName.width, 4)
            && numCaptured < 3
            && noName.active) {
            noName.active = 0;
            noName.captured = 1;
            noName.hide = 1;
            numCaptured++;
            playSoundB(Coin, COINLEN, COINFREQ, 0);
        }
    }

    // Deposits current captured jellyfish if Spongebob is close to the Krusty Krab and increments the score for every captured jellyfish
    if (BUTTON_PRESSED(BUTTON_B)
        && nearby(player.worldRow, player.worldCol, player.height, player.width, 256, 248, 24, 16, 5)
        && numCaptured > 0) {
        for (int k = 0; k < JELLYFISHCOUNT; k++) {
            if (!jellyfishes[k].active && jellyfishes[k].captured) {
                int row = rand() % (512 - jellyfishes[k].height);
                int col = rand() % (512 - jellyfishes[k].width);
                score++;
                numCaptured--;
                while (row < 392 && row > 216) {
                    row = rand() % 512;
                }
                jellyfishes[k].worldRow = row;
                while (col < 376 && col > 144) {
                    col = rand() % 512;
                }
                jellyfishes[k].worldCol = col;
                jellyfishes[k].active = 1;
                jellyfishes[k].captured = 0;
                jellyfishes[k].hide = 1;
            }
        }

        if (noName.captured && !noName.active) {
            score += 3;
            numCaptured--;
            int row = rand() % (512 - noName.height);
            int col = rand() % (512 - noName.width);
            while (row < 392 && row > 216) {
                    row = rand() % 512;
            }
            noName.worldRow = row;
            while (col < 376 && col > 144) {
                col = rand() % 512;
            }
            noName.worldCol = col;
            noName.active = 1;
            noName.captured = 0;
            noName.hide = 1;
        }
        playSoundB(Money, MONEYLEN, MONEYFREQ, 0);
    }

    // Checks for collision between King Jellyfish and Spongebob and frees any captured jellyfish
    if (collision(player.worldRow, player.worldCol, player.height, player.width, kingJellyfish.worldRow, kingJellyfish.worldCol, kingJellyfish.height, kingJellyfish.width)
        && numCaptured > 0
        && !cheat) {
        for (int i = 0; i < JELLYFISHCOUNT; i++) {
            if (jellyfishes[i].captured) {
                int row = rand() % (512 - jellyfishes[i].height);
                int col = rand() % (512 - jellyfishes[i].width);
                while (row < 392 && row > 216) {
                    row = rand() % 512;
                }
                jellyfishes[i].worldRow = row;
                while (col < 376 && col > 144) {
                    col = rand() % 512;
                }
                jellyfishes[i].worldCol = col;
                jellyfishes[i].captured = 0;
                jellyfishes[i].active = 1;
            }

            if (noName.captured) {
                int row = rand() % (512 - noName.height);
                int col = rand() % (512 - noName.width);
                while (row < 392 && row > 216) {
                        row = rand() % 512;
                }
                noName.worldRow = row;
                while (col < 376 && col > 144) {
                    col = rand() % 512;
                }
                noName.worldCol = col;
                noName.active = 1;
                noName.captured = 0;
            }
        }

        // Removes any collected jellyfish
        numCaptured = 0;

        //Move Spongebob in front of Krusty Krab
        player.worldRow = 282;
        player.worldCol = 242;
        vOff = 216;
        hOff = 134;
        player.aniState = SPONGEFRONT;

        // Move the King Jellyfish to a random location on the map
        int row = rand() % (512 - kingJellyfish.height);
        int col = rand() % (512 - kingJellyfish.width);
        while (row < 280 && row > 224) {
            row = rand() % (512 - kingJellyfish.height);
        }
        kingJellyfish.worldRow = row;
        while (col < 295 && col > 216) {
            col = rand() % (512 - kingJellyfish.width);
        }
        kingJellyfish.worldCol = col;

        // Plays the thunder sound
        playSoundB(Screaming, SCREAMINGLEN, SCREAMINGFREQ, 0);
    }

    // Calculates the screen row and col of Spongebob
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    animatePlayer();

}

// Handles animation logic
void animatePlayer() {
    // Sets the previous animation state to the current one if not swinging and then resets Spongebob's state to idle
    if (player.aniState != SPONGESWING) {
        player.prevAniState = player.aniState;
        player.aniState = SPONGEIDLE;
    }

    // Controls movement and changes the animation state respective to position
    if (BUTTON_HELD(BUTTON_UP)) {
        player.aniState = SPONGEBACK;
        player.numFrames = 3;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player.aniState = SPONGEFRONT;
        player.numFrames = 3;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player.aniState = SPONGELEFT;
        player.numFrames = 3;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.aniState = SPONGERIGHT;
        player.numFrames = 3;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        player.aniState = SPONGESWING;
        player.numFrames = 4;
        player.curFrame = 0;
    }

    // Makes Spongebob go through his swing animation, otherwise animate his walking
    if (player.aniState == SPONGESWING) {
        if (player.aniCounter % 6 == 0) {
            if (player.curFrame < 3) {
                player.curFrame++;
            } else {
                player.aniState = player.prevAniState;
                player.curFrame = 0;
                player.numFrames = 3;
            }
        }
    } else {
        if (player.curFrame > 2) {
            player.curFrame = 0;
        }
        if (player.aniCounter % 12 == 0) {
            player.numFrames = 3;
            player.curFrame = (player.curFrame + 1) % player.numFrames;
        }
    }

    // If Spongebob is in an idle state, reset Spongebob to his idle frame
    if (player.aniState == SPONGEIDLE) {
        player.curFrame = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

// Puts the player values into the shadowOAM so they can be drawn
void drawPlayer() {
    if (player.hide) {
        shadowOAM[player.index].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[player.index].attr0 = (ROWMASK & player.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[player.index].attr1 = (COLMASK & player.screenCol) | ATTR1_MEDIUM;
        shadowOAM[player.index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.curFrame * 4, player.aniState * 4);
    }
}

// Initializes the jellyfish
void initJellyfish() {
    for (int i = 0; i < JELLYFISHCOUNT; i++) {
        jellyfishes[i].rdel = 1;
        jellyfishes[i].cdel = 1;
        jellyfishes[i].width = 16;
        jellyfishes[i].height = 16;
        // Gives the jellyfish a random location that is outside of the Krusty Krab
        int row = rand() % (512 - jellyfishes[i].height);
        int col = rand() % (512 - jellyfishes[i].width);
        while (row < 280 && row > 224) {
            row = rand() % 512;
        }
        jellyfishes[i].worldRow = row;
        while (col < 295 && col > 216) {
            col = rand() % 512;
        }
        jellyfishes[i].worldCol = col;
        jellyfishes[i].aniCounter = 0;
        jellyfishes[i].curFrame = 0;
        jellyfishes[i].numFrames = 3;
        jellyfishes[i].active = 1;
        jellyfishes[i].captured = 0;
        jellyfishes[i].index = 1 + i;
        jellyfishes[i].hide = 0;
        jellyfishes[i].direction = rand() % 4;
    }
}

// Updates the jellyfish values
void updateJellyfish(ANISPRITE *j) {
    // Hides the jellyfish if they go offscreen
    if (j -> active) {
        if (j -> screenRow < j -> height * -1 || j -> screenRow > SCREENHEIGHT || j -> screenCol < j -> width * -1 || j -> screenCol > SCREENWIDTH) {
            j -> hide = 1;
        } else {
            j -> hide = 0;
        }

        if (j -> aniCounter % 60 == 0) {
            j -> direction = rand() % 4;
        }
        idleMovement(j, j -> direction);

        j -> screenRow = j -> worldRow - vOff;
        j -> screenCol = j -> worldCol - hOff;

        animateJellyfish(j);

    }
}

// Handles animation logic of the jellyfish
void animateJellyfish(ANISPRITE *j) {
    if (j -> aniCounter % 20 == 0) {
        j -> curFrame = (j -> curFrame + 1) % j -> numFrames;
    }
    j -> aniCounter++;
}

// Puts the jellyfish values in the shadowOAM so they can be drawn
void drawJellyfish(ANISPRITE *j) {
    if (j -> hide || j -> captured) {
        shadowOAM[j -> index].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[j -> index].attr0 = (j -> screenRow & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[j -> index].attr1 = (j -> screenCol & COLMASK) | ATTR1_SMALL;
        shadowOAM[j -> index].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(j -> curFrame * 2, 20);
    }
}

// Initializes No Name's values
void initNoName() {
    noName.rdel = 2;
    noName.cdel = 2;
    noName.width = 16;
    noName.height = 16;
    int row = rand() % (512 - noName.height);
    int col = rand() % (512 - noName.width);
    while (row < 280 && row > 224) {
        row = rand() % 512;
    }
    noName.worldRow = row;
    while (col < 295 && col > 216) {
        col = rand() % 512;
    }
    noName.worldCol = col;
    noName.aniCounter = 0;
    noName.curFrame = 0;
    noName.numFrames = 3;
    noName.active = 1;
    noName.captured = 0;
    noName.index = 12;
    noName.hide = 0;
    noName.direction = rand() % 4;
}

// Updates No Name's values
void updateNoName() {
    // Hides No Name if he goes offscreen
    if (noName.active) {
        if (noName.screenRow < noName.height * -1 || noName.screenRow > SCREENHEIGHT || noName.screenCol < noName.width * -1 || noName.screenCol > SCREENWIDTH) {
            noName.hide = 1;
        } else {
            noName.hide = 0;
        }

        if (noName.aniCounter % 60 == 0) {
            noName.direction = rand() % 4;
        }
        idleMovement(&noName, noName.direction);

        noName.screenRow = noName.worldRow - vOff;
        noName.screenCol = noName.worldCol - hOff;

        animateNoName();
    }
}

// Animates No Name
void animateNoName() {
    if (noName.aniCounter % 20 == 0) {
        noName.curFrame = (noName.curFrame + 1) % noName.numFrames;
    }
    noName.aniCounter++;
}

// Copies No Name's values into the shadowOam
void drawNoName() {
    if (noName.hide || noName.captured) {
        shadowOAM[noName.index].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[noName.index].attr0 = (ROWMASK & noName.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[noName.index].attr1 = (COLMASK & noName.screenCol) | ATTR1_SMALL;
        shadowOAM[noName.index].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(noName.curFrame * 2, 22);

    }
}

// Initializes the king jellyfish values
void initKingJellyfish() {
    kingJellyfish.rdel = 1;
    kingJellyfish.cdel = 1;
    kingJellyfish.width = 32;
    kingJellyfish.height = 32;
    int row = rand() % (512 - kingJellyfish.height);
    int col = rand() % (512 - kingJellyfish.width);
    while (row < 280 && row > 224) {
        row = rand() % 512;
    }
    kingJellyfish.worldRow = row;
    while (col < 295 && col > 216) {
        col = rand() % 512;
    }
    kingJellyfish.worldCol = col;
    kingJellyfish.aniCounter = 0;
    kingJellyfish.curFrame = 0;
    kingJellyfish.numFrames = 3;
    kingJellyfish.active = 1;
    kingJellyfish.captured = 0;
    kingJellyfish.index = 11;
    kingJellyfish.hide = 0;
    kingJellyfish.direction = rand() % 4;
}

// Updates the King Jellyfish values
void updateKingJellyfish() {
    if (kingJellyfish.screenRow < kingJellyfish.height * -1 || kingJellyfish.screenRow > SCREENHEIGHT || kingJellyfish.screenCol < kingJellyfish.width * -1 || kingJellyfish.screenCol > SCREENWIDTH) {
        kingJellyfish.hide = 1;
    } else {
        kingJellyfish.hide = 0;
    }

    // Makes the King Jellyfish chase Spongebob once Spongebob has captured at least one jellyfish; otherwise move idly
    if (numCaptured > 0 && !cheat) {
        chase();
     } else {
        if (kingJellyfish.aniCounter % 45 == 0) {
            kingJellyfish.direction = rand() % 4;
        }
        kingJellyfish.rdel = 1;
        kingJellyfish.cdel = 1;
        idleMovement(&kingJellyfish, kingJellyfish.direction);
    }

    kingJellyfish.screenRow = kingJellyfish.worldRow - vOff;
    kingJellyfish.screenCol = kingJellyfish.worldCol - hOff;

    animateKingJellyfish();
}

// Controls the animation for the King Jellyfish
void animateKingJellyfish() {
    if (kingJellyfish.aniCounter % 20 == 0) {
        kingJellyfish.curFrame = (kingJellyfish.curFrame + 1) % kingJellyfish.numFrames;
    }
    kingJellyfish.aniCounter++;
}

// Puts the King Jellyfish values into the shadowOAM
void drawKingJellyfish() {
     if (kingJellyfish.hide) {
        shadowOAM[kingJellyfish.index].attr0 |= ATTR0_HIDE;
    } else {
        if (cheat) {
            shadowOAM[kingJellyfish.index].attr0 = (ROWMASK & kingJellyfish.screenRow) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
            shadowOAM[kingJellyfish.index].attr1 = (COLMASK & kingJellyfish.screenCol) | ATTR1_MEDIUM;
            shadowOAM[kingJellyfish.index].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(12 + kingJellyfish.curFrame * 4, 4);
        } else {
            shadowOAM[kingJellyfish.index].attr0 = (ROWMASK & kingJellyfish.screenRow) | ATTR0_4BPP | ATTR0_SQUARE;
            shadowOAM[kingJellyfish.index].attr1 = (COLMASK & kingJellyfish.screenCol) | ATTR1_MEDIUM;
            shadowOAM[kingJellyfish.index].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(12 + kingJellyfish.curFrame * 4, 0);
        }
    }
}

// Checks if two objects are nearby each other within a ceratin tolerance level
int nearby(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB, int tolerance) {
    return collision(rowA - tolerance, colA - tolerance, heightA + tolerance * 2, widthA + tolerance * 2, rowB, colB, heightB, widthB);
}

// Draws a number to the screen
void drawNumber(int row, int col, int number, int index) {
    int first = number / 10;
    int last = number % 10;
    shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[index].attr1 = col | ATTR1_SMALL;
    shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, first * 2);
    index++;
    shadowOAM[index].attr0 = row | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[index].attr1 = (col + 12) | ATTR1_SMALL;
    shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(30, last * 2);

}

// Decreases the time
void decreaseTime() {
    time--;
}

// Draws the number of captured jellyfish that Spongebob curretnly has
void drawUINet(int index) {
    if (numCaptured == 0) {
        shadowOAM[index].attr0 = ATTR0_HIDE;
        index++;
        shadowOAM[index].attr0 = ATTR0_HIDE;
        index++;
        shadowOAM[index].attr0 = ATTR0_HIDE;
    } else if (numCaptured == 1) {
        shadowOAM[index].attr0 = (ROWMASK & 144) | ATTR0_4BPP | ATTR0_SQUARE;;
        shadowOAM[index].attr1 = (COLMASK & 192) | ATTR1_SMALL;
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2);
        index++;
        shadowOAM[index].attr0 = ATTR0_HIDE;
        index++;
        shadowOAM[index].attr0 = ATTR0_HIDE;
    } else if (numCaptured == 2) {
        shadowOAM[index].attr0 = (ROWMASK & 144) | ATTR0_4BPP | ATTR0_SQUARE;;
        shadowOAM[index].attr1 = (COLMASK & 192) | ATTR1_SMALL;
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2);
        index++;
        shadowOAM[index].attr0 = (ROWMASK & 144) | ATTR0_4BPP | ATTR0_SQUARE;;
        shadowOAM[index].attr1 = (COLMASK & 208) | ATTR1_SMALL;
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2);
        index++;
        shadowOAM[index].attr0 = ATTR0_HIDE;
    } else {
        shadowOAM[index].attr0 = (ROWMASK & 144) | ATTR0_4BPP | ATTR0_SQUARE;;
        shadowOAM[index].attr1 = (COLMASK & 192) | ATTR1_SMALL;
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2);
        index++;
        shadowOAM[index].attr0 = (ROWMASK & 144) | ATTR0_4BPP | ATTR0_SQUARE;;
        shadowOAM[index].attr1 = (COLMASK & 208) | ATTR1_SMALL;
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2);
        index++;
        shadowOAM[index].attr0 = (ROWMASK & 144) | ATTR0_4BPP | ATTR0_SQUARE;;
        shadowOAM[index].attr1 = (COLMASK & 224) | ATTR1_SMALL;
        shadowOAM[index].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2);
    }
}

// Makes the King Jellyfish follow Spongebob
void chase() {
    if (kingJellyfish.worldRow < player.worldRow
        && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height + kingJellyfish.rdel - 1, kingJellyfish.worldCol, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height + kingJellyfish.rdel - 1, kingJellyfish.worldCol + kingJellyfish.width - 1, MAPWIDTH)]) {
        kingJellyfish.worldRow += kingJellyfish.rdel;
        if (kingJellyfish.worldCol < player.worldCol
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow, kingJellyfish.worldCol + kingJellyfish.width + kingJellyfish.cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height - 1, kingJellyfish.worldCol + kingJellyfish.width + kingJellyfish.cdel - 1, MAPWIDTH)]) {
            kingJellyfish.worldCol += kingJellyfish.cdel;
        } else if (kingJellyfish.worldCol > player.worldCol
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow, kingJellyfish.worldCol - kingJellyfish.cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height - 1, kingJellyfish.worldCol - kingJellyfish.cdel - 1, MAPWIDTH)]) {
            kingJellyfish.worldCol -= kingJellyfish.cdel;
        }
    } else if (kingJellyfish.worldRow > player.worldRow
        && collisionmapBitmap[OFFSET(kingJellyfish.worldRow - kingJellyfish.rdel - 1, kingJellyfish.worldCol, MAPWIDTH)]
        && collisionmapBitmap[OFFSET(kingJellyfish.worldRow - kingJellyfish.rdel - 1, kingJellyfish.worldCol + kingJellyfish.width - 1, MAPWIDTH)]) {
        kingJellyfish.worldRow -= kingJellyfish.rdel;
        if (kingJellyfish.worldCol < player.worldCol
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow, kingJellyfish.worldCol + kingJellyfish.width + kingJellyfish.cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height - 1, kingJellyfish.worldCol + kingJellyfish.width + kingJellyfish.cdel - 1, MAPWIDTH)]) {
            kingJellyfish.worldCol += kingJellyfish.cdel;
        }  else if (kingJellyfish.worldCol > player.worldCol
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow, kingJellyfish.worldCol - kingJellyfish.cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height - 1, kingJellyfish.worldCol - kingJellyfish.cdel - 1, MAPWIDTH)]) {
            kingJellyfish.worldCol -= kingJellyfish.cdel;
        }
    } else {
        if (kingJellyfish.worldCol < player.worldCol
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow, kingJellyfish.worldCol + kingJellyfish.width + kingJellyfish.cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height - 1, kingJellyfish.worldCol + kingJellyfish.width + kingJellyfish.cdel - 1, MAPWIDTH)]) {
            kingJellyfish.worldCol += kingJellyfish.cdel;
        }  else if (kingJellyfish.worldCol > player.worldCol
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow, kingJellyfish.worldCol - kingJellyfish.cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(kingJellyfish.worldRow + kingJellyfish.height - 1, kingJellyfish.worldCol - kingJellyfish.cdel - 1, MAPWIDTH)]) {
            kingJellyfish.worldCol -= kingJellyfish.cdel;
        }
    }

}

// Moves the sprite in a specified direction
void idleMovement(ANISPRITE *s, int choice) {
    if (choice == 0) {
        if (s -> worldRow >= s -> rdel
            && collisionmapBitmap[OFFSET(s -> worldRow - s -> rdel - 1, s -> worldCol, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(s -> worldRow - s -> rdel - 1, s -> worldCol + s -> width - 1, MAPWIDTH)]) {
            s -> worldRow -= s -> rdel;
        }
    } else if (choice == 1) {
        if (s -> worldRow + s -> height - 1 < MAPHEIGHT - s -> rdel
            && collisionmapBitmap[OFFSET(s -> worldRow + s -> height + s -> rdel - 1, s -> worldCol, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(s -> worldRow + s -> height + s -> rdel - 1, s -> worldCol + s -> width - 1, MAPWIDTH)]) {
            s -> worldRow += s -> rdel;
        }
    } else if (choice == 2) {
        if (s -> worldCol >= s -> cdel
            && collisionmapBitmap[OFFSET(s -> worldRow, s -> worldCol - s -> cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(s -> worldRow + s -> height - 1, s -> worldCol - s -> cdel - 1, MAPWIDTH)]) {
            s -> worldCol -= s -> cdel;
        }
    } else {
        if (s -> worldCol + s -> width - 1 < MAPWIDTH - s -> cdel
            && collisionmapBitmap[OFFSET(s -> worldRow, s -> worldCol + s -> width + s -> cdel - 1, MAPWIDTH)]
            && collisionmapBitmap[OFFSET(s -> worldRow + s -> height - 1, s -> worldCol + s -> width + s -> cdel - 1, MAPWIDTH)]) {
            s -> worldCol += s -> cdel;
        }
    }
}
