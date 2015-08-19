# JKCountDownLable
JKCountDownLable,子类化UILable实现iOS倒计时Lable,天,时,分,秒

##代码方式使用
    JKCountDownLable *_countDownCode;
    _countDownCode = [JKCountDownLable alloc]initWithFrame: CGRectMake(81, 200, 108, 32)];
    [self.view addSubview:_countDownCode];
    //[_countDownCode countDownWithDate:[NSDate dateWithTimeIntervalSinceNow:864000]];
    
    [_countDownCode countDownWithTimeInterval:1470614888];
    [_countDownCode setCountDownLableChange:^(NSDate *startTime, double time, NSString *text) {
        NSLog(@"text%@",text);
    }];
##xib方式使用
    @property (weak, nonatomic) IBOutlet JKCountDownLable *countDownXib;

     [self.countDownXib countDownWithDate:[NSDate dateWithTimeIntervalSinceNow:864000]];
    
    //[self.countDownXib countDownWithTimeInterval:1470614888];
    
    [self.countDownXib setCountDownLableChange:^(NSDate *startTime, double time, NSString *text) {
        NSLog(@"text%@",text);

    }];


##效果图
![](https://raw.githubusercontent.com/shaojiankui/JKCountDownLable/master/demo.gif)