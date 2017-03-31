//
//  ContactController.m
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ContactController.h"
#import "ContactAddController.h"
#import "ContactEditController.h"
#import "Vcard.h"

@interface ContactController ()<ContactAddControllerDelegate, ContactEditControllerDelegate>
@property(nonatomic,strong) NSMutableArray *vcardArr;
@end

@implementation ContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self vcardArr];
}

#pragma mark - ContactAddController
- (void)addVcard:(ContactAddController *)addController vcard:(Vcard *)vcard {
 
    // 添加数据模型
    [self.vcardArr addObject:vcard];
    
    // 刷新表视图
    [self.tableView reloadData];
    
}

#pragma mark - ContactEditControllerDelegate
- (void)editVcard:(ContactEditController *)editController vcard:(Vcard *)vcard {
    
    [self.tableView reloadData];
}

// 懒加载
-(NSArray*)vcardArr {
    if (_vcardArr == nil) {
        NSString *strPath = [[NSBundle mainBundle]pathForResource:@"address.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
        
        NSMutableArray *muArr = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            Vcard *obj = [Vcard vcardWithDict:dict];
            
            [muArr addObject:obj];
        }
        
        _vcardArr = muArr;
    }
    
    return _vcardArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _vcardArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *identifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    Vcard *vcard = self.vcardArr[indexPath.row];
    
    cell.textLabel.text = vcard.name;
    
    return cell;
}

#pragma mark - UITableViewDataSource
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:@"contact2edit" sender:nil];
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSString *str = segue.identifier;
    
    if ([str isEqualToString:@"contact2add"]) {
        ContactAddController *add = segue.destinationViewController;
        add.delegate = self;
    } else if ([str isEqualToString:@"contact2edit"]) {
        ContactEditController *edit = segue.destinationViewController;
        //取得选中的那一行
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        edit.delegate = self;
        edit.vcard = self.vcardArr[path.row];
    }
}

@end
