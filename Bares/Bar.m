//
//  Bar.m
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import "Bar.h"

static NSString *kDefaultName                   = @"Tio Pepe";
static NSString *kDefaultAddress                = @"C/ Alameda";
static float kDefaultLongitude                  = 0.32929292;
static float kDefaultLatitude                   = 0.32929292;

@implementation Bar


#pragma mark - Initializer

- (id)init {
    return [self initWithName:kDefaultName  andAddress:kDefaultAddress longitude:kDefaultLongitude latitude:kDefaultLatitude];
}

- (id)initWithName:(NSString *)name{
    self = [self initWithName:name andAddress:kDefaultAddress longitude:kDefaultLongitude latitude:kDefaultLatitude];
    return self;
}

- (id)initWithName:(NSString *)name andAddress:(NSString *)address {
    return [self initWithName:name andAddress:address longitude:kDefaultLongitude latitude:kDefaultLatitude];
}

// DESIGNATED INITIALIZER
- (id)initWithName:(NSString *)name andAddress:(NSString *)address longitude:(float)longitude latitude:(float)latitude  {
    if (self = [super init]){
        _name = name;
        _address = address;
        _longitude = longitude;
        _latitude = latitude;
    }
    return self;
}

@end
