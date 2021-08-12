//
//  ViewController.m
//  02-Runloop与线程的关系
//
//  Created by cooci on 2018/12/5.
//  Copyright © 2018 cooci. All rights reserved.
//

#import "ViewController.h"
#import "LGThread.h"

@interface ViewController ()
@property (nonatomic, assign) BOOL isStopping;

@end

@implementation ViewController




- (void) testOne{
    
    self.isStopping = NO;
    LGThread *thread = [[LGThread alloc] initWithBlock:^{
       
        // thread.name = nil 因为这个变量只是捕捉
        // LGThread *thread = nil
        // thread = 初始化 捕捉一个nil进来
        NSLog(@"哈哈哈 :   %@---%@",[NSThread currentThread],[[NSThread currentThread] name]);
        [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
            NSLog(@"hello word, 走你， 子线程 timer");            // 退出线程--结果runloop也停止了
            if (self.isStopping) {
                [NSThread exit];
            }
        }];
      //  [[NSRunLoop currentRunLoop] run]; //  关键代码
    }];
    
    thread.name = @"lgcode.com";
    [thread start];
    
}






- (void)viewDidLoad {
    [super viewDidLoad];

    
    /*
     
     1
    // 主运行循环
     CFRunLoopRef mainRunloop = CFRunLoopGetMain();
    
    
    
    NSLog(@"111  \n %@", mainRunloop);
    
    */
    //
    
    
    //
    
    
    
    
    //
    
    
    
    //
    
    [self testOne];
    
    
    //
    
    
    //
    
    
    //
    
    
    // 当前运行循环
   //  CFRunLoopRef currentRunloop = CFRunLoopGetCurrent();
    
}








- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        NSLog(@"99999");
//    }];
    self.isStopping = YES;
}





@end
