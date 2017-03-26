//
//  Friend.m
//  Example7-2c
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "Friend.h"

@implementation Friend

-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)friendWithDict:(NSDictionary*)dict {
    return [[Friend alloc]initWithDict:dict];
}
@end
