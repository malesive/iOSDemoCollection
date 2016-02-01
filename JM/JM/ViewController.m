//
//  ViewController.m
//  JM
//
//  Created by June801 on 15/8/13.
//  Copyright (c) 2015年 June801. All rights reserved.
//

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

//Reference
//中文字符ASCII码和NSString相互转换:http://www.2cto.com/kf/201309/243443.html

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *tf1;
@property (weak, nonatomic) IBOutlet UITextView *tf2;
@property (weak, nonatomic) IBOutlet UITextView *tf3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSMutableArray *t = [[NSMutableArray alloc] initWithCapacity:10];
//    [t insertObject:@"aaa" atIndex:4];
//    NSMutableArray *array = [[NSMutableArray alloc] init];
//    
//    for (NSInteger i = 0; i < 4; ++i)
//    {
//        [array addObject:[NSNull null]];
//    }
//    
//    [array replaceObjectAtIndex:0 withObject:@"aaa"];
//    [array replaceObjectAtIndex:3 withObject:@"bbb"];
//    NSLog(@"array=%@",array);
//    
//    
//    NSLog(@"%f,%f",ceil(8/3),floor(8/3));
//    
//    NSString *tmp = @"asdfghjkl";
//    NSLog(@"%ld",[tmp rangeOfString:@"j"].location);
//    [self stoi41];
    
    NSString *tmp2 = @"我是大侠";
//    NSLog(@"tmp2 = %@",nsstring);
    for (int i = 0; i < tmp2.length; i++) {
        NSLog(@"%d",[tmp2 characterAtIndex:i]);
    }
    
//    NSLog(@"stoi41 = %@",[self stoi41]);
//    NSLog(@"i41tos = %@",[self i41tos]);
    
    NSString *theString = @"家";
    unichar theChar = 25105;//[theString characterAtIndex:0];
    NSString *theString1 = [NSString stringWithFormat:@"%c", theChar];
    NSString *theString2 = [NSString stringWithFormat:@"%C", theChar];
    NSLog(@"theString=%@,%d,%@,%@",theString,theChar,theString1,theString2);
    
    self.tf1.delegate = self;
    self.tf2.delegate = self;
    self.tf3.delegate = self;
}

- (IBAction)stoi41:(id)sender {
//    [self.tf1 resignFirstResponder];
//    [self.tf2 resignFirstResponder];
//    [self.tf3 resignFirstResponder];
//    [self liftDownView];
    self.tf3.text = [self stoi41WithInputString:self.tf1.text andJMString:self.tf2.text];
}
- (IBAction)i41tos:(id)sender {
//    [self.tf1 resignFirstResponder];
//    [self.tf2 resignFirstResponder];
//    [self.tf3 resignFirstResponder];
//    [self liftDownView];
    self.tf1.text = [self i41tosWithInputString:self.tf3.text andJMString:self.tf2.text];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)stoi41WithInputString:(NSString *)str andJMString:(NSString *)jms{
//    NSString *sdf3 = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcde";
    NSString *sdf3 = jms;

    NSMutableString *t = [[NSMutableString alloc] init];
    NSMutableString *aa = [[NSMutableString alloc] init];
    unichar a,a1,a2,a3;
//    NSArray *b = [sdf3 componentsSeparatedByString:@""];
//    NSMutableArray *b = [[NSMutableArray alloc] init];
//    for (int j = 0; j < sdf3.length; j ++) {
//        [b addObject:[NSString stringWithFormat:@"%d",[sdf3 characterAtIndex:j]]];
//    }
//    NSLog(@"b[3] = %@",b[3]);
    
//    for (int i = 0; i < self.tf1.text.length; i ++) {
    for (int i = 0; i < str.length; i ++) {
        a = [str characterAtIndex:i];
        a1=a%41;
        a=(a-a1)/41;
        a2=a%41;
        a=(a-a2)/41;
        a3=a%41;
//        t+=b[a3]+b[a2]+b[a1];
//        NSLog(@"%@",[b[a3] isKindOfClass:[NSString class]]?@"y":@"n");
//        [t appendString:b[a3]];//[NSString stringWithFormat:@"%d",b[a3]]
//        [t appendString:b[a2]];
//        [t appendString:b[a1]];
        [t appendString:[NSString stringWithFormat:@"%C",[sdf3 characterAtIndex:a3]]];//[NSString stringWithFormat:@"%d",b[a3]]
        [t appendString:[NSString stringWithFormat:@"%C",[sdf3 characterAtIndex:a2]]];
        [t appendString:[NSString stringWithFormat:@"%C",[sdf3 characterAtIndex:a1]]];
//        NSLog(@"b[a3],b[a2],b[a1] = %@,%@,%@",b[a3],b[a2],b[a1]);
    }
    NSLog(@"t = %@",t);//[t dataUsingEncoding:NSUTF8StringEncoding]
    a = 'z';
    for (int z = 0; z < t.length; z+=3) {
        if ([t characterAtIndex:z] != 'A') {
            return t;
        }
//        a+=t.substr(x+1,2)
        [aa appendString:[NSString stringWithFormat:@"%c",'z']];
        [aa appendString:[t substringWithRange:NSMakeRange(z+1, 2)]];
        
        
    }
    
    return aa;
}

