//
//  PostViewController.h
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/28/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "CommentTableViewCell.h"
#import "Comment.h"

// Pods
#import <AFNetworking/AFNetworking.h>

@interface PostViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) Post *post;

@end
