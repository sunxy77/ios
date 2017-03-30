//
//  Vcard.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "Vcard.h"

@implementation Vcard

-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)vcardWithDict:(NSDictionary*)dict {
    return [[Vcard alloc]initWithDict:dict];
}
@end
