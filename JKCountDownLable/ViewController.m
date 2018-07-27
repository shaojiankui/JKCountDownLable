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
    //设置最原始的text
    self.countDownLable.text  = @"00 : 00 : 00";
    [self.countDownLable countDownWithDate:[NSDate dateWithTimeIntervalSinceNow:666]];
    
//    [self.countDownLable countDownWithTimeInterval:1470614888];
    [self.countDownLable countDownLableChange:^NSString *(JKCountDownLable *countDownLable, NSDate *endTime, NSTimeInterval second,NSDictionary *DHMSInfo, NSString *defaultText) {
        
        //自己格式化
        NSInteger D = [[DHMSInfo objectForKey:@"D"] integerValue];
        NSInteger H = [[DHMSInfo objectForKey:@"H"] integerValue];
        NSInteger M = [[DHMSInfo objectForKey:@"M"] integerValue];
        NSInteger S = [[DHMSInfo objectForKey:@"S"] integerValue];
        
        return [NSString stringWithFormat:@"%0.2zd : %0.2zd : %0.2zd", H,M,S];

//        //使用控件内的默认格式化后的文本
//        return defaultText;
    }];
    [self.countDownLable countDownLableFinished:^NSString *(JKCountDownLable *countDownLable, NSDate *endTime, NSTimeInterval seconds, NSDictionary *DHMSInfo, NSString *defaultText) {
        //自定义倒计时结束标题
        return @"00 : 00 : 00";
        //使用控件内的默认格式化后的文本
        //return defaultText;
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)infoTouched:(id)sender {
    NSLog(@"beginTime:%@",[self.countDownLable beginTime]);
    NSLog(@"endTime:%@",[self.countDownLable endTime]);

    NSLog(@"secondsPassed:%lf",[self.countDownLable secondsPassed]);
    NSLog(@"secondsRemain:%lf",[self.countDownLable secondsRemain]);
}
@end
