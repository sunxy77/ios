//
//  download.m
//  Example6-1b
//
//  Created by 孙晓晔 on 2017/3/25.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "download.h"

@implementation download

-(void)downloadFile:(NSString*)strURL {
    
    // 1,下载文件
    
    // 2,调用另外的函数去下载（启动另一个线程去下载），直接返回
    
    [self realDownload];
    
}

-(void)realDownload {
    // 启动一个线程
    // 下载完成，通知调用者
    
    // 通知调用者
//    if ([self.delegate respondsToSelector:@selector(downloadFinish)]) {
//        [self.delegate downloadFinish];
//    }
    
    if (self.myNoticeBlock) {
        self.myNoticeBlock();
    }
}
@end
