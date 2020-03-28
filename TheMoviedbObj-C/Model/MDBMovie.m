//
//  MDBMovie.m
//  TheMoviedbObj-C
//
//  Created by Kelsey Sparkman on 3/28/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "MDBMovie.h"

@implementation MDBMovie

- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview
{
    self = [super init];
    
    if (self) {
        
        _title = title;
        _rating = rating;
        _overview = overview;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    NSString *title = dictionary[@"title"];
    NSNumber *rating = dictionary[@"vote_average"];
    NSString *overview = dictionary[@"overview"];
    
    return [self initWithTitle:title rating:rating overview:overview];
}
@end
