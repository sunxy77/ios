//
//  MeiTuan.m
//  Exam7-1
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "MeiTuan.h"

@implementation MeiTuan

-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)meiTuanWithDict:(NSDictionary*)dict {
    return [[MeiTuan alloc]initWithDict:dict];
}

@end
