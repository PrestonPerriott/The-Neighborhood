//
//  Zones.m
//  TheNeighborhood
//
//  Created by Preston Perriott on 7/2/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import "Zones.h"
#import "RESideMenu.h"
#import "TheNeighborhood-swift.h"

#define kDoubleColumnProbability 40


@interface Zones ()

@end

@implementation Zones

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self ZoneImages];
    


    [self HoneyCombed];
    
    
    //Need to figure out a way to randomize the pictures
    //Also need to figure out a way to continuosly populate the array with the same images
   /* for (NSInteger x = 0; x > [_images count]; x++){
        NSInteger randInt = (random() % ([_images count] - x)) +x;
        [_images exchangeObjectAtIndex:x withObjectAtIndex:randInt];
        
    }
    
    */
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ZoneImages{
    _images = [[NSMutableArray alloc ] initWithObjects:[UIImage imageNamed:@"Williamsburg.png"],
               [UIImage imageNamed:@"Dumbo.png"],
               [UIImage imageNamed:@"Midtown_East.png"],
               [UIImage imageNamed:@"Midtown_West.png"],
               [UIImage imageNamed:@"Tribeca.png"],
               [UIImage imageNamed:@"Lower_West.png"],
               [UIImage imageNamed:@"Upper_West.png"],
               [UIImage imageNamed:@"Lower_East.png"],
               [UIImage imageNamed:@"Upper_East.png"],
               [UIImage imageNamed:@"Chelsea.png"],
               [UIImage imageNamed:@"NoHo.png"],
               [UIImage imageNamed:@"SoHo.png"],
               [UIImage imageNamed:@"Financial_District.png"], nil];
    
    
    _images2 = [[NSMutableArray alloc] init];
    

    [self shuffle:_images];
    
    
    
    
   for (NSInteger x  = 0; x < 4; x++){
        
       [_images2 addObjectsFromArray:_images];
       }
    
    
    [self shuffle:_images2];
    
}
//Func that takes an array and shuffles
- (void)shuffle:(NSMutableArray *) array
{
    NSUInteger count = [array count];
    if (count < 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [array exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}
- (void)HoneyCombed {
    
    
    HoneycombView *Hc = [[HoneycombView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    Hc.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    Hc.diameter = 250.0;
    Hc.margin = 0;
    [Hc configrationForHoneycombViewWithImages:_images2];
    
    Hc.backgroundColor = [UIColor clearColor];
    [self.view addSubview:Hc] ;
    [Hc animate:5.0];
    
    
    
    
    
    _backButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_common_back_wh@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(Back)];
    self.navigationItem.leftBarButtonItem = _backButton;
    
    
}
-(void)Back{
    [self dismissViewControllerAnimated:true completion:^{[self.sideMenuViewController presentLeftMenuViewController];}];
    
}

@end
