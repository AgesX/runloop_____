//
//  ViewController.m
//  01-Runloop初探
//
//  Created by cooci on 2018/12/4.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)deng_one_sourceDemo{
    
    //__CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"天王盖地虎");
    }];


}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self deng_one_sourceDemo];
    
    
    
   // [self sourceDemo];
}







#pragma mark -

- (void)sourceDemo{
    

    [self performSelector:@selector(fire) withObject:nil afterDelay:1.0];
    
    // __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"hello word");
    });
    
    void (^block)(void) = ^{
        NSLog(@"123");
    };
    
    block();
}

// __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__
- (void)fire{
    NSLog(@"performSeletor");
}

#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"来了,老弟!!!");
}


@end
