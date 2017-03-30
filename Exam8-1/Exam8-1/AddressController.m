//
//  AddressController.m
//  Exam8-1
//
//  Created by 孙晓晔 on 2017/3/29.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "AddressController.h"
#import "Vcard.h"
#import "VcardCell.h"

@interface AddressController ()
@property(nonatomic,copy)NSMutableArray *vcards; // 存放分组数据
@property(nonatomic,copy)NSMutableArray *groups; // 存放本地化索引名称
@end

@implementation AddressController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self prepare];
}

// 数据处理
-(void)prepare {
    
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    NSArray *titles = [collation sectionTitles];
    
    NSMutableArray *arr27 = [[NSMutableArray alloc] initWithCapacity:titles.count];
    
    //初始化27个空数组
    for (NSInteger index = 0; index < titles.count; index++) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [arr27 addObject:array];
    }
    
    NSArray *plist = [self plist];
    // 分组
    for (Vcard *vcard in plist) {
        //获取name属性的值所在的位置，比如"林丹"，首字母是L，在A~Z中排第11
        NSInteger index = [collation sectionForObject:vcard collationStringSelector:@selector(name)];
        
        //把name为“林丹”的p加入_arr27中的第11个数组中去
        [arr27[index] addObject:vcard];
    }
    
    _vcards = [NSMutableArray array];
    _groups = [NSMutableArray array];
    
    // 删除空分组
    for (NSInteger index = 0; index < titles.count; index++) {
        NSMutableArray *buf = arr27[index];
        
        if (buf.count > 0) {
            [_vcards addObject:arr27[index]];
            
            [_groups addObject:titles[index]];
        }
    }
    
    // 同组排序
    for (NSInteger index = 0; index < _vcards.count; index++) {
        NSMutableArray *buf = _vcards[index];
        
        _vcards[index] = [collation sortedArrayFromArray:buf collationStringSelector:@selector(name)];
    }
}

// 读取plist文件
-(NSArray*)plist {
    NSString *strPath = [[NSBundle mainBundle]pathForResource:@"address.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
    
    NSMutableArray *muArr = [NSMutableArray array];
    
    for (NSDictionary *dict in arr) {
        Vcard *obj = [Vcard vcardWithDict:dict];
        
        [muArr addObject:obj];
    }
    
    return muArr;
}

#pragma mark - UITableViewDataSource
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"";
    }
    
    return _groups[section-1];
}

#pragma mark - UITableViewDataSource
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    return _groups;
}

#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    return index+1;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return 15;
    }
    
    return 30;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.groups.count + 1;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    
    NSArray *arr = self.vcards[section-1];
    
    return arr.count;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strIndetifier = @"mycell";
    
    VcardCell *cell = [tableView dequeueReusableCellWithIdentifier:strIndetifier];
    
    if (cell == nil) {
        
        cell = [[VcardCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIndetifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (indexPath.section) {
        case 0:
            [self section_0:cell cellForRowAtIndexPath:indexPath];
            break;
        default:
            [self vcard:cell cellForRowAtIndexPath:indexPath];
            break;
    }
    
    return cell;
}

-(void)section_0:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"新的朋友";
            cell.imageView.image = [UIImage imageNamed:@"b"];
            break;
        case 1:
            cell.textLabel.text = @"群聊";
            cell.imageView.image = [UIImage imageNamed:@"c"];
            break;
        case 2:
            cell.textLabel.text = @"标签";
            cell.imageView.image = [UIImage imageNamed:@"e"];
            break;
        case 3:
            cell.textLabel.text = @"公众号";
            cell.imageView.image = [UIImage imageNamed:@"f"];
            break;
        default:
            break;
    }
}

-(void)vcard:(UITableViewCell*)cell cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger section = indexPath.section - 1;
    
    NSArray *arr = self.vcards[section];
    
    if (arr.count == 0) {
        return;
    }
    
    Vcard *vcard = self.vcards[section][indexPath.row];
    
    cell.textLabel.text = vcard.name;
    cell.imageView.image = [UIImage imageNamed:vcard.pic];
    
    // 图片圆角处理
    cell.imageView.layer.cornerRadius = 8;
    cell.imageView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
