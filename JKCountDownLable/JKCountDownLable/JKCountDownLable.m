//
//  JKCountDownLable.m
//  JKCountDownLable
//
//  Created by Jakey on 15/8/18.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import "JKCountDownLable.h"

@implementation JKCountDownLable


- (void)changeText{
    NSDate *date = [NSDate date];
 
    NSTimeInterval deltaTime = [_endTime timeIntervalSinceDate:date];
    
    NSDictionary *DHMSInfo =  [[self class] getDHMSInfoWithSeconds:deltaTime];
    
    NSInteger D = [[DHMSInfo objectForKey:@"D"] integerValue];
    NSInteger H = [[DHMSInfo objectForKey:@"H"] integerValue];
    NSInteger M = [[DHMSInfo objectForKey:@"M"] integerValue];
    NSInteger S = [[DHMSInfo objectForKey:@"S"] integerValue];

    NSString *defaultText = [NSString stringWithFormat:@"%0.3zd :%0.2zd : %0.2zd : %0.2zd", D,H,M,S];

    
    if (deltaTime <=0.0) {
        [self stop];
        return;
    }else{
        if (_countDownLableChange) {
            self.text  = _countDownLableChange(self,_endTime,deltaTime,DHMSInfo,defaultText);
        }else{
            self.text = defaultText;
        }
    }
}
+ (NSDictionary*)getDHMSInfoWithSeconds:(NSTimeInterval)seconds{
  
    NSInteger day = seconds/86400;
    NSInteger hour = (seconds-(day*86400))/3600;
    NSInteger minute = (seconds-(day*86400)-(hour*3600))/60;
    NSInteger second = (seconds-(day*86400)-(hour*3600)-minute*60);
 
    return  @{@"D":@(day),@"H":@(hour),@"M":@(minute),@"S":@(second)};
}

- (void)countDownWithDate:(NSDate*)date{
    [self stop];
    _endTime = date;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeText) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
- (void)countDownWithTimeInterval:(NSTimeInterval)timeInterval{
    [self stop];
    _endTime = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeText) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)stop{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                if (_countDownLableFinished)
                {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.text = _countDownLableFinished(self,_endTime,0,@"000 : 00 : 00 : 00");
                    });
                }
                else
                {
                    self.text= @"000 : 00 : 00 : 00";
                }
            }
        }
    }
}
- (void)countDownLableChange:(CountDownLableChange)countDownLableChange{
    _countDownLableChange = [countDownLableChange copy];
}
- (void)countDownLableFinished:(CountDownLableChange)countDownLableFinished{
    _countDownLableFinished = [countDownLableFinished copy];
}
@end