//function i41tos(str)
//{
//    ;var a1,a2,a3,b=sdf3.value,d=0,t,a;
//    if(str.charAt(0)=="z")
//    {
//        t=new Array(Math.floor((str.length-1)/2))
//        a=t.length;
//        for(var x=0;x<a;x++)
//        {
//            d++;
//            a2=b.indexOf(str.charAt(d))
//            d++;
//            a3=b.indexOf(str.charAt(d))
//            t[x]=a2*41+a3
//        }
//    };
//    else
//    {
//        t=new Array(Math.floor(str.length/3))
//        a=t.length;
//        for(var x=0;x<a;x++)
//        {
//            a1=b.indexOf(str.charAt(d))
//            d++;
//            a2=b.indexOf(str.charAt(d))
//            d++;
//            a3=b.indexOf(str.charAt(d))
//            d++;
//            t[x]=a1*1681+a2*41+a3
//        }
//    }
//    a=eval("String.fromCharCode("+t.join(',')+")");
//    return a
//}

//- (NSString *)i41tos{
- (NSString *)i41tosWithInputString:(NSString *)str andJMString:(NSString *)jms{

    unichar a1,a2,a3,a;
//    NSString *sdf3 = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcde";
//    NSString *b = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcde";
    NSString *b = jms;

//    NSString *str = self.tf3.text;
    NSArray *result = [[NSArray alloc] init];

//    NSMutableString *t = [[NSMutableString alloc] init];
    int d = 0;
    
    if ([str characterAtIndex:0] == 'z') {
//        NSMutableArray *t = [[NSMutableArray alloc]initWithCapacity:floor((str.length-1)/2)];
        NSMutableArray *t = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < floor((str.length-1)/2); ++i)
        {
            [t addObject:[NSNull null]];
        }
        
        a = floor((str.length-1)/2);
        for (int j = 0; j < a; j++) {
            d++;
            a2 = [b rangeOfString:[NSString stringWithFormat:@"%C",[str characterAtIndex:d]]].location;
            d++;
            a3 = [b rangeOfString:[NSString stringWithFormat:@"%C",[str characterAtIndex:d]]].location;
            [t replaceObjectAtIndex:j withObject:@(a2*41+a3)];
        }
        result = [NSArray arrayWithArray:t];
    } else {
        NSMutableArray *t = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < floor(str.length/3); ++i)
        {
            [t addObject:[NSNull null]];
        }
        a=floor(str.length/3);
        for (int x = 0; x<a; x++) {
//            a1=b.indexOf(str.charAt(d))
//            d++;
//            a2=b.indexOf(str.charAt(d))
//            d++;
//            a3=b.indexOf(str.charAt(d))
//            d++;
//            t[x]=a1*1681+a2*41+a3
            a1 = [b rangeOfString:[NSString stringWithFormat:@"%C",[str characterAtIndex:d]]].location;
            d++;
            a2 = [b rangeOfString:[NSString stringWithFormat:@"%C",[str characterAtIndex:d]]].location;
            d++;
            a3 = [b rangeOfString:[NSString stringWithFormat:@"%C",[str characterAtIndex:d]]].location;
            d++;
            [t replaceObjectAtIndex:x withObject:@(a1*1681+a2*41+a3)];
        }
        result = [NSArray arrayWithArray:t];

    }
    
    NSLog(@"result=%@",result);
    NSMutableString *resultString = [[NSMutableString alloc] init];
    //    a=eval("String.fromCharCode("+t.join(',')+")");
    for (int j = 0; j<result.count; j++) {
        
        unichar theChar = (unichar)[result[j] integerValue];
//        unsigned int kk = [result[j] integerValue];
//        unsigned short kk2 = result[j];
//        NSLog(@"%@",result[j]);
        NSString *theString1 = [NSString stringWithFormat:@"%C", theChar];
        NSLog(@"theString1 = %@",theString1);
//        NSString *stringFloat = [NSString stringWithFormat:@"%@",result[j]];
        [resultString appendString:theString1];
    }
