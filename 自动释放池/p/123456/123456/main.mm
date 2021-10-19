//
//  main.m
//  123456
//
//  Created by Jz D on 2021/10/19.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"



// CPP
struct ObjectTest{
    ObjectTest(){
        printf("初始化  %s \n\n", __func__);
    }
    
    ~ObjectTest(){
        printf("析构了 %s  \n\n", __func__);
    }
};





int main(int argc, char * argv[]) {
 //   NSString * appDelegateClassName;
    @autoreleasepool {
        
        
        
        ObjectTest obj;
        
        
        
        
        
        
        // Setup code that might create autoreleased objects goes here.
    //    appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
 //   return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    
    return 0;
}
