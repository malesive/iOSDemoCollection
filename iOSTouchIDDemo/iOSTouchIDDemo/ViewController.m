//
//  ViewController.m
//  Demo20150906
//
//  Created by June801 on 15/9/6.
//  Copyright (c) 2015年 June801. All rights reserved.
//

//这个demo主要1.按照网上文章做了touchID的使用，参考链接：http://blog.csdn.net/lgouc/article/details/39829409
//2.

#import "ViewController.h"
#import "LoginViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self performSelectorOnMainThread:@selector(showLogin) withObject:nil waitUntilDone:NO];
}


- (void)showLogin{
//    LoginViewController *loginVC = [[LoginViewController alloc] init];
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    LoginViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"login"];
    
    [self presentViewController:loginVC
                       animated:YES
                     completion:nil];
}
- (IBAction)showLoginBtnPressed:(id)sender {
    [self showLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
