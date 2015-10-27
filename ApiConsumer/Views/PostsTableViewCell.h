//
//  PostsTableViewCell.h
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/27/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PostsTableViewCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *postTitle;
@property (nonatomic, weak) IBOutlet UILabel *postContent;
@end
