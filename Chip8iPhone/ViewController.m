//
//  ViewController.m
//  Chip8iPhone
//
//  Created by arvin on 16/8/31.
//  Copyright © 2016年 com.arvin. All rights reserved.
//

#import "ViewController.h"

#import "Chip8Emulator.h"

@interface ViewController ()
{
    Chip8Emulator *emulator;
}

@property (weak, nonatomic) IBOutlet UIImageView *screenImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    emulator = [[Chip8Emulator alloc] init];
    NSString *path = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"PONG2"];
    [emulator loadApp:path];
    
    //
    [self setupDisplayLink];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupDisplayLink
{
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(renderLoop)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)renderLoop
{
    
    [emulator emulateCycle];
    
    //[emulator debugRender];
    
    [emulator show:_screenImageView];
}

@end
