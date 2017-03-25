//
//  download.h
//  Example6-1b
//
//  Created by 孙晓晔 on 2017/3/25.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol downloadDelegate <NSObject>

-(void)downloadFinish;

@end

typedef void (^myBlock)();

@interface download : NSObject

-(void)downloadFile:(NSString*)strURL;

// @property(nonatomic,strong)id<downloadDelegate> delegate;

@property(nonatomic,weak)myBlock myNoticeBlock;

@end
