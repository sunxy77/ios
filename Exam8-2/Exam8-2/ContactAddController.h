//
//  ContactAddController.h
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vcard.h"

@class ContactAddController;

@protocol ContactAddControllerDelegate <NSObject>

@optional
- (void)addVcard:(ContactAddController *)addController vcard:(Vcard *)vcard;

@end

@interface ContactAddController : UIViewController
@property(nonatomic, strong) Vcard *vcard;
@property (nonatomic, assign) id<ContactAddControllerDelegate> delegate;

@end

