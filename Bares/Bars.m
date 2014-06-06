//
//  Bars.m
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import "Bars.h"
#import "Bar.h"

@interface Bars ()

@property (strong, nonatomic) NSMutableArray *barList;

@end

@implementation Bars

- (id)initWithFile:(NSString *)fileName {
    self = [self init];
    NSString * fileNameAndPath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:fileNameAndPath];
    
    for (NSDictionary *dict in array) {
        Bar *bar = [[Bar alloc] init];
        bar.name = dict[@"name"];
        bar.address = dict[@"address"];
        bar.descriptionText = dict[@"description"];
    
        bar.rating = [(NSNumber *)dict[@"rating"] integerValue];
        bar.longitude = [dict[@"longitude"] floatValue];
        bar.longitude = [dict[@"latitude"] floatValue];
        bar.photo = dict[@"photo"];
        [_barList addObject:bar];
        
    }
    return self;
}

- (id)init {
    if (self = [super init]){
        _barList = [[NSMutableArray alloc] init];
    }
    return self;
}

#pragma mark - Custom Getter

- (NSUInteger)count {
    return [self.barList count];
}

#pragma mark - Public Methods

- (void)addBar:(Bar *)bar {
    [self.barList addObject:bar];
}

- (void)removeBar:(Bar *)bar {
    [self.barList removeObject:bar];
}

- (NSArray *)allBars {
    return self.barList;
}



@end
