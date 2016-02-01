//
//  LoginViewController.m
//  Demo20150906
//
//  Created by June801 on 15/9/6.
//  Copyright (c) 2015年 June801. All rights reserved.
//

#import "LoginViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>


@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwdTF;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    

    [self touchIDVerify];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)useBtnPressed:(id)sender {
    [self touchIDVerify];
}

- (void)touchIDVerify{
    LAContext *context = [LAContext new];
    
    NSError *error;
    //    context.localizedFallbackTitle = @"";
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        NSLog(@"TouchID 能够使用！");
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                localizedReason:@"通过home键验证已有手机指纹"//NSLocalizedString(@"Use TouchID to log in.", nil)
                          reply:^(BOOL success,NSError *error){
                              if (success) {
                                  NSLog(@"验证成功");
                                  [self dismissViewControllerAnimated:YES completion:nil];
                              } else {
                                  if (error.code == kLAErrorUserFallback) {
                                      NSLog(@"用户点了输入密码");
                                  } else if(error.code == kLAErrorUserCancel){
                                      NSLog(@"用户点了取消");
                                  }else {
                                      NSLog(@"就是验证失败");
                                  }
                              }
                          }];
    } else {
        NSLog(@"我靠，你设备不支持TouchID:%@",error);
    }
}

- (IBAction)loginBtnPressed:(id)sender {
    if ([self.nameTF.text isEqualToString:@"aaa"] && [self.passwdTF.text isEqualToString:@"123456"]) {
        NSLog(@"身份验证成功");
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        NSLog(@"身份验证失败");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
