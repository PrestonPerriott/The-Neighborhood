//
//  LeftMenu.h
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Buy.h"

@interface LeftMenu : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) BUYClient *client;
@end
