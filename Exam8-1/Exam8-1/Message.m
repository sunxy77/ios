//
//  Message.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "Message.h"

@implementation Message

-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)messageWithDict:(NSDictionary*)dict {
    return [[Message alloc]initWithDict:dict];
}
@end
