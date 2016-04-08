//
//  EOCEmployee.m
//  EOCProject
//
//  Created by June801 on 16/4/8.
//  Copyright © 2016年 June801. All rights reserved.
//

#import "EOCEmployee.h"
#import "EOCEmployeeDeveloper.h"
#import "EOCEmployeeDesigner.h"
#import "EOCEmployeeFinance.h"
@implementation EOCEmployee

+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type{
    switch (type) {
        case EOCEmployeeTypeDeveloper:
            return [EOCEmployeeDeveloper new];
            break;
        case EOCEmployeeTypeDesigner:
            return [EOCEmployeeDesigner new];
            break;
        case EOCEmployeeTypeFinance:
            return [EOCEmployeeFinance new];
            break;
    }
}

- (void)doADayWork{
    
}

@end
