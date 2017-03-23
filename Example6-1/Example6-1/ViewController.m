//
//  ViewController.m
//  Example6-1
//
//  Created by 孙晓晔 on 2017/3/23.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"student.plist" ofType:nil];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
    
    for (NSDictionary *dict in arr) {
        Student *student = [Student studentWithDict:dict];
        
        NSLog(student.name, nil);
        NSLog(student.sex, nil);
        
        NSLog(@"%d", student.age);
        
        NSDictionary *dict1 = [student dictionaryWithValuesForKeys:@[@"name", @"sex"]];
                               
        int a = 2;
    }
}

-(void)bb {
    Student *friend = [[Student alloc] init];
    friend.name = @"周围";
    friend.sex = @"男";
    friend.age = 18;
    
    Student *student = [[Student alloc] init];
    student.name = @"周围";
    student.sex = @"男";
    student.age = 18;
    // student.friend  = friend;
    
    NSLog(@"name = %@, sex = %@, age = %d", student.name, student.sex, student.age);
    
    [student setValue:@"张三" forKey:@"name"];
    [student setValue:@"女" forKey:@"sex"];
    [student setValue:@"23" forKey:@"age"];
    
    [student setValue:friend forKey:@"friend"];
    
    [student setValue:@"李四" forKeyPath:@"friend.name"];
    
    // NSLog(@"name = %@, sex = %@, age = %@", [student valueForKey:@"name"], [student valueForKey:@"sex"], [student valueForKey:@"age"]);
    
    NSLog(@"%@", [student valueForKeyPath:@"friend.name"]);

}

-(void)aa {
    NSString *strPath = [[NSBundle mainBundle] pathForResource:@"student.plist" ofType:nil];
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:strPath];
    
    for (NSDictionary *dict in arr) {
        //        NSString *name = [dict objectForKey:@"name"];
        //        NSLog(name, nil);
        //
        //        NSString *sex = dict[@"sex"];
        //        NSLog(sex, nil);
        //
        //        NSNumber *age = dict[@"age"];
        //
        //        NSLog(@"%@", age);
        
        Student *student = [Student studentWithDict:dict];
        
        NSLog(student.name, nil);
        NSLog(student.sex, nil);
        NSLog(@"%d", student.age);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
