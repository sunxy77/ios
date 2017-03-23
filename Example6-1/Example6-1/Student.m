//
//  Student.m
//  Example6-1
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype)initWithDict:(NSDictionary*)dict {
    self = [super init];
    
    if (self) {
//        self.name = dict[@"name"];
//        self.sex = dict[@"sex"];
//        self.age = [dict[@"age"] intValue];
        
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(instancetype)studentWithDict:(NSDictionary*)dict {
    
    return [[Student alloc] initWithDict:dict];
}

@end