//    NSString *stringFloat = [NSString stringWithFormat:@"%C",intString];
//    NSString *string = [result componentsJoinedByString:@""];
    return resultString;
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
//    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];//适配4s弹出键盘而添加
    
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //上移n个单位，按实际情况设置
    CGRect rect=CGRectMake(0.0f,-(241-0),width,height);//130
    self.view.frame=rect;
    [UIView commitAnimations];
    return YES;
}

//下移view只能和键盘消失一起使用
- (void)liftDownView{
    NSTimeInterval animationDuration=0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    //上移n个单位，按实际情况设置
    CGRect rect=CGRectMake(0.0f,+0,width,height);//130
    self.view.frame=rect;
    [UIView commitAnimations];
}

//点击空白取消键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    
    if (![touch.view isKindOfClass: [UITextField class]] || ![touch.view isKindOfClass: [UITextView class]]) {
        
        [self.view endEditing:YES];
        
        //键盘消失同时下移view
        [self liftDownView];
    }
    
}

/*
- (void)jm2
{
    sdf3.value="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcde";
    function stoi41(str)
    {
        ;var t="";
        var a,a1,a2,a3;
        var b=sdf3.value.split("");
        for(var x=0;x<str.length;x++)
        {
            a=str.charCodeAt(x)
            a1=a%41;
            a=(a-a1)/41;
            a2=a%41;
            a=(a-a2)/41;
            a3=a%41;
            t+=b[a3]+b[a2]+b[a1]
        }
        a="z";
        for(var x=0;x<t.length;x+=3)
        {
            if(t.charAt(x)!="A")
            {
                return t
            }
            a+=t.substr(x+1,2)
        }
        return a
    }
    function i41tos(str)
    {
        ;var a1,a2,a3,b=sdf3.value,d=0,t,a;
        if(str.charAt(0)=="z")
        {
            t=new Array(Math.floor((str.length-1)/2))
            a=t.length;
            for(var x=0;x<a;x++)
            {
                d++;
                a2=b.indexOf(str.charAt(d))
                d++;
                a3=b.indexOf(str.charAt(d))
                t[x]=a2*41+a3
            }
        };
        else
        {
            t=new Array(Math.floor(str.length/3))
            a=t.length;
            for(var x=0;x<a;x++)
            {
                a1=b.indexOf(str.charAt(d))
                d++;
                a2=b.indexOf(str.charAt(d))
                d++;
                a3=b.indexOf(str.charAt(d))
                d++;
                t[x]=a1*1681+a2*41+a3
            }
        }
        a=eval("String.fromCharCode("+t.join(',')+")");
 return a
 }
}
*/

@end
