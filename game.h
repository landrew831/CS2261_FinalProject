// Sprite Struct
typedef struct {
	int worldRow;
	int worldCol;
    int screenRow;
    int screenCol;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int active;
    int captured;
    int index;
    int hide;
    int direction;
} ANISPRITE;


// Constants
#define JELLYFISHCOUNT 10
#define MAPHEIGHT 512
#define MAPWIDTH 512
#define UIHEIGHT 16

// Variables
extern ANISPRITE player;
extern ANISPRITE kingJellyfish;
extern ANISPRITE jellyfishes[JELLYFISHCOUNT];
extern ANISPRITE noName;
extern int score;
extern int numCaptured;
extern int time;
extern int cheat;
extern unsigned short vOff;
extern unsigned short hOff;


// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initJellyfish();
void updateJellyfish(ANISPRITE *);
void animateJellyfish(ANISPRITE *);
void drawJellyfish(ANISPRITE *);
void initKingJellyfish();
void updateKingJellyfish();
void animateKingJellyfish();
void drawKingJellyfish();
void initNoName();
void updateNoName();
void animateNoName();
void drawNoName();
int nearby(int, int, int, int, int, int, int, int, int);
void drawNumber(int, int, int, int);
void decreaseTime();
void drawUINet(int);
void chase();
void idleMovement(ANISPRITE *, int);


