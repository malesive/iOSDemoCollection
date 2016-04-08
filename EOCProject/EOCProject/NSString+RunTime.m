//
//  NSString+RunTime.m
//  EOCProject
//
//  Created by June801 on 16/4/8.
//  Copyright © 2016年 June801. All rights reserved.
//

#import "NSString+RunTime.h"

@implementation NSString(RunTime)
- (NSString *)eoc_lowercaseString{
    NSString *lowercase = [self eoc_lowercaseString];
    NSLog(@"%@ => %@",self, lowercase);
    return lowercase;
}

@end
