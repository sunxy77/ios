//
//  Message.h
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property(nonatomic, copy) NSString *pic;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *msg;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)messageWithDict:(NSDictionary*)dict;
@end
