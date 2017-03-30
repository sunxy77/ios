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

- (void)addVcard:(ContactAddController *)addController vcard:(Vcard *)vcard {
 
    NSLog(@"add....");
    
    //1.添加数据模型
    [self.vcardArr addObject:vcard];
    
    //2.刷新表视图
    [self.tableView reloadData];
    
}

- (void)editVcard:(ContactEditController *)editController vcard:(Vcard *)vcard {
    NSLog(@"edit....");

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

 -(void)printName:(id)sender{
     NSString *name = [[sender userInfo] objectForKey:@"name"];
     
     NSLog(@"name: %@",name);
}

-(void)textchange {
   
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
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    static NSString *strIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    
        if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:strIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    Vcard *vcard = self.vcardArr[indexPath.row];
    
    cell.textLabel.text = vcard.name;
    
    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // NSLog(@"你点击了%ld节%ld行",indexPath.section, indexPath.row);
    
    [self performSegueWithIdentifier:@"contact2edit" sender:nil];
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    id dest = segue.destinationViewController;
    if ([dest isKindOfClass:[ContactAddController class]]) {//如果是跳转到添加联系人控制器
        //设置代理
        ContactAddController *addController = dest;
        addController.delegate = self;
        
    }else if ([dest isKindOfClass:[ContactEditController class]]){
        ContactEditController *editController = dest;
        //取得选中的那一行
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        
        editController.vcard = self.vcardArr[path.row];
        editController.delegate = self;
    }
}


@end
