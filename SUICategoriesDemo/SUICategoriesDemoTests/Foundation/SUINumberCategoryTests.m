//
//  SUINumberCategoryTests.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/10.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSNumber+SUIAdditions.h"

@interface SUINumberCategoryTests : XCTestCase

@end

@implementation SUINumberCategoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Prehash

- (void)testToDate
{
    XCTAssertEqual(1449732687, [[@(1449732687) sui_toDate] timeIntervalSince1970]);
}


@end
