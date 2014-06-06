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
    Bars *b = [[Bars alloc] initWithFile:@"bar_list"];
    
    XCTAssertNotNil(b, @"It is nil!!");
    
    XCTAssertTrue([b allBars] > 0, @"No hay cervezas");
    
    for ( Bar *bar in [b allBars]) {
        XCTAssertTrue([bar isKindOfClass:[Bar class]], @"IT'S NOT A BEER 🙀");
        XCTAssertNotNil(bar.name, @"NAME IS NILL");
    }
}

- (void)testCanCreateABarList {
    Bars *barList = [[Bars alloc] init];
    XCTAssertNotNil(barList, @"Oh my GODD 🙀");
    XCTAssertEqual(0, [barList count], @"Expected count 2 found: %lu 😒",(unsigned long)  barList.count);
}

- (void)testCanAddBarToTheList {
    Bars *barList = [[Bars alloc] init];
    XCTAssertNotNil(barList, @"Oh my GODD 🙀");
    Bar *b = [[Bar alloc] init];
    [barList addBar:b];
    XCTAssertEqual(1, [barList count], @"Expected count 2 found: %lu 😒",(unsigned long)  barList.count);
    
}

- (void)testCanRemoveBarFromTheList {
    Bars *barList = [[Bars alloc] init];
    XCTAssertNotNil(barList, @"Oh my GODD 🙀");
    Bar *b = [[Bar alloc] init];
    [barList addBar:b];
    XCTAssertEqual(1, [barList count], @"Expected count 2 found: %lu 😒",(unsigned long)  barList.count);
    [barList removeBar:b];
    XCTAssertEqual(0, [barList count], @" Count =  %lu", (unsigned long)barList.count);
}

- (void)testCanGetAnArray {
    Bars *barList = [[Bars alloc] init];
    
    XCTAssert(barList, @"All Beers");
    
    for (int i = 0; i < 100 ; i++) {
        Bar *b = [[Bar alloc] initWithName: [NSString stringWithFormat:@"Bar%d",i]];
        [barList addBar:b];
       
    }
    
    NSArray *allBars = [barList allBars];
    for (int i = 0; i < 100 ; i++) {
        Bar *br = (Bar *) [allBars objectAtIndex:i];
        NSString *name = [NSString stringWithFormat:@"Bar%d",i];
        XCTAssertEqualObjects(br.name, name , @"Iguales");
    }
    
    XCTAssertEqual(barList.count, [allBars count], @" Count =  %lu", (unsigned long)allBars.count);
}

@end
