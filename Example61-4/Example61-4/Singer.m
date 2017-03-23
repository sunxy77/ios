//
//  Singer.m
//  Example61-4
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "Singer.h"

@implementation Singer

-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
    
}

+(instancetype)singerWithDict:(NSDictionary*)dict {
    return [[Singer alloc] initWithDict:dict];
}

@end
