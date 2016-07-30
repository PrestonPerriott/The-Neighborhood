//
//  LeftMenu.m
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import "LeftMenu.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import "CNPPopupController.h"
#import "Options.h"
#import "Zones.h"
#import "CollectionListViewController.h"









@interface LeftMenu () <CNPPopupControllerDelegate>

@property (strong, readwrite, nonatomic) UITableView *tableView;
@property (nonatomic, strong) CNPPopupController *Popup;

@end

@implementation LeftMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // [self.sideMenuViewController presentRightMenuViewController]; self.tableView = ({
    self.tableView = ({
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * 1.5) / 2.0f, self.view.frame.size.width, 54 * 5) style:UITableViewStylePlain];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.opaque = NO;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = nil;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
    tableView;
});
[self.view addSubview:self.tableView];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
  //  Zones *thing = [[Zones alloc]init];
 //   UINavigationController *navCont = [[UINavigationController alloc]initWithRootViewController:thing];
    
    
    _client = [[BUYClient alloc] initWithShopDomain:@"ilovetheneighborhood.myshopify.com"
                                             apiKey:@"0806b7bca7596aa2e6e696ac4a23a67f"
                                          channelId:@"59355457"];

    Options *Products = [[Options alloc] initWithClient:_client];
    UINavigationController *ProductCont = [[UINavigationController alloc] initWithRootViewController:Products];
    
    CollectionListViewController *ListController = [[CollectionListViewController alloc] init];
    
    UINavigationController *ListNav = [[UINavigationController alloc] initWithRootViewController:ListController];
    
    
    switch (indexPath.row) {
            
        case 0:
            
            //ListController is failing when its being pushed, it might be the nav controller!!******
            if (ListController != 0) {
                NSLog(@"Logging before the push");
                [self presentViewController:ListNav animated:YES completion:^{NSLog(@"Collection List Pushed");}];
                NSLog(@"Logging after the push");
            }else{
                NSLog(@"error");
                
            }
            break;
        case 1:
            [self.sideMenuViewController presentHoneyMenuViewController];
            //[self.sideMenuViewController setContentViewController:navCont  animated:YES];
           // [self presentViewController:navCont animated:YES completion:^{NSLog(@"CollectionView");}];
            break;
        case 2:
            [self presentViewController:ProductCont animated:YES completion:^{NSLog(@"Product View Pushed");}];
            break;
        case 3:
            NSLog(@"Pop Up Initiated");
            [self didPop];
            break;
        case 4:
            NSLog(@"Logged Out");
#warning Handle log out
                   default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"AvenirNext-Italic" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSArray *titles = @[@"Main Products", @"Subscription Zones", @"Mobile Site", @"Change Zip", @"Log Out"];
    NSArray *images = @[@"IconHome@2x.png", @"IconCalendar@2x.png", @"IconProfile@2x.png", @"IconSettings@2x.png", @"IconEmpty"];
    cell.textLabel.text = titles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    
    //When we change the Neighborhood sign background to white, we should change the image colors to green
    //cell.imageView.tintColor = [UIColor colorWithRed:34.0/255.0 green:139.0/255.0 blue:34.0/255.0 alpha:.7];
    //cell.textLabel.textColor = [UIColor colorWithRed:34.0/255.0 green:139.0/255.0 blue:34.0/255.0 alpha:.7];
    //cell.textLabel.textAlignment = NSTextAlignmentLeft;
    
    return cell;
}
-(void)didPop{
    
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping   ;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"So now we need your Home Zip Code" attributes:@{NSFontAttributeName : [UIFont fontWithName: @"AvenirNext-Bold" size:24], NSForegroundColorAttributeName : [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1], NSParagraphStyleAttributeName : paragraphStyle}];
    
    NSAttributedString *lineOne = [[NSAttributedString alloc] initWithString:@"Let's start with your Work Zip-Code" attributes:@{NSFontAttributeName : [UIFont fontWithName: @"AvenirNext-Bold" size:18], NSForegroundColorAttributeName : [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1], NSParagraphStyleAttributeName : paragraphStyle}];
    
    NSAttributedString *lineTwo = [[NSAttributedString alloc] initWithString:@"Line Two" attributes:@{NSFontAttributeName : [UIFont fontWithName: @"AvenirNext-Bold" size:18],  NSForegroundColorAttributeName : [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1], NSParagraphStyleAttributeName : paragraphStyle}];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    titleLabel.attributedText = title;
    
    
    UILabel *lineOneLabel = [[UILabel alloc] init];
    lineOneLabel.numberOfLines = 0;
    lineOneLabel.attributedText = lineOne;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IconHome@2x.png"]];
    
    UILabel *lineTwoLabel = [[UILabel alloc]init];
    lineTwoLabel.numberOfLines = 0;
    lineTwoLabel.attributedText = lineTwo;
    
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 55)];
    customView.backgroundColor = [UIColor lightGrayColor];
    customView.layer.cornerRadius = 4;
    
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 230, 35)];
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = @"Home Zip-Code";
    [customView addSubview:tf];
    
    CNPPopupButton *button = [[CNPPopupButton alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitle:@"Close Me" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1];
    button.layer.cornerRadius = 5;
    button.selectionHandler = ^(CNPPopupButton *button){
        [self.Popup dismissPopupControllerAnimated:YES];
        NSLog(@"Block for button: %@", button.titleLabel.text);
    };
    
    
    self.Popup =[[CNPPopupController alloc] initWithContents:@[titleLabel, lineOneLabel, imageView, lineTwoLabel, customView, button]];
    self.Popup.theme = [CNPPopupTheme defaultTheme];
    self.Popup.delegate = self;
    [self.Popup presentPopupControllerAnimated:YES];
    

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
