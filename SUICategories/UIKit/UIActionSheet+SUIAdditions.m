//
//  UIActionSheet+SUIAdditions.m
//  SUIToolKitDemo
//
//  Created by zzZ on 15/12/1.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import "UIActionSheet+SUIAdditions.h"
#import "SUIMacros.h"

@implementation UIActionSheet (SUIAdditions)


+ (RACSignal *)sui_signalForTitle:(NSString *)title
                      cancelTitle:(NSString *)cancelTitle
                      otherTitles:(NSArray *)otherTitles
                 destructiveIndex:(NSInteger)destructiveIndex
{
    UIActionSheet *curActionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                                delegate:nil
                                                       cancelButtonTitle:cancelTitle
                                                  destructiveButtonTitle:nil
                                                       otherButtonTitles:nil];
    if (otherTitles) {
        for (NSString *curOtherTitles in otherTitles) {
            [curActionSheet addButtonWithTitle:curOtherTitles];
        }
    }
    
    if (destructiveIndex > 0) {
        curActionSheet.destructiveButtonIndex = destructiveIndex;
    }
    
    [curActionSheet showInView:gWindow];
    return [curActionSheet rac_buttonClickedSignal];
}


@end
