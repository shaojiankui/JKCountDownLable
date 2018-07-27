//
//  JKCountDownLable.h
//  JKCountDownLable
//
//  Created by Jakey on 15/8/18.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKCountDownLable;

typedef  NSString* (^CountDownLableChange)(JKCountDownLable *countDownLable,NSDate *endTime,NSTimeInterval seconds,NSDictionary *DHMSInfo,NSString *defaultText);
typedef NSString* (^countDownLableFinished)(JKCountDownLable *countDownLable,NSDate *endTime,NSTimeInterval seconds,NSString *defaultText);


@interface JKCountDownLable : UILabel
{
    NSTimer *_timer;
    NSDate *_endTime;
    NSDate *_beginTime;

    CountDownLableChange _countDownLableChange;
    countDownLableFinished _countDownLableFinished;
}
//倒计时开始时间
- (NSDate*)beginTime;
//倒计时结束时间
- (NSDate*)endTime;
//倒计时过去了N秒
- (NSTimeInterval)secondsPassed;
//倒计时还有N秒
- (NSTimeInterval)secondsRemain;
///截止日期
- (void)countDownWithDate:(NSDate*)date;
///距离当前时间timeInterval秒的截止日期
- (void)countDownWithTimeInterval:(NSTimeInterval)timeInterval;

- (void)countDownLableChange:(CountDownLableChange)countDownLableChange;

- (void)countDownLableFinished:(CountDownLableChange)countDownLableFinished;

///根据秒获取天,时,分,秒信息  key分别是 D H M S,value为NSIntger的NSNumber类型.
+ (NSDictionary*)getDHMSInfoWithSeconds:(NSTimeInterval)seconds;
@end
