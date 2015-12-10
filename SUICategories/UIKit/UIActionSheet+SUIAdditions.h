//
//  UIActionSheet+SUIAdditions.h
//  SUIToolKitDemo
//
//  Created by zzZ on 15/12/1.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReactiveCocoa.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIActionSheet (SUIAdditions)


+ (RACSignal *)sui_signalForTitle:(nullable NSString *)title
                      cancelTitle:(nullable NSString *)cancelTitle
                      otherTitles:(nullable NSArray *)otherTitles
                 destructiveIndex:(NSInteger)destructiveIndex; // -1 means none set.


@end

NS_ASSUME_NONNULL_END
