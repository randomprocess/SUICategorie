//
//  UIViewController+SUIAdditions.m
//  SUIToolKitDemo
//
//  Created by zzZ on 15/11/25.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import "UIViewController+SUIAdditions.h"
#import "NSObject+SUIAdditions.h"
#import "NSString+SUIAdditions.h"
#import "SUIMacros.h"
#import "UIView+SUIAdditions.h"

@implementation UIViewController (SUIAdditions)


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Common
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Common

- (NSString *)sui_identifier
{
    NSString *curIdentifier = [self sui_getAssociatedObjectWithKey:@selector(sui_identifier)];
    if (curIdentifier) return curIdentifier;
    
    NSString *curClassName = NSStringFromClass([self class]);
    curIdentifier = [curClassName sui_regex:@"(?<=^SUI)\\S+(?=VC$)"];
    uAssert(curIdentifier, @"className should prefix with 'SUI' and suffix with 'VC'");
    
    self.sui_identifier = curIdentifier;
    return curIdentifier;
}
- (void)setSui_identifier:(NSString *)sui_identifier
{
    [self sui_setAssociatedObject:sui_identifier key:@selector(sui_identifier) policy:OBJC_ASSOCIATION_COPY_NONATOMIC];
}

- (UITableView *)sui_tableView
{
    UITableView *curTableView = [self sui_getAssociatedObjectWithKey:@selector(sui_tableView)];
    if (curTableView) return curTableView;

    if ([self isKindOfClass:[UITableViewController class]]) {
        curTableView = (UITableView *)self.view;
    } else {
        curTableView = [self.view sui_firstSubviewOfClass:[UITableView class]];
    }
    
    if (curTableView) self.sui_tableView = curTableView;
    return curTableView;
}
- (void)setSui_tableView:(UITableView *)sui_tableView
{
    sui_tableView.sui_vc = self;
    [self sui_setAssociatedObject:sui_tableView key:@selector(sui_tableView) policy:OBJC_ASSOCIATION_ASSIGN];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Geometry
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Geometry

- (CGFloat)sui_opaqueNavBarHeight
{
    CGFloat curNavBarHeight = 0;
    UINavigationBar *curNavigationBar = self.navigationController.navigationBar;
    if (!curNavigationBar.translucent) {
        curNavBarHeight += curNavigationBar.bounds.size.height;
        if (![self prefersStatusBarHidden]) {
            curNavBarHeight += [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    }
    return curNavBarHeight;
}
- (CGFloat)sui_translucentNavBarHeight
{
    CGFloat curNavBarHeight = 0;
    UINavigationBar *curNavigationBar = self.navigationController.navigationBar;
    if (curNavigationBar.translucent) {
        curNavBarHeight += curNavigationBar.bounds.size.height;
        if (![self prefersStatusBarHidden]) {
            curNavBarHeight += [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    }
    return curNavBarHeight;
}

- (CGFloat)sui_opaqueTabBarHeight
{
    UITabBar *curTabBar = self.navigationController.tabBarController.tabBar;
    if (!curTabBar.translucent && ![self hidesBottomBarWhenPushed]) {
        return curTabBar.bounds.size.height;
    }
    return 0;
}
- (CGFloat)sui_translucentTabBarHeight
{
    UITabBar *curTabBar = self.navigationController.tabBarController.tabBar;
    if (curTabBar.translucent && ![self hidesBottomBarWhenPushed]) {
        return curTabBar.bounds.size.height;
    }
    return 0;
}

- (CGRect)sui_viewFrame
{
    return CGRectMake(0, 0, self.view.sui_width, kScreenHeight-self.sui_opaqueNavBarHeight-self.sui_opaqueTabBarHeight);
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  NavBack
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - NavBack

- (IBAction)sui_popToLastVC:(UIStoryboardSegue *)unwindSegue
{
    //
}

- (IBAction)sui_navPopToLast:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sui_navPopToRoot:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)sui_navDismiss:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
    }];
}


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  ModelPassed
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - ModelPassed

- (UIViewController *)sui_sourceVC
{
    return [self sui_getAssociatedObjectWithKey:@selector(sui_sourceVC)];
}
- (void)setSui_sourceVC:(UIViewController *)sui_sourceVC
{
    [self sui_setAssociatedObject:sui_sourceVC key:@selector(sui_sourceVC) policy:OBJC_ASSOCIATION_ASSIGN];
}

- (id)sui_sourceSignal
{
    RACSignal *curSrcSignal = [self sui_getAssociatedObjectWithKey:@selector(sui_sourceSignal)];
    if (curSrcSignal) return curSrcSignal;
    
    if (self.sui_sourceVC.sui_destSignalPassed) {
        curSrcSignal = self.sui_sourceVC.sui_destSignalPassed(self);
    }
    
    if (curSrcSignal) self.sui_sourceSignal = curSrcSignal;
    return curSrcSignal;
}
- (void)setSui_sourceSignal:(id)sui_sourceSignal
{
    [self sui_setAssociatedObject:sui_sourceSignal key:@selector(sui_sourceSignal) policy:OBJC_ASSOCIATION_ASSIGN];
}

- (RACSignal *(^)(__kindof UIViewController *destVC))sui_destSignalPassed
{
    return [self sui_getAssociatedObjectWithKey:@selector(sui_destSignalPassed)];
}
- (void)sui_signalPassed:(RACSignal *(^)(__kindof UIViewController *destVC))cb
{
    [self sui_setAssociatedObject:cb key:@selector(sui_destSignalPassed) policy:OBJC_ASSOCIATION_COPY_NONATOMIC];
}


@end


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  UITableView
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@implementation UITableView (SUIViewController)

- (UIViewController *)sui_vc
{
    return [self sui_getAssociatedObjectWithKey:@selector(sui_vc)];
}

- (void)setSui_vc:(UIViewController *)sui_vc
{
    [self sui_setAssociatedObject:sui_vc key:@selector(sui_vc) policy:OBJC_ASSOCIATION_ASSIGN];
}

@end
