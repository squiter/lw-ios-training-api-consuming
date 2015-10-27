//
//  Post.m
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/27/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "Post.h"

@implementation Post

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"code": @"id",
             @"title": @"title",
             @"content": @"body"
             };
}

@end
