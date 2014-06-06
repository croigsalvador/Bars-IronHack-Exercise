//
//  Bar.h
//  Bares
//
//  Created by Carlos Roig Salvador on 06/06/14.
//  Copyright (c) 2014 Roxe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bar : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic,) NSString *address;
@property (nonatomic) NSUInteger rating;
@property (strong, nonatomic) NSString *descriptionText;
@property (nonatomic)float latitude;
@property (nonatomic)float longitude;
@property (strong, nonatomic) NSString *photo;


#pragma mark - Initializer
- (id)init;
- (id)initWithName:(NSString *)name;

- (id)initWithName:(NSString *)name andAddress:(NSString *)address;
- (id)initWithName:(NSString *)name andAddress:(NSString *)address longitude:(float)longitude latitude:(float)latitude;

@end
