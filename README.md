# JKCountDownLable
JKCountDownLable,子类化UILable实现iOS倒计时Lable,天,时,分,秒

## 代码方式使用
    
    JKCountDownLable *_countDownCode;
    _countDownCode = [JKCountDownLable alloc]initWithFrame: CGRectMake(81, 200, 108, 32)];
    [self.view addSubview:_countDownCode];

     //设置最原始的text
     _countDownCode.text  = @"00 : 00 : 00";

    //[_countDownCode countDownWithDate:[NSDate dateWithTimeIntervalSinceNow:864000]];
    
    [_countDownCode countDownWithTimeInterval:1470614888];
 
     [_countDownCode countDownLableChange:^NSString *(JKCountDownLable *countDownLable, NSDate *endTime, NSTimeInterval second,NSDictionary *DHMSInfo, NSString *defaultText) {
        
        //自己格式化
        NSInteger D = [[DHMSInfo objectForKey:@"D"] integerValue];
        NSInteger H = [[DHMSInfo objectForKey:@"H"] integerValue];
        NSInteger M = [[DHMSInfo objectForKey:@"M"] integerValue];
        NSInteger S = [[DHMSInfo objectForKey:@"S"] integerValue];
        
        return [NSString stringWithFormat:@"%0.2zd : %0.2zd : %0.2zd", H,M,S];

         //使用控件内的默认格式化后的文本
        //return defaultText;
    }];
     [_countDownCode countDownLableFinished:^NSString *(JKCountDownLable *countDownLable, NSDate *endTime, NSTimeInterval seconds, NSDictionary *DHMSInfo, NSString *defaultText) {
        //自定义倒计时结束标题
        return @"00 : 00 : 00";
        //使用控件内的默认格式化后的文本
        //return defaultText;
    }];

## xib方式使用

    @property (weak, nonatomic) IBOutlet JKCountDownLable *countDownXib;

      //设置最原始的text
     self.countDownXib.text  = @"00 : 00 : 00";
     [self.countDownXib countDownWithDate:[NSDate dateWithTimeIntervalSinceNow:864000]];
    
    //[self.countDownXib countDownWithTimeInterval:1470614888];
    
      [self.countDownXib  countDownLableChange:^NSString *(JKCountDownLable *countDownLable, NSDate *endTime, NSTimeInterval second,NSDictionary *DHMSInfo, NSString *defaultText) {
            
            //自己格式化
            NSInteger D = [[DHMSInfo objectForKey:@"D"] integerValue];
            NSInteger H = [[DHMSInfo objectForKey:@"H"] integerValue];
            NSInteger M = [[DHMSInfo objectForKey:@"M"] integerValue];
            NSInteger S = [[DHMSInfo objectForKey:@"S"] integerValue];
            
            return [NSString stringWithFormat:@"%0.2zd : %0.2zd : %0.2zd", H,M,S];

    //        //使用控件内的默认格式化后的文本
    //        return defaultText;
        }];
     [self.countDownXib countDownLableFinished:^NSString *(JKCountDownLable *countDownLable, NSDate *endTime, NSTimeInterval seconds, NSDictionary *DHMSInfo, NSString *defaultText) {
        //自定义倒计时结束标题
        return @"00 : 00 : 00";
        //使用控件内的默认格式化后的文本
        //return defaultText;
    }];


## 效果图
![](https://raw.githubusercontent.com/shaojiankui/JKCountDownLable/master/demo.gif)
