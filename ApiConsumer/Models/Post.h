//
//  Post.h
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/27/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Post : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;

@end
