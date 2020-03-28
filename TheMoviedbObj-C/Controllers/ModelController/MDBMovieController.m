//
//  MDBMovieController.m
//  TheMoviedbObj-C
//
//  Created by Kelsey Sparkman on 3/28/20.
//  Copyright © 2020 Kelsey Sparkman. All rights reserved.
//

#import "MDBMovieController.h"
#import "MDBMovie.h"

static NSString * const baseURLString = @"https://api.themoviedb.org/3/";
static NSString * const movieEndpoint = @"search/movie";
static NSString * const apiValue = @"1fb9b3ffd6755fc20ac1dd9a17bb68a7";
static NSString * const apiSearchKey = @"api_key";
static NSString * const searchKey = @"query";
static NSString * const imageBaseURLString = @"https://image.tmdb.org/t/p/w500/";
static NSString * const imageQueryString = @"kqjL17yufvn9OVLyXYpvtyrFfak.jpg";

@implementation MDBMovieController

- (void)fetchMovie:(NSString *)searchTerm completion:(void (^)(NSArray<MDBMovie *> *))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    baseURL = [baseURL URLByAppendingPathComponent:movieEndpoint];
    
    NSURLQueryItem *apiQuery = [[NSURLQueryItem alloc] initWithName:apiSearchKey value:apiValue];
    NSURLQueryItem *searchQuery = [[NSURLQueryItem alloc] initWithName:searchKey value:searchTerm];
    
    NSURLComponents *urlComponents = [[NSURLComponents new] initWithURL:baseURL resolvingAgainstBaseURL:true];
    urlComponents.queryItems = @[apiQuery,searchQuery];
    
    NSURL *finalURL = [urlComponents URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!topLevelDictionary || ![topLevelDictionary isKindOfClass:[NSDictionary class]])
        {
        NSLog(@"Error fetching JSON Dictionary: %@", error);
        completion(nil);
        return;
    }
        NSDictionary *movieResults = topLevelDictionary[@"results"];
        NSMutableArray *arrayOfMovies = [NSMutableArray new];
      for (NSDictionary *movieDict in movieResults)
      {
          MDBMovie *movie = [[MDBMovie new] initWithDictionary:movieDict];
          [arrayOfMovies addObject:movie];
      }
      completion(arrayOfMovies);

        
    }] resume];
      
}
@end
