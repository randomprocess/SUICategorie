//
//  SUIViewControllerSecondVC.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/11.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import "SUIViewControllerSecondVC.h"
#import "UIViewController+SUIAdditions.h"

@interface SUIViewControllerSecondVC ()

@property (weak, nonatomic) IBOutlet UILabel *lbl1;
@property (weak, nonatomic) IBOutlet UILabel *lbl2;

@end

@implementation SUIViewControllerSecondVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RAC(self.lbl1, text) = [[self.sui_sourceSignal take:1] distinctUntilChanged];
    RAC(self.lbl2, text) = [[[self.sui_sourceSignal skip:1] take:1] distinctUntilChanged];

    [self.sui_sourceSignal subscribeCompleted:^{
        uFun;
    }];
}


@end
