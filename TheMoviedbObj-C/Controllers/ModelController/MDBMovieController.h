//
//  MDBMovieController.h
//  TheMoviedbObj-C
//
//  Created by Kelsey Sparkman on 3/28/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class MDBMovie;

@interface MDBMovieController : NSObject

-(void)fetchMovie:(NSString *)searchTerm completion:(void (^)(NSArray<MDBMovie*> *))completion;

@end

NS_ASSUME_NONNULL_END
