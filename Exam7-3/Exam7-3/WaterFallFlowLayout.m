//
//  WaterFallFlowLayout.m
//  Example7-3
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "WaterFallFlowLayout.h"

#define colCount 2 // 定义列数

@implementation WaterFallFlowLayout

// 方法重写，准备布局
-(void) prepareLayout {
    [super prepareLayout];
    
    self.delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    
    // 初始化
    _colArr = [NSMutableArray array];
    
    for (int i = 0; i < colCount; i++) {
        [_colArr addObject:[NSNumber numberWithFloat:0.0]];
    }
    
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    
    if (_cellCount == 0) {
        return;
    }
    
    // 初始化，布局Cell，每个cell的frame对应一个indexPath，放入字典中
    _attributeDict = [NSMutableDictionary dictionary];
    
    for( int i = 0; i < _cellCount; i++) {
        [self layoutItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
    }
}

// 布局cell
-(void)layoutItemAtIndexPath:(NSIndexPath*)indexPath {
    // 通过协议我得到cell的间隙
    
    UIEdgeInsets edge = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    
    CGSize size = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    float col = [self colMinHeight];
    
    // 确定cell的frame
    float top = [[_colArr objectAtIndex:col] floatValue];
    CGRect frame = CGRectMake(col * (edge.left + size.width) + edge.left, top + edge.top, size.width, size.height);
    
    // 更新列高
    [_colArr replaceObjectAtIndex:col withObject:[NSNumber numberWithFloat:top + edge.top + size.height]];
    
    //每个cell的frame对应一个indexPath，放入字典中
    [_attributeDict setObject:indexPath forKey:NSStringFromCGRect(frame)];
}

// 计算最小高度的列
- (float)colMinHeight {
    float ret = 0;
    float shortHeight = [[_colArr objectAtIndex:ret] floatValue];
    
    NSUInteger len = _colArr.count;
    for (int i = 0; i < len; i++) {
        float height = [[_colArr objectAtIndex:i] floatValue];
        if (height < shortHeight) {
            shortHeight = height;
            ret = i;
        }
    }
  
    return ret;
}

// 获取最长列的高度
- (float)maxHeight {
    float ret = [[_colArr objectAtIndex:0] floatValue];
    
    NSUInteger len = _colArr.count;
    for (int i = 0; i < len; i++) {
        float colHeight = [[_colArr objectAtIndex:i] floatValue];
        if (colHeight > ret) {
            ret = colHeight;
        }
    }
    
    return ret;
}

// 方法重写，计算collection view的内容大小
-(CGSize) collectionViewContentSize {
    CGSize size = self.collectionView.frame.size;
    
    size.height = [self maxHeight];
    
    return size;
}

//返回指定区域cell的indexPath数组
-(NSArray*) indexPathsOfItem:(CGRect)rect {
    NSMutableArray *ret = [NSMutableArray array];
    
    for (NSString *str in _attributeDict) {
        CGRect cellRect = CGRectFromString(str);
        
        if (CGRectIntersectsRect(cellRect, rect)) {
            NSIndexPath *indexPath = _attributeDict[str];
            
            [ret addObject:indexPath];
        }
    }
    
    return ret;
}

// 方法重写，<UICollectionViewLayout>
// 返回指定区域cell的布局信息即frame值
- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *ret = [NSMutableArray array];
    
    NSArray *arr = [self indexPathsOfItem:rect];
    
    for (NSIndexPath *indexPath in arr) {
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [ret addObject:attribute];
    }
    
    return ret;
}

// 重写方法， <UICollectionViewLayout>
// 设置每个item的attributes，在这里，我们只需要简单的设置每个item的attributes.frame即可
-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *ret = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    for (NSString *str in _attributeDict) {
        if (_attributeDict[str] == indexPath) {
            ret.frame = CGRectFromString(str);
            
            return ret;
        }
    }
    
    return ret;
}
@end
