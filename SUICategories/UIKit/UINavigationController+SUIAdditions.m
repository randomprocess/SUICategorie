//
//  UINavigationController+SUIAdditions.m
//  SUIToolKitDemo
//
//  Created by zzZ on 15/12/2.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import "UINavigationController+SUIAdditions.h"
#import "NSObject+SUIAdditions.h"
#import "SUIMacros.h"
#import "ReactiveCocoa.h"
#import "UIViewController+SUIAdditions.h"

@interface SUINavigationExten : NSObject <UINavigationControllerDelegate>

@end

@implementation SUINavigationExten


- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC
{
    uLog(@"%zd ~~ %@ ~~ %@", operation, fromVC, toVC);
    if (operation == UINavigationControllerOperationPush)
    {
        toVC.sui_sourceVC = fromVC;
    }
    
    return nil;
}


@end


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  UINavigationController
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

@implementation UINavigationController (SUIAdditions)


- (BOOL)sui_setup
{
    return YES;
}
- (void)setSui_setup:(BOOL)sui_setup
{
    if (sui_setup) {
        self.delegate = self.sui_navigationExten;
    }
}

- (SUINavigationExten *)sui_navigationExten
{
    SUINavigationExten *curNavigationExten = [self sui_getAssociatedObjectWithKey:@selector(sui_navigationExten)];
    if (curNavigationExten) return curNavigationExten;
    
    curNavigationExten = [SUINavigationExten new];
    self.sui_navigationExten = curNavigationExten;
    return curNavigationExten;
}
- (void)setSui_navigationExten:(SUINavigationExten *)sui_navigationExten
{
    [self sui_setAssociatedObject:sui_navigationExten key:@selector(sui_navigationExten) policy:OBJC_ASSOCIATION_RETAIN_NONATOMIC];
}


@end
