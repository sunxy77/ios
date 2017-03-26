//
//  WaterFallFlowLayout.h
//  Example7-3
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterFallFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic, assign) NSInteger cellCount; // cell的个数
@property(nonatomic, strong) NSMutableArray *colArr; // 存放列的高度
@property(nonatomic, strong) NSMutableDictionary *attributeDict; // 存放cell的位置信息
@end
