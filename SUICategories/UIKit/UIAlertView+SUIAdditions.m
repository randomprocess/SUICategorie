//
//  UIAlertView+SUIAdditions.m
//  SUIToolKitDemo
//
//  Created by zzZ on 15/12/1.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import "UIAlertView+SUIAdditions.h"

@implementation UIAlertView (SUIAdditions)


+ (RACSignal *)sui_signalForTitle:(NSString *)title
                          message:(NSString *)message
                      cancelTitle:(NSString *)cancelTitle
                       otherTitle:(NSString *)otherTitle
{
    UIAlertView *curAlertView = [[UIAlertView alloc] initWithTitle:title
                                                           message:message
                                                          delegate:nil
                                                 cancelButtonTitle:cancelTitle
                                                 otherButtonTitles:otherTitle, nil];
    return [curAlertView rac_buttonClickedSignal];
}


@end
