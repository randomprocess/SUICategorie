//
//  SUIStringCategoryTests.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/9.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+SUIAdditions.h"

static NSString *const kSutString1 = @"https://github.com/randomprocess/SUICategories";
static NSString *const kSutString2 = @"  \n  \n\n A collection of \n  useful Objective-C\n  Categories +\n \n  \n";

@interface SUIStringCategoryTests : XCTestCase

@property (readonly,copy) NSString *sutString1;
@property (readonly,copy) NSString *sutString2;

@end

@implementation SUIStringCategoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Prehash

- (void)testToData
{
    XCTAssertEqualObjects(self.sutString1, [[NSString alloc] initWithData:self.sutString1.sui_toData encoding:NSUTF8StringEncoding]);
    XCTAssertEqualObjects(self.sutString2, [[NSString alloc] initWithData:self.sutString2.sui_toData encoding:NSUTF8StringEncoding]);
}
- (void)testToURL
{
    XCTAssertNotNil(self.sutString1.sui_toURL);
    XCTAssertNotNil(self.sutString2.sui_toURL);
    XCTAssertEqualObjects(self.sutString1, self.sutString1.sui_toURL.absoluteString);
    XCTAssertEqualObjects(self.sutString1, [self.sutString1.sui_toURL.absoluteString sui_URLDecoded]);
    XCTAssertEqualObjects(self.sutString2, [self.sutString2.sui_toURL.absoluteString sui_URLDecoded]);
}


#pragma mark - Manipulation

- (void)testStringFromObject
{
    XCTAssertEqualObjects(self.sutString1, [NSString sui_stringFromObject:self.sutString1]);
    XCTAssertEqualObjects(self.sutString2, [NSString sui_stringFromObject:self.sutString2]);

    XCTAssertEqualObjects(@"233", [NSString sui_stringFromObject:@(233)]);

    NSURL *curURL1 = self.sutString1.sui_toURL;
    NSURL *curURL2 = self.sutString2.sui_toURL;
    XCTAssertEqualObjects(self.sutString1, [NSString sui_stringFromObject:curURL1]);
    XCTAssertEqualObjects(self.sutString2, [[NSString sui_stringFromObject:curURL2] sui_URLDecoded]);
}

- (void)testAppendingObject
{
    XCTAssertEqualObjects([self.sutString1 sui_appendingObject:@" uoooooooooooo~"], @"https://github.com/randomprocess/SUICategories uoooooooooooo~");
    XCTAssertEqualObjects([self.sutString1 sui_appendingObject:@" 23333333333333"], @"https://github.com/randomprocess/SUICategories 23333333333333");
    
    NSURL *curURL1 = self.sutString1.sui_toURL;
    XCTAssertEqualObjects([self.sutString1 sui_appendingObject:curURL1], @"https://github.com/randomprocess/SUICategorieshttps://github.com/randomprocess/SUICategories");
}
- (void)testAppendingString
{
    XCTAssertEqualObjects([self.sutString1 sui_appendingString:@" uoooooooooooo~"], @"https://github.com/randomprocess/SUICategories uoooooooooooo~");
}
- (void)testAppendingFormat
{
    NSString *curStr = [self.sutString1 sui_appendingFormat:@" 2333%@", @"33333"];
    XCTAssertEqualObjects(curStr, @"https://github.com/randomprocess/SUICategories 233333333");
}

- (void)testContainsObject
{
    NSURL *curURL1 = self.sutString1.sui_toURL;
    XCTAssertTrue([self.sutString1 sui_containsObject:curURL1]);
    
    XCTAssertTrue([@"2333333" sui_containsObject:@(233)]);
    XCTAssertFalse([@"2333333" sui_containsObject:@(332)]);
}
- (void)testContainsString
{
    XCTAssertTrue([self.sutString1 sui_containsString:@"process"]);
    XCTAssertFalse([self.sutString1 sui_containsString:@"proceed"]);
}
- (void)testIsEmpty
{
    XCTAssertFalse([self.sutString1 sui_isEmpty]);
    
    XCTAssertFalse([@"  \n 1 \n" sui_isEmpty]);
    XCTAssertTrue([@"  \n  \n" sui_isEmpty]);
}

- (void)testRegex
{
    XCTAssertEqualObjects([self.sutString1 sui_regex:@"(?<=com/).*(?=/SUI)"], @"randomprocess");
}

- (void)testDelstrBlankInHeadTail
{
    XCTAssertEqualObjects([self.sutString2 sui_delstrBlankInHeadTail], @"\n  \n\n A collection of \n  useful Objective-C\n  Categories +\n \n  \n");
}
- (void)testDelstrBlankAndWrapInHeadTail
{
    XCTAssertEqualObjects([self.sutString2 sui_delstrBlankAndWrapInHeadTail], @"A collection of \n  useful Objective-C\n  Categories +");
}
- (void)testDelstrStringInHeadTail
{
    XCTAssertEqualObjects([self.sutString1 sui_delstrStringInHeadTail:@"/SUICategories"], @"https://github.com/randomprocess");
}
- (void)testDelstrWrapInHeadTail
{
    XCTAssertEqualObjects([self.sutString2 sui_delstrWrapInHeadTail], @"  \n  \n\n A collection of \n  useful Objective-C\n  Categories +\n \n  ");
}

- (void)testReplaceString
{
    XCTAssertEqualObjects([self.sutString1 sui_replaceString:@"SUICategories" withString:@"SUIToolKit"], @"https://github.com/randomprocess/SUIToolKit");
    XCTAssertEqualObjects([self.sutString1 sui_replaceString:@"SUICATEGORIES" withString:@"SUIToolKit" options:NSCaseInsensitiveSearch], @"https://github.com/randomprocess/SUIToolKit");
}
- (void)testeplaceRegex
{
    XCTAssertEqualObjects([self.sutString1 sui_replaceRegex:@"(?<=https://github.com/randomprocess/).*" withString:@"SUIToolKit"], @"https://github.com/randomprocess/SUIToolKit");
}


#pragma mark - Encoded

- (void)testURLEncoded
{
    XCTAssertEqualObjects([self.sutString1 sui_URLEncoded], @"https%3A%2F%2Fgithub.com%2Frandomprocess%2FSUICategories");
}
- (void)testURLDecoded
{
    XCTAssertEqualObjects(self.sutString1, [@"https%3A%2F%2Fgithub.com%2Frandomprocess%2FSUICategories" sui_URLDecoded]);
}

- (void)testBase64Encoded
{
    XCTAssertEqualObjects([self.sutString1 sui_base64Encoded], @"aHR0cHM6Ly9naXRodWIuY29tL3JhbmRvbXByb2Nlc3MvU1VJQ2F0ZWdvcmllcw==");
}
- (void)testBase64Decoded
{
    XCTAssertEqualObjects(self.sutString1, [@"aHR0cHM6Ly9naXRodWIuY29tL3JhbmRvbXByb2Nlc3MvU1VJQ2F0ZWdvcmllcw==" sui_base64Decoded]);
}

- (void)testMd5Digest
{
    XCTAssertEqualObjects([self.sutString1 sui_md5Digest], @"283b5f5f86443601f6742312f539a1c5");
}
- (void)testHMACDigest
{
    XCTAssertEqualObjects([self.sutString1 sui_HMACDigestWithKey:@"suikey" algorithm:kCCHmacAlgMD5], @"40ce05f2a9f3d127f150824a81e7cfc2");
}


#pragma mark - Lazily instantiate

- (NSString *)sutString1
{
    return kSutString1;
}

- (NSString *)sutString2
{
    return kSutString2;
}


@end
