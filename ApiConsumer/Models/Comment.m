//
//  Comment.m
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/28/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "Comment.h"

@implementation Comment

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"code": @"id",
             @"name": @"name",
             @"email": @"email",
             @"body": @"body"
             };
}

@end
