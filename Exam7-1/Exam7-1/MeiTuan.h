//
//  MeiTuan.h
//  Exam7-1
//
//  Created by 孙晓晔 on 2017/3/27.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeiTuan : NSObject
@property(nonatomic, copy) NSString *pic;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *price;
@property(nonatomic, copy) NSString *sold;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)meiTuanWithDict:(NSDictionary*)dict;
@end
