//
//  ViewController.m
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import "ViewController.h"
#import "YoshikoTextField.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    _VCBackImage = [UIImage imageNamed:@"NYC_Puddle.jpeg"];
    _VCBackView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _VCBackView.contentMode = UIViewContentModeScaleAspectFill;
    _VCBackView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _VCBackView.image = _VCBackImage;
    [self.view addSubview:_VCBackView];
    
    
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Left-7_120px.png"] style:UIBarButtonItemStyleDone target:self action:@selector(Left)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Right-7_120px.png"] style:UIBarButtonItemStyleDone target:self action:@selector(Right)];
    self.navigationItem.rightBarButtonItem =  rightItem;
    
    //This block allows for varying degrees of transparency
    
    [(UIView*)[self.navigationController.navigationBar.subviews objectAtIndex:3] setAlpha:.52222222f];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:80.0/255.0 alpha:.70];  //tint color cant be clear if we want to see the bar button items
    
  /*  [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    */
    
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.layer.masksToBounds =YES;
    _button.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:80.0/255.0 alpha:1.0];
    
    
    _button.layer.shadowColor = [UIColor colorWithRed:(100.0f/255.0f) green:0.0 blue:0.0 alpha:1.0].CGColor;
    
    _button.layer.shadowOffset = CGSizeMake(5, 5.0);
    
    
    _button.frame = CGRectMake(0, 100, 160, 40);
    _button.center = self.view.center;
    _button.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:14];
    [_button setTitle:@"Login" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    _button.layer.shadowColor = [UIColor orangeColor].CGColor;
    _button.layer.shadowOpacity = 1.0;
    _button.layer.shadowRadius = 5;
    
    _button.layer.borderWidth = 1.0;
    _button.layer.cornerRadius = 2.0;
    
    
    [self.view addSubview:_button];
    [_button addTarget:self action:@selector(LeftMenu) forControlEvents:UIControlEventTouchUpInside];
    
    
    _button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button2.layer.masksToBounds =YES;
    _button2.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:80.0/255.0 alpha:1.0];
    
    
    _button2.layer.shadowColor = [UIColor colorWithRed:(100.0f/255.0f) green:0.0 blue:0.0 alpha:1.0].CGColor;
    
    _button2.layer.shadowOffset = CGSizeMake(5, 5.0);
    
    
    _button2.frame = CGRectMake(_button.frame.origin.x, _button.frame.origin.y + 50, 160, 40);
    //_button2.center = self.view.center;
    _button2.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:14];
    [_button2 setTitle:@"Sign Up" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    
    _button2.layer.shadowColor = [UIColor orangeColor].CGColor;
    _button2.layer.shadowOpacity = 1.0;
    _button2.layer.shadowRadius = 5;
    
    _button2.layer.borderWidth = 1.0;
    _button2.layer.cornerRadius = 2.0;
    
    
    [self.view addSubview:_button2];
    [_button2 addTarget:self action:@selector(RightMenu) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect a = CGRectMake(_button2.frame.origin.x, _button2.frame.origin.y + 150, 150, 50);
    
   // YoshikoTextField *tf = [[YoshikoTextField alloc] initWithFrame:a];
   // [tf drawRect:CGRectMake(25, 50, 50, 50)];
    YoshikoTextField *tf = [[YoshikoTextField alloc] init];
    [tf drawRect:a];
    tf.placeholder = @"Email";
    tf.borderStyle = UITextBorderStyleRoundedRect;
        
    
    [self.view addSubview:tf];
    
    
    
                            
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resourc  es that can be recreated.
}
-(void)viewWillLayoutSubviews{
    CGRect bounds = self.view.bounds;
    self.VCBackView.frame = bounds;
}
-(void)LeftMenu{
    
    
    
}
-(void)RightMenu{
    
    
}
-(void)Right{
    
    [self.sideMenuViewController presentRightMenuViewController];
    
    
    //This commented out Presents left menu
   // LeftMenu *LeftController = [[LeftMenu alloc] init];
   // [self.sideMenuViewController setContentViewController:LeftController  animated:YES];
}
-(void)Left{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
    //This commented out part hides the VC
    //[self.sideMenuViewController hideMenuViewController];
}

@end
