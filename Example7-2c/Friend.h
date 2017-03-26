//
//  Friend.h
//  Example7-2c
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friend : NSObject

@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *say;
@property(nonatomic, copy) NSString *sayTime;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)friendWithDict:(NSDictionary*)dict;
@end
