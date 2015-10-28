//
//  PostViewController.m
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/28/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@property (nonatomic, weak) IBOutlet UILabel *pTitle;
@property (nonatomic, weak) IBOutlet UILabel *pContent;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *pComments;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pTitle.text = self.post.title;
    self.pContent.text = self.post.content;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 20.0;
    
    [self loadComments];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadComments {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:[NSString stringWithFormat: @"http://jsonplaceholder.typicode.com/posts/%@/comments", self.post.code] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        NSError *error = nil;
        self.pComments = [MTLJSONAdapter modelsOfClass:Comment.class fromJSONArray:responseObject error:&error];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pComments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentTableViewCell *commentCell = [tableView dequeueReusableCellWithIdentifier:@"commentCell" forIndexPath:indexPath];
    
    Comment *comment = self.pComments[indexPath.row];
    
    NSLog(@"%@ - %@ - %@",comment.name, comment.email, comment.body);
    
    // Configure the cell...
    commentCell.name.text = [self formatName:comment.name];
    commentCell.email.text = comment.email;
    commentCell.body.text = comment.body;
    commentCell.code = comment.code;
    
    return commentCell;
}

- (NSString *)formatName:(NSString *)name {
    if (name.length <= 42) {
        return name;
    } else {
        NSString * newName = [name substringToIndex: MIN(42, [name length])];
        return [newName stringByAppendingString:@"..."];
    }
}

@end
