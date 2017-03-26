//
//  WaterFallFlowLayout.m
//  Example7-3
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "WaterFallFlowLayout.h"

CGFloat const colCount = 3;
@implementation WaterFallFlowLayout
// 准备布局
-(void) prepareLayout {
    [super prepareLayout];
    
    _colArr = [NSMutableArray array];
    
    _attributeDict = [NSMutableDictionary dictionary];
    
    self.delegate = (id<UICollectionViewDelegateFlowLayout>)self.collectionView.delegate;
    
    _cellCount = [self.collectionView numberOfItemsInSection:0];
    
    if (_cellCount == 0) {
        return;
    }
    
    float top = 0;
    for (int i = 0; i < colCount; i++) {
        
        [_colArr addObject:[NSNumber numberWithFloat:top]];
        
        
        [self layoutItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
    }
    
    for( int i = 0; i < _cellCount; i++) {
        
    }
}

// 布避cell
-(void)layoutItemAtIndexPath:(NSIndexPath*)indexPath {
    // 通过协议我得到cell的间隙
    
    UIEdgeInsets edge = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.row];
    
    CGSize imgSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    float col = 0;
    float shortHeight = [[_colArr objectAtIndex:col] floatValue];
    for (int i = 0; i < _colArr.count; i++) {
        float height = [[_colArr objectAtIndex:i] floatValue];
        if (height < shortHeight) {
            shortHeight = height;
            col = i;
        }
    }
    
    // 确定cell的frame
    float top = [[_colArr objectAtIndex:col] floatValue];
    CGRect frame = CGRectMake(edge.left + col + (edge.left + imgSize.width), top + edge.top, imgSize.width, imgSize.height);
    
    // 更新列高
    [_colArr replaceObjectAtIndex:col withObject:[NSNumber numberWithFloat:top + edge.top + imgSize.height]];
    
    [_attributeDict setObject:indexPath forKey:NSStringFromCGRect(frame)];
}

-(NSArray*) indexPathsOfItem:(CGRect)rect {
    NSMutableArray *array = [NSMutableArray array];
    for (NSString *rectStr in _attributeDict) {
        CGRect cellRect = CGRectFromString(rectStr);
        
        if (CGRectIntersectsRect(cellRect, rect)) {
            NSIndexPath *indexPath = _attributeDict[rectStr];
            
            [array addObject:indexPath];
        }
        
    }
    return array;
}

// 返回cell的布局信息
- (NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *muArr = [NSMutableArray array];
    
    NSArray *indexPaths = [self indexPathsOfItem:rect];
    
    for (NSIndexPath *indexPath in indexPaths) {
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [muArr addObject:attribute];
    }
    
    return muArr;
}

// 计算collection view的内容大小
-(CGSize) collectionViewContentSize {
    CGSize size = self.collectionView.frame.size;
    
    float maxHeight = [[_colArr objectAtIndex:0] floatValue];
    
    for (int i = 0; i < _colArr; i++) {
        float colHeight = [[_colArr objectAtIndex:i] floatValue];
        if (colHeight > maxHeight) {
            maxHeight = colHeight;
        }
    }
    
    size.height = maxHeight;
    
    return size;
}
@end
