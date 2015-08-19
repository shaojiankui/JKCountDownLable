//
//  ViewController.m
//  JKCountDownLable
//
//  Created by Jakey on 15/8/18.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // Do any additional setup after loading the view, typically from a nib.
    [self.countDownLable countDownWithDate:[NSDate dateWithTimeIntervalSinceNow:864000]];
    
    [self.countDownLable countDownWithTimeInterval:1470614888];
    
    [self.countDownLable setCountDownLableChange:^(NSDate *startTime, double time, NSString *text) {
        NSLog(@"text%@",text);

    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
