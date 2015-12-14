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

@end

@implementation SUIViewControllerSecondVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.sui_sourceSignal subscribeNext:^(id x) {
        uObj(x);
    } completed:^{
        uFun
    }];
}


@end
