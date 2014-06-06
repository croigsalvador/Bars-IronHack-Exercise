//
//  BarsTests.m
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Bars.h"
#import "Bar.h"

@interface BarsTests : XCTestCase

@end

@implementation BarsTests

- (void)testCanLoadFileBarFromFile {
    Bars *bl = [[Bars alloc] initWithFile:@"bar_list"];
    
    XCTAssertNotNil(bl, @"It is nil!!");
    
    XCTAssertTrue([bl allBeers] > 0, @"No hay cervezas");
    
    for ( Beer *beer in [bl allBeers]) {
        XCTAssertTrue([beer isKindOfClass:[Beer class]], @"IT'S NOT A BEER 🙀");
        XCTAssertNotNil(beer.name, @"NAME IS NILL");
    }
}

@end
