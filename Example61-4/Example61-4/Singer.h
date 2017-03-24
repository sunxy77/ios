//
//  Singer.h
//  歌手模型
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singer : NSObject

@property(nonatomic, copy) NSString *name; // 歌手
@property(nonatomic, copy) NSString *songname; // 歌曲名称
@property(nonatomic, copy) NSString *pic; // 歌手图片

-(instancetype)initWithDict:(NSDictionary*)dict; // 根据字典创建一个模型
+(instancetype)singerWithDict:(NSDictionary*)dict; // 根据字典创建一个模型

@end
