//
//  MDBMovie.h
//  TheMoviedbObj-C
//
//  Created by Kelsey Sparkman on 3/28/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MDBMovie : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly) NSString *overview;

- (instancetype)initWithTitle:(NSString *)title rating:(NSNumber *)rating overview:(NSString *)overview;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
