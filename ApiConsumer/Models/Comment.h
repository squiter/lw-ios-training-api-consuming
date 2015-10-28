//
//  Comment.h
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/28/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface Comment : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *body;

@end
