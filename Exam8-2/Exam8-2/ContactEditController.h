//
//  ContactEditController.h
//  Exam8-2
//
//  Created by 孙晓晔 on 2017/3/30.
//  Copyright © 2017年 孙晓晔. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vcard.h"
@class ContactEditController;

@protocol ContactEditControllerDelegate <NSObject>

@optional
- (void)editVcard:(ContactEditController *)editController vcard:(Vcard *)vcard;

@end

@interface ContactEditController : UIViewController
@property(nonatomic, strong) Vcard *vcard;
@property (nonatomic, assign) id<ContactEditControllerDelegate> delegate;

@end

