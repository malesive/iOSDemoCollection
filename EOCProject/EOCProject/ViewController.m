//
//  ViewController.m
//  EOCProject
//
//  Created by June801 on 16/4/8.
//  Copyright © 2016年 June801. All rights reserved.
//

#import "ViewController.h"
#import "EOCEmployee.h"
#import <objc/runtime.h>
#import "NSString+RunTime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test2];
}

- (void)test2{
    EOCEmployee *employee = [EOCEmployee employeeWithType:EOCEmployeeTypeDeveloper];
//    [employee performSelector:@selector(msg1)];
    
    NSString *str = @"testStr";
    NSLog(@"result = %@",[str hasPrefix:@"testS" ]?@"yes":@"no");
    
    Method originalMethod = class_getInstanceMethod([NSString class], @selector(lowercaseString));
    Method swappedMethod = class_getInstanceMethod([NSString class], @selector(eoc_lowercaseString));
    method_exchangeImplementations(originalMethod, swappedMethod);
    
    NSString *s1 = @"You sOn oF bITch";
    NSString *ls = [s1 lowercaseString];
    NSLog(@"ls = %@",ls);
    
    NSString *us = [s1 uppercaseString];
    NSLog(@"us = %@",us);
    
    
}

- (void)test{
    EOCEmployee *employee = [EOCEmployee employeeWithType:EOCEmployeeTypeDeveloper];
    BOOL re = [employee isMemberOfClass:[EOCEmployee class]];
    NSLog(@"%@",re?@"yes":@"no");
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    BOOL re1 = [btn isMemberOfClass:[UIButton class]];
    NSLog(@"%@",re1?@"yes":@"no");
    
    NSArray *a1 = @[@"12",@"34"];
    NSArray *arr = [NSArray arrayWithArray:a1];
    BOOL re2 = [arr isKindOfClass:[NSArray class]];
    NSLog(@"%@",re2?@"yes":@"no");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
