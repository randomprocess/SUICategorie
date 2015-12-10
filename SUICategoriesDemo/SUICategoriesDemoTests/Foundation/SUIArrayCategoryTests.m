//
//  SUIArrayCategoryTests.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/10.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+SUIAdditions.h"

@interface SUIArrayCategoryTests : XCTestCase

@property (readonly,copy) NSArray *sutArray1;
@property (readonly,copy) NSMutableArray *sutArray2;

@end

@implementation SUIArrayCategoryTests

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
    XCTAssertEqualObjects(self.sutArray1.sui_toString, @"[\n  \"value1\",\n  \"value2\",\n  \"value3\",\n  \"value4\",\n  \"value5\",\n  \"value6\"\n]");
}


#pragma mark - Random

- (void)testRandomObject
{
    XCTAssertNotNil([self.sutArray1 sui_randomObject]);
}

- (void)testShuffledArray
{
    XCTAssertEqual(self.sutArray1.count, [self.sutArray1 sui_shuffledArray].count);
}


#pragma mark - Lazily Reverse

- (void)testReverseObject
{
    XCTAssertEqual(self.sutArray1.count, [self.sutArray1 sui_reverseObject].count);
    [[self.sutArray1 sui_reverseObject] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        XCTAssertEqualObjects(obj, self.sutArray1[self.sutArray1.count-1-idx]);
    }];
}


#pragma mark - Lazily instantiate

- (NSArray *)sutArray1
{
    return @[@"value1", @"value2", @"value3", @"value4", @"value5", @"value6"];
}

- (NSMutableArray *)sutArray2
{
    NSMutableArray *curAry = [NSMutableArray arrayWithObjects:@"value6", @"value5", @"value4", @"value3", @"value2", @"value1", nil];
    return curAry;
}


@end
