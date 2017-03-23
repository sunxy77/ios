//
//  Singer.h
//  Example61-4
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singer : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *songname;
@property(nonatomic, copy) NSString *pic;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)singerWithDict:(NSDictionary*)dict;

@end
