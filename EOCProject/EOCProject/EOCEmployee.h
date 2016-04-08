//
//  EOCEmployee.h
//  EOCProject
//
//  Created by June801 on 16/4/8.
//  Copyright © 2016年 June801. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EOCEmployeeType) {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};

typedef enum _don {
    left,
    right,
}don;

@interface EOCEmployee : NSObject
@property (copy) NSString *name;
@property NSUInteger salary;
/**
 *  <#Description#>
 *
 *  @param type <#type description#>
 *
 *  @return <#return value description#>
 */
+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type;
/**
 *  <#Description#>
 */
- (void)doADayWork;
@end
