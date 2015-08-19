//
//  JKCountDownLable.h
//  JKCountDownLable
//
//  Created by Jakey on 15/8/18.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^CountDownLableChange)(NSDate *startTime,double time,NSString *text);
@interface JKCountDownLable : UILabel
{
    NSTimer *_timer;
    NSDate *_timeFirst;
    CountDownLableChange _countDownLableChange;
}

-(void)countDownWithDate:(NSDate*)date;
-(void)countDownWithTimeInterval:(NSTimeInterval)timeInterval;

-(void)setCountDownLableChange:(CountDownLableChange)countDownLableChange;
@end
