//
//  EOCAutoDictionary.h
//  EOCProject
//
//  Created by June801 on 16/4/8.
//  Copyright © 2016年 June801. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EOCAutoDictionary : NSObject
@property (nonatomic, strong) NSString *string;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id opaqueObject;
@end
