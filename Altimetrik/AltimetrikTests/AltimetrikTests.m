//
//  AltimetrikTests.m
//  AltimetrikTests
//
//  Created by Prachi Verma on 30/08/15.
//  Copyright (c) 2015 Prachi Verma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MasterViewController.h"


@interface AltimetrikTests : XCTestCase
@property (nonatomic, strong) MasterViewController *mvc;

@end

@implementation AltimetrikTests

- (void)setUp {
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.mvc = [storyboard instantiateViewControllerWithIdentifier:@"MasterViewController"];
    [self.mvc performSelectorOnMainThread:@selector(loadView) withObject:nil waitUntilDone:YES];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - View loading tests
-(void)testThatViewLoads
{
    XCTAssertNotNil(self.mvc.view, @"View not initiated properly");
}



-(void)testThatTableViewLoads
{
    XCTAssertNotNil(self.mvc, @"View not initiated");
}


- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
