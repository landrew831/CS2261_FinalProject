
//{{BLOCK(InstructionScreen)

//======================================================================
//
//	InstructionScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 565 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 18080 + 2048 = 20640
//
//	Time-stamp: 2017-11-24, 18:07:20
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSCREEN_H
#define GRIT_INSTRUCTIONSCREEN_H

#define InstructionScreenTilesLen 18080
extern const unsigned short InstructionScreenTiles[9040];

#define InstructionScreenMapLen 2048
extern const unsigned short InstructionScreenMap[1024];

#define InstructionScreenPalLen 512
extern const unsigned short InstructionScreenPal[256];

#endif // GRIT_INSTRUCTIONSCREEN_H

//}}BLOCK(InstructionScreen)
