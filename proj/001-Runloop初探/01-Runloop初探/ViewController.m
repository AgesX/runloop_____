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



- (void)deng_two_sourceDemo{
    
    // 他的原理，同 timer
    
    // 底层的通讯，都是基于 run loop
    [self performSelector:@selector(fire) withObject:nil afterDelay:1.0];
    

}





- (void)deng_three_sourceDemo{
    
    //  #4    0x0000000108d888f8 in __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__ ()


    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"hello word");
    });
    

}






- (void)deng_four_sourceDemo{
    
    //  #17    0x0000000108c34c74 in __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ ()

    
    
    void (^block)(void) = ^{
        NSLog(@"123");
    };
    
    block();
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  [self deng_one_sourceDemo];
    
    
    
  //  [self deng_two_sourceDemo];
    
 //   [self deng_three_sourceDemo];
    [self deng_four_sourceDemo];
}







#pragma mark -







// __CFRUNLOOP_IS_CALLING_OUT_TO_A_TIMER_CALLBACK_FUNCTION__
- (void)fire{
    NSLog(@"hahaha:    performSeletor");
}






#pragma mark - 触摸事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"来了,老弟!!!");
}


@end
