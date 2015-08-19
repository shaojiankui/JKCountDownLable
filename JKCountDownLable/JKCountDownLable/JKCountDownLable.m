//
//  JKCountDownLable.m
//  JKCountDownLable
//
//  Created by Jakey on 15/8/18.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import "JKCountDownLable.h"

@implementation JKCountDownLable

-(void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        self.font  = [UIFont systemFontOfSize:self.font.pointSize];
        self.text= @"000 : 00 : 00 : 00";
    }
}

-(void)changeText{
    NSDate *date = [NSDate date];
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger interval = [zone secondsFromGMTForDate: date];
    //    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    NSTimeInterval deltaTime = [_timeFirst timeIntervalSinceDate:date];
    self.text =  [self getTimeString:deltaTime];

    if (_countDownLableChange) {
        _countDownLableChange(_timeFirst,deltaTime,self.text);
    }
    if (deltaTime <=0.0) {
        [self stop];
        return;
    }
    //NSLog(@"deltaTime = %f",deltaTime);
}
-(NSString*)getTimeString:(NSTimeInterval)seconds{
  
    NSInteger day = seconds/86400;
    NSInteger hour = (seconds-(day*86400))/3600;
    NSInteger minus = (seconds-(day*86400)-(hour*3600))/60;
    NSInteger second = (seconds-(day*86400)-(hour*3600)-minus*60);

    return [NSString stringWithFormat:@"%0.3zd :%0.2zd : %0.2zd : %0.2zd", day,hour,minus,second];
}

-(void)countDownWithDate:(NSDate*)date{
    [self stop];
    _timeFirst = date;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeText) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)countDownWithTimeInterval:(NSTimeInterval)timeInterval{
    [self stop];
    _timeFirst = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeText) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
}
-(void)setCountDownLableChange:(CountDownLableChange)countDownLableChange{
    _countDownLableChange = [countDownLableChange copy];
}
- (void)stop{
    if (_timer) {
        if ([_timer respondsToSelector:@selector(isValid)])
        {
            if ([_timer isValid])
            {
                [_timer invalidate];
                self.text= @"000 : 00 : 00 : 00";
            }
        }
    }
}
@end
