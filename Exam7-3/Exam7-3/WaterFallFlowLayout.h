//
//  AppDelegate.h
//  Exam7-3
//
//  Created by 孙晓晔 on 2017/3/28.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallFlowLayout: UICollectionViewFlowLayout


@property (nonatomic,assign) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic,assign) NSInteger cellCount;
@property (nonatomic, strong) NSMutableArray *colArr;
@property(nonatomic, strong) NSMutableDictionary *attributeDict;
@end

