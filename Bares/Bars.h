//
//  Bars.h
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Bar;

@interface Bars : NSObject


#pragma mark - Initializers
- (id)initWithFile:(NSString *)fileName;

#pragma mark - Public Methods

- (void)addBar:(Bar *)bar;
- (void)removeBeer:(Bar *)bar;
- (NSArray *)allBars;

@end
