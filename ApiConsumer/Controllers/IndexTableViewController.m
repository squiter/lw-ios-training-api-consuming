//
//  IndexTableViewController.m
//  ApiConsumer
//
//  Created by Treinamento Mobile on 10/27/15.
//  Copyright © 2015 Treinamento Mobile. All rights reserved.
//

#import "IndexTableViewController.h"

@interface IndexTableViewController ()

@property (nonatomic, strong) NSArray *posts;

@end

@implementation IndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // self.posts = @[@{@"title": @"Titulo Bacanudo", @"content": @"Conteudo fodão que ta aqui no role"}];
    
    // Auto height
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;
    
    [self loadPosts];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadPosts {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://jsonplaceholder.typicode.com/posts" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON: %@", responseObject);
        NSError *error = nil;
        self.posts = [MTLJSONAdapter modelsOfClass:Post.class fromJSONArray:responseObject error:&error];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning do you know what you doing here?
// YES I know! This is used to create section that will group the cells
//    return self.posts.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PostsTableViewCell *postCell = [tableView dequeueReusableCellWithIdentifier:@"postCell" forIndexPath:indexPath];
    
    Post *post = self.posts[indexPath.row];
    
    // Configure the cell...
    postCell.postTitle.text = post.title;
    postCell.postContent.text = post.content;
    
    return postCell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
