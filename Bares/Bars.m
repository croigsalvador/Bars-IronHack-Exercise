//
//  Bars.m
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import "Bars.h"

@interface Bars ()

@property (strong, nonatomic) NSMutableArray *barList;

@end

@implementation Bars

- (id)initWithFile:(NSString *)fileName {
    self = [self init];
        NSString * fileNameAndPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:fileNameAndPath];
        
        for (NSDictionary *dict in array) {
//            NSLog(@"Dictionary: %@", dict);
//            Beer *beer = [[Beer alloc] init];
//            beer.name = dict[@"name"];
    
        }
    return self;
}

- (id)init {
    if (self = [super init]){
        _barList = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark - Public Methods

- (void)addBar:(Bar *)bar {
    [self.barList addObject:bar];
}

- (void)removeBeer:(Bar *)bar {
    [self.barList removeObject:bar];
}

- (NSArray *)allBars {
    return self.barList;
}



@end
