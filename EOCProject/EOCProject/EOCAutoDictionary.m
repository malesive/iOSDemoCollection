//
//  EOCAutoDictionary.m
//  EOCProject
//
//  Created by June801 on 16/4/8.
//  Copyright © 2016年 June801. All rights reserved.
//

#import "EOCAutoDictionary.h"
@interface EOCAutoDictionary ()
@property (nonatomic, strong) NSMutableDictionary *backingStore;
@end
@implementation EOCAutoDictionary
@dynamic string, number, date, opaqueObject;

- (id)init{
    if ((self = [super init])) {
        _backingStore = [NSMutableDictionary new];
    }
    return self;
}
@end
