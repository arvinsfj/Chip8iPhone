//
//  Chip8Emulator.h
//  Chip8iPhone
//
//  Created by arvin on 16/8/31.
//  Copyright © 2016年 com.arvin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Chip8Emulator : NSObject
{
    unsigned short pc;				// Program counter
    unsigned short opcode;			// Current opcode
    unsigned short I;				// Index register
    unsigned short sp;				// Stack pointer
    
    unsigned char  V[16];			// V-regs (V0-VF)
    unsigned short stack[16];		// Stack (16 levels)
    unsigned char  memory[4096];	// Memory (size = 4k)
				
    unsigned char  delay_timer;		// Delay timer
    unsigned char  sound_timer;		// Sound timer
    
    unsigned char gfx[64 * 32];
    unsigned char screenData[32][64][4];
    unsigned char key[16];
    bool drawFlag;
}


- (void)emulateCycle;
- (void)debugRender;
- (BOOL)loadApp:(NSString *)file;
- (void)show:(UIImageView *)view;


@end
