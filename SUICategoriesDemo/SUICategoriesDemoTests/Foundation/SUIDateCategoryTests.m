//
//  SUIDateCategoryTests.m
//  SUICategoriesDemo
//
//  Created by zzZ on 15/12/10.
//  Copyright © 2015年 suio~. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+SUIAdditions.h"

static const NSTimeInterval kTimeInterval = 1449736544;

@interface SUIDateCategoryTests : XCTestCase

@property (readonly,copy) NSDate *sutDate;

@end

@implementation SUIDateCategoryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


#pragma mark - Component

- (void)testYear
{
    XCTAssertEqual(self.sutDate.sui_year, 2015);
}
- (void)testMonth
{
    XCTAssertEqual(self.sutDate.sui_month, 12);
}
- (void)testDay
{
    XCTAssertEqual(self.sutDate.sui_day, 10);
}
- (void)testHour
{
    XCTAssertEqual(self.sutDate.sui_hour, 16);
}
- (void)testMinute
{
    XCTAssertEqual(self.sutDate.sui_minute, 35);
}
- (void)testSecond
{
    XCTAssertEqual(self.sutDate.sui_second, 44);
}
- (void)testAge
{
    XCTAssertEqual(self.sutDate.sui_age, 1);
}


#pragma mark - Formatter

- (void)testDateFromISO8601String
{
    XCTAssertTrue([[NSDate sui_dateFromISO8601String:@"2015-12-10T08:35:44Z"] isEqualToDate:self.sutDate]);
}
- (void)testISO8601String
{
    XCTAssertEqualObjects([self.sutDate sui_ISO8601String], @"2015-12-10T08:35:44Z");
}

- (void)testStringFormat
{
    XCTAssertEqualObjects([self.sutDate sui_stringFormat:@"yyyy MM dd-HH:mm:ss"], @"2015 12 10-16:35:44");
}


#pragma mark - Lazily instantiate

- (NSDate *)sutDate
{
    return [NSDate dateWithTimeIntervalSince1970:kTimeInterval];
}


@end
