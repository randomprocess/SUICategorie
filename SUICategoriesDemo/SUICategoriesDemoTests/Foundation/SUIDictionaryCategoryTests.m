//
//  SUIDictionaryCategoryTests.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/10.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDictionary+SUIAdditions.h"

@interface SUIDictionaryCategoryTests : XCTestCase

@property (readonly,copy) NSDictionary *sutDictionary1;
@property (readonly,copy) NSMutableDictionary *sutDictionary2;

@end

@implementation SUIDictionaryCategoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Prehash

- (void)testToString
{
    XCTAssertEqualObjects(self.sutDictionary1.sui_toString, @"{\n  \"key3\" : \"value3\",\n  \"key1\" : \"value1\",\n  \"key4\" : \"value4\",\n  \"key2\" : \"value2\",\n  \"key5\" : \"value5\"\n}");
}


#pragma mark - Accessing

- (void)testSafeObject
{
    XCTAssertEqualObjects([self.sutDictionary1 sui_safeObjectForKey:@"key3"], @"value3");
}

- (void)testSafeString
{
    XCTAssertEqualObjects([self.sutDictionary1 sui_safeStringForKey:@"key2"], @"value2");
}


#pragma mark - Lazily instantiate

- (NSDictionary *)sutDictionary1
{
    return @{@"key1" : @"value1",
             @"key2" : @"value2",
             @"key3" : @"value3",
             @"key4" : @"value4",
             @"key5" : @"value5"
             };
}

- (NSMutableDictionary *)sutDictionary2
{
    NSMutableDictionary *curDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", @"value3", @"key3", @"value4", @"key4", @"value5", @"key5", nil];
    return curDict;
}


@end
