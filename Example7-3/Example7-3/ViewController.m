//
//  ViewController.m
//  Example7-3
//
//  Created by 孙晓晔 on 2017/3/26.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "WaterFallFlowLayout.h"
#import "WaterFallCollectionViewCell.h"

CGFloat const kImgCount = 15; // 图片数量
 #define fImgWidth 150 // 图片宽度
// #define fImgWidth [UIScreen mainScreen].bounds.size.width / 3 - 5 // 图片宽度
static NSString *identifier = @"collectionView"; // 标识符

@interface ViewController ()
@property(nonatomic, strong) NSArray *imgArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    WaterFallFlowLayout *flowLayout = [[WaterFallFlowLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor yellowColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    // 注册单元格
    [self.collectionView registerClass:[WaterFallCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    [self.view addSubview:self.collectionView];
}


#pragma mark
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imgArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    WaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[WaterFallCollectionViewCell alloc] init];
    }
    
    cell.image = self.imgArr[indexPath.item];
    
    return cell;
}

-(float)imgHeight:(float)height width:(float)width {
    float ret = height / width * fImgWidth;
    
    return ret;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *img = self.imgArr[indexPath.item];
    float heigth = [self imgHeight:img.size.height width:img.size.width];
    
    return CGSizeMake(fImgWidth, heigth);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    UIEdgeInsets ret = {5, 5, 5, 5};
    
    return ret;
}

-(NSArray*)imgArr {
    
    if (_imgArr == nil) {
        NSMutableArray *muArr = [NSMutableArray array];
        
        for (int i = 1; i <= kImgCount; i++) {
            UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"5/%d.jpg", i]];
            
            [muArr addObject:img];
        }
        
        _imgArr = muArr;
        
    }
    
    return _imgArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
