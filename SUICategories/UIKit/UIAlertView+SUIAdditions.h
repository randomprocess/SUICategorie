//
//  UIAlertView+SUIAdditions.h
//  SUIToolKitDemo
//
//  Created by zzZ on 15/12/1.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertView (SUIAdditions)


+ (RACSignal *)sui_signalForTitle:(nullable NSString *)title
                          message:(nullable NSString *)message
                      cancelTitle:(nullable NSString *)cancelTitle
                       otherTitle:(nullable NSString *)otherTitle;


@end

NS_ASSUME_NONNULL_END
