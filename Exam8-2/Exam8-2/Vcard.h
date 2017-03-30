//
//  Vcard.h
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vcard : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *tel;

-(instancetype)initWithDict:(NSDictionary*)dict;
+(instancetype)vcardWithDict:(NSDictionary*)dict;
@end
