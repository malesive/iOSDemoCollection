//
//  ViewController.m
//  Demo20160201
//
//  Created by June801 on 16/2/1.
//  Copyright © 2016年 June801. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () //<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *logTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.logTextView addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
}

//处理属性改变事件
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    UITextView *mTextView = object;
//    NSLog(@"the textView content is change!!");
    [self scrollsToBottomAnimated:YES];
}
- (IBAction)print:(UIButton *)sender {
    [self addLogString:[NSString stringWithFormat:@"%@", [NSDate date]] inView:self.logTextView reverse:NO];
}

- (void)logTextViewScrollToBottom{
    [self.logTextView scrollRectToVisible:CGRectMake(0, self.logTextView.contentSize.height-15, self.logTextView.contentSize.width, 10) animated:YES];
}

- (void)scrollsToBottomAnimated:(BOOL)animated
{
    NSLog(@"scrollsToBottomAnimated");
    CGFloat offset = self.logTextView.contentSize.height - self.logTextView.bounds.size.height;
    if (offset > 0)
    {
        [self.logTextView setContentOffset:CGPointMake(0, offset) animated:animated];
    }
}

- (void)addLogString:(NSString *)logStr inView:(UITextView *)outputTextView reverse:(BOOL)flag
{
    logStr = [self replaceUnicode:logStr];
    NSString *additionStr = [logStr stringByAppendingString:@"\n\n"];
    NSString *preLogString = outputTextView.text;
    if (preLogString) {
        if (flag) {
            [outputTextView setText:[additionStr stringByAppendingString:preLogString]];
        }else{
            [outputTextView setText:[preLogString stringByAppendingString:additionStr]];
        }
    }else
    {
        [outputTextView setText:additionStr];
    }
}

- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
//    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
//                                                           mutabilityOption:NSPropertyListImmutable
//                                                                     format:NULL
//                                                           errorDescription:NULL];
    NSString* returnStr = [NSPropertyListSerialization propertyListWithData:tempData
                                                                     options:NSPropertyListImmutable
                                                                      format:NULL
                                                                       error:NULL];
    
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
