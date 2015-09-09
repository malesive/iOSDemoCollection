//
//  ViewController.m
//  NSTimerDemo
//
//  Created by June801 on 15/9/7.
//  Copyright (c) 2015年 June801. All rights reserved.
//

//好吧，其实这里GCD的东西更多
//参考链接：http://www.cnblogs.com/wendingding/p/3807265.html

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSTimer *reSendTimer;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    NSLog(@"github test003");
    
    //第一种 每一秒执行一次（重复性）
//    double delayInSeconds = 1.0;
//    timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0));
//    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC, 0.0);
//    dispatch_source_set_event_handler(timer, ^{
//        NSLog(@"timer date 1== %@",[NSDate date]);
//    });
//    dispatch_resume(timer);
    
    //第二种 二秒后执行 （一次性）
//    double delayInSeconds = 2.0;
//    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
//    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
//        NSLog(@"timer date 2== %@",[NSDate date]);
//    });
    
    //第三种 每一秒执行一次 （重复性）
    self.reSendTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(testTimer) userInfo:nil repeats:YES];
    
    //GCD
    //打印主线程
    NSLog(@"打印主线程--%@", [NSThread mainThread]);
    
    //1.获取主队列
    dispatch_queue_t queue=dispatch_get_main_queue();
    //2.把任务添加到主队列中执行
    dispatch_async(queue, ^{
        NSLog(@"使用异步函数执行主队列中的任务1--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"使用异步函数执行主队列中的任务2--%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"使用异步函数执行主队列中的任务3--%@",[NSThread currentThread]);
    });
    
    //开启一个后台线程，调用执行test方法
    [self performSelectorInBackground:@selector(test) withObject:nil];
}

-(void)test
{
    NSLog(@"当前线程---%@",[NSThread currentThread]);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    //异步函数
    dispatch_async(queue, ^{
        NSLog(@"任务4所在的线程----%@",[NSThread currentThread]);
    });
    
    //同步函数
    dispatch_sync(queue, ^{
        NSLog(@"任务5所在的线程----%@",[NSThread currentThread]);
    });
}

- (void)testTimer{
    NSLog(@"testTimer = %@",[NSDate date]);
}

//当手指触摸屏幕的时候，从网络上下载一张图片到控制器的view上显示
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //1.获取一个全局串行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //2.把任务添加到队列中执行
    dispatch_async(queue, ^{
        
        //打印当前线程
        NSLog(@"当前线程 - %@",[NSThread currentThread]);
        //3.从网络上下载图片
//        NSURL *urlstr=[NSURL URLWithString:@"http://h.hiphotos.baidu.com/baike/w%3D268/sign=30b3fb747b310a55c424d9f28f444387/1e30e924b899a9018b8d3ab11f950a7b0308f5f9.jpg"];
        NSURL *urlstr=[NSURL URLWithString:@"http://a.hiphotos.baidu.com/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ef8492ff402309f7f362a54013676796/023b5bb5c9ea15ce961d6762b0003af33b87b2ee.jpg"];

        NSData *data=[NSData dataWithContentsOfURL:urlstr];
        UIImage *image=[UIImage imageWithData:data];
        //提示
        NSLog(@"图片加载完毕");
        
        //4.回到主线程，展示图片
//        [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image=image;
            //打印当前线程
            NSLog(@"%@",[NSThread currentThread]);
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
