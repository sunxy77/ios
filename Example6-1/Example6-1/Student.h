//
//  Student.h
//  Example6-1
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *sex;
@property(nonatomic, assign) int age;
@property(nonatomic, strong) Student *friend;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)studentWithDict:(NSDictionary*)dict;

@end
