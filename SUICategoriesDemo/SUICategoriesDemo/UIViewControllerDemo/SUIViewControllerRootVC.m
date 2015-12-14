//
//  SUIViewControllerRootVC.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/11.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import "SUIViewControllerRootVC.h"
#import "UIViewController+SUIAdditions.h"

@implementation SUIViewControllerRootVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    uObj(@"*** SUIViewControllerRootVC ***");
    
    
#pragma mark - Common
    
    uObj(self.sui_identifier);
    
    uObj(self.sui_tableView);
    
    uFun;
    
#pragma mark - Geometry

    uFloat(self.sui_opaqueNavBarHeight);
    
    uFloat(self.sui_translucentNavBarHeight);

    uFloat(self.sui_opaqueTabBarHeight);

    uFloat(self.sui_translucentTabBarHeight);

    uRect(self.sui_viewFrame);

    uFun;
    
#pragma mark - *** Alert & ActionSheet ***
    
    [self showAlertStyle];
}

- (void)showAlertStyle
{
    SUIAlertController *curAlertController = [self sui_showAlertWithTitle:@"aTitle"
                                                                  message:@"aMessage"
                                                                    style:SUIAlertStyleAlert];
    [curAlertController addAction:
     [SUIAlertAction actionWithTitle:@"取消" style:SUIAlertActionStyleCancel handler:nil]];
    
    uWeakSelf
    [curAlertController addAction:
     [SUIAlertAction actionWithTitle:@"确定" style:SUIAlertActionStyleDestructive handler:^(SUIAlertAction * _Nonnull cAction) {
        [weakSelf showActionSheetStyle];
    }]];
    
    [curAlertController show];
}

- (void)showActionSheetStyle
{
    uWeakSelf
    
    SUIAlertController *curAlertController = [self sui_showAlertWithTitle:@"bTitle"
                                                                  message:@"bMessage"
                                                                    style:SUIAlertStyleActionSheet];
    [curAlertController addAction:
     [SUIAlertAction actionWithTitle:@"取消" style:SUIAlertActionStyleCancel handler:^(SUIAlertAction * _Nonnull cAction) {
        uLog(@"Cancel");
    }]];
    
    [curAlertController addAction:
     [SUIAlertAction actionWithTitle:@"Action1" style:SUIAlertActionStyleDefault handler:^(SUIAlertAction * _Nonnull cAction) {
        uLog(@"Action1");
        [weakSelf modelPassed];
    }]];
    
    [curAlertController addAction:
     [SUIAlertAction actionWithTitle:@"Action2" style:SUIAlertActionStyleDestructive handler:^(SUIAlertAction * _Nonnull cAction) {
        uLog(@"Action2");
        [weakSelf modelPassed];
    }]];
    
    [curAlertController addAction:
     [SUIAlertAction actionWithTitle:@"Action3" style:SUIAlertActionStyleDefault handler:^(SUIAlertAction * _Nonnull cAction) {
        uLog(@"Action3");
        [weakSelf modelPassed];
    }]];
    
    [curAlertController show];
}


#pragma mark - ModelPassed

- (void)modelPassed
{
    [self sui_signalPassed:^RACSignal * _Nonnull(__kindof UIViewController * _Nonnull destVC) {
        
        if ([destVC.sui_identifier isEqualToString:@"ViewControllerSecond"])
        {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [subscriber sendNext:@"Action10"];
                [subscriber sendNext:@"Action11"];
                [subscriber sendCompleted];
                return nil;
            }];
        }
        return nil;
    }];
    
    [self performSegueWithIdentifier:@"ViewControllerSecond" sender:self];
}


@end
