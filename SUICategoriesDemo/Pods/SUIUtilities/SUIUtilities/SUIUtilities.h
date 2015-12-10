//
//  SUIUtilities.h
//  SUIToolKitDemo
//
//  Created by zzZ on 15/11/25.
//  Copyright © 2015年 SUIO~. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SUIMacros.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    SUILaunchedTypeLatestVersion,
    SUILaunchedTypeFirstLaunched,
    SUILaunchedTypeUpdateVersion,
} SUILaunchedType;

typedef void (^SUIUtilitiesDelayTask)(BOOL cancel);


@interface SUIUtilities : NSObject


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Launched
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Launched

+ (SUILaunchedType)sui_launchedType;

+ (nullable NSString *)sui_previousVersion;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  File manager
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - File manager

+ (BOOL)sui_fileCreateDirectory:(NSString *)filePath;

+ (BOOL)sui_fileExist:(NSString *)filePath;

+ (BOOL)sui_fileWrite:(NSData *)data toPath:(NSString *)filePath;

+ (BOOL)sui_fileMove:(NSString *)sourcePath toPath:(NSString *)filePath;

+ (BOOL)sui_fileCopy:(NSString *)sourcePath toPath:(NSString *)filePath;

+ (NSData *)sui_fileRead:(NSString *)filePath;

+ (NSUInteger)sui_fileSize:(NSString *)filePath;

+ (BOOL)sui_fileDelete:(NSString *)filePath;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Unique identifier
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Unique identifier

+ (NSString *)sui_uuidString;

+ (NSString *)sui_idfvString;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Camera & PhotoLibrary
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Camera & PhotoLibrary

+ (BOOL)sui_cameraAvailable;

+ (BOOL)sui_cameraRearAvailable;

+ (BOOL)sui_cameraFrontAvailable;

+ (BOOL)sui_photoLibraryAvailable;


/*o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o*
 *  Others
 *o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~o~*/

#pragma mark - Others

+ (BOOL)sui_toAppStore:(NSString *)appId;

+ (SUIUtilitiesDelayTask)sui_delay:(NSTimeInterval)delay cb:(void (^)(void))completion;

+ (void)sui_cancelDelayTask:(SUIUtilitiesDelayTask)cTask;

@end

NS_ASSUME_NONNULL_END
