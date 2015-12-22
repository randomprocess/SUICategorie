//
//  UIImage+SUIAdditions.h
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/22.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SUIAdditions)


- (UIImage * __null_unspecified)sui_imageWithTintColo:(UIColor *)tintColo; // kCGBlendModeDestinationIn
- (UIImage * __null_unspecified)sui_imageWithGradientTintColo:(UIColor *)tintColo; // kCGBlendModeOverlay
- (UIImage * __null_unspecified)sui_imageWithTintColo:(UIColor *)tintColo blendMode:(CGBlendMode)blendMode;


@end

NS_ASSUME_NONNULL_END
