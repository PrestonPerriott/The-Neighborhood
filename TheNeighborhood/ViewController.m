//
//  ViewController.m
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import "ViewController.h"
#import "YoshikoTextField.h"
#import "Login.h"
@import Firebase;
#import "Firebase.h"


@interface ViewController ()
@property (strong, nonatomic) UIView *inputsContainerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    //_VCBackImage = [UIImage imageNamed:@"bg_main_menu@3x.png"];
    //_VCBackImage = [UIImage imageNamed:@"Central-Park.jpg"];
    //_VCBackImage = [UIImage imageNamed:@"CrackledCity.jpeg"];
    //_VCBackImage = [UIImage imageNamed:@"GrundgeCity.jpeg"];           //
    //_VCBackImage = [UIImage imageNamed:@"High_Res_Building.jpeg"];    //
    _VCBackImage = [UIImage imageNamed:@"image5.jpg"];
    //_VCBackImage = [UIImage imageNamed:@"image7.jpg"];                 //
    //VCBackImage = [UIImage imageNamed:@"image9.jpg"];
    //_VCBackImage = [UIImage imageNamed:@"bg_grass.jpg"];
    
    _VCBackView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _VCBackView.contentMode = UIViewContentModeScaleAspectFill;
    _VCBackView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    _VCBackView.layer.masksToBounds = TRUE;
     
    
    _VCBackView.image = _VCBackImage;
    [self.view addSubview:_VCBackView];
    self.view.backgroundColor = [UIColor clearColor];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.frame = self.view.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    blurEffectView.alpha =  .4;
    
    
    [self.view addSubview:blurEffectView];
    
    
    
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Menu_25.png"] style:UIBarButtonItemStyleDone target:self action:@selector(Left)];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_common_forward_wh@2x.png"] style:UIBarButtonItemStyleDone target:self action:@selector(Right)];
    //remove Right from the nav bar controller so that we only have left
    self.navigationItem.rightBarButtonItem =  rightItem;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor clearColor];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-60, self.navigationController.navigationBar.frame.size.height)];
    titleLabel.text = @"The Neighborhood";
    titleLabel.textColor = [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel setAdjustsFontSizeToFitWidth:YES];
    titleLabel.font = [UIFont fontWithName:@"AvenirNext-Italic" size:22];
    //self.navigationItem.titleView = titleLabel;
    
    
    //Items tint color
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:34.0/255.0 green:139.0/255.0 blue:34.0/255.0 alpha:.7];
    
    
   // self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1];
    
    
  //tint color cant be clear if we want to see the bar button items
    //self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    
    //Actual bar background
    
    
    
    
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                             forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
   
   /* [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    
    */
    _Ntf = [[UITextField alloc] initWithFrame:CGRectZero];
    
    
    
    _Ntf.textAlignment = NSTextAlignmentLeft;
    
    
    _Ntf.placeholder = @"Name";
    _Ntf.translatesAutoresizingMaskIntoConstraints = false;
    //Etf.layer.masksToBounds = YES;
    _Ntf.opaque = NO;
    _Ntf.textColor = [UIColor blackColor];
    _Ntf.alpha = 1.2;
    
    

    
    //Setting up a UIView to house the three textfields in the middle of the screen
    self.inputsContainerView = [[UIView alloc] init];
    self.inputsContainerView.backgroundColor = [UIColor whiteColor];
    //translatesAutoresizingMaskIntoConstraints must be set to false prior to setting the constraints
    self.inputsContainerView.translatesAutoresizingMaskIntoConstraints = false;
    self.inputsContainerView.layer.cornerRadius = 5;
    self.inputsContainerView.layer.masksToBounds = YES;
    self.inputsContainerView.alpha = .6;
    
    //Have to add the object to the specific view before we can add constraints to it
    [self.inputsContainerView addSubview:_Ntf];
    [self.view addSubview:self.inputsContainerView];

    
    
    
    //Using contraints to position the UIView on screen
    
    [self.inputsContainerView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = TRUE;
    [self.inputsContainerView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = TRUE;
    //Should set 12 pixels on each side of the UIView box
    [self.inputsContainerView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor constant:-24].active = TRUE;
    //Sets the height of the View
   // [self.inputsContainerView.heightAnchor constraintEqualToConstant:150].active = TRUE;
    
    //NSLayoutDimension to refrence the containir views height anchor
    _contraint = [self.inputsContainerView.heightAnchor constraintEqualToConstant:150];
    
    if (_contraint) {
        _contraint.active = TRUE;
    }
    else {
        _contraint.active = FALSE;
    }
    
    //[self.contraint accessibilityActivate];
    
    
  
    
    
    _SC = [[UISegmentedControl alloc] initWithItems:@[@"Login", @"Register"]];
    _SC.translatesAutoresizingMaskIntoConstraints = false;
    _SC.tintColor = [UIColor whiteColor];
    //Highlights an index of the Segemented Control
    _SC.selectedSegmentIndex = 1;
    [_SC addTarget:self action:@selector(HandledSegment) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_SC];
    
    [_SC.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = TRUE;
    [_SC.bottomAnchor constraintEqualToAnchor:_inputsContainerView.topAnchor constant:-12].active = TRUE;
    [_SC.widthAnchor constraintEqualToAnchor:_inputsContainerView.widthAnchor].active = TRUE;
    [_SC.heightAnchor constraintEqualToConstant:36].active = TRUE;
    
    
    
    
    
    //Anchors the textfield inside of the UIView
   
    
    [_Ntf.leftAnchor constraintEqualToAnchor:self.inputsContainerView.leftAnchor constant:12].active = TRUE;
    [_Ntf.topAnchor constraintEqualToAnchor:self.inputsContainerView.topAnchor].active = TRUE;
    [_Ntf.widthAnchor constraintEqualToAnchor:self.inputsContainerView.widthAnchor].active = TRUE;
    //Want to size the height of the text field so that it is one third of the whole UIView
    //We're going to add two more objects to the UIView
    //[Etf.heightAnchor constraintEqualToAnchor:self.inputsContainerView.heightAnchor multiplier: 1/3].active = TRUE;
    [_Ntf.heightAnchor constraintEqualToConstant:50].active = TRUE;
    
    //Need to create a relational value to the NTF height anchor
    
    _NameContraint  = [_Ntf.heightAnchor constraintEqualToConstant:50];
    _NameContraint.active = YES;
    
    if (_NameContraint) {
        _NameContraint.active = YES;
    }else{
        _NameContraint = false;
        
    }
    
    
    
    
    //UIButton achored to the bottom of the UIView
    _RegiButton = [[UIButton alloc]init];
    _RegiButton =[UIButton buttonWithType:UIButtonTypeSystem];
    _RegiButton.backgroundColor = [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1];
    [_RegiButton setTitle:@"Register" forState:UIControlStateNormal];
    _RegiButton.translatesAutoresizingMaskIntoConstraints = false;
    [_RegiButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _RegiButton.layer.cornerRadius = 5;
    _RegiButton.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    
    [self.view addSubview:_RegiButton];
    
    [_RegiButton addTarget:self action:@selector(RegisterPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_RegiButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = TRUE;
    //want to make the top anchor of the Register Button the bottom of the UIVIew
    [_RegiButton.topAnchor constraintEqualToAnchor:self.inputsContainerView.bottomAnchor constant:12].active =TRUE;
    //Want the Register Button to be the same width as the view essentially
    [_RegiButton.widthAnchor constraintEqualToAnchor:self.inputsContainerView.widthAnchor].active = TRUE;
    [_RegiButton.heightAnchor constraintEqualToConstant:50].active = TRUE;
    
    
    _Forgot = [[UIButton alloc] init];
    _Forgot = [UIButton buttonWithType:UIButtonTypeCustom];
    [_Forgot setTitle:@"Forgot your password or Login info? " forState:UIControlStateNormal];
    _Forgot.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    [_Forgot setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _Forgot.translatesAutoresizingMaskIntoConstraints = false;
    [_Forgot addTarget:self action:@selector(ForgotPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_Forgot];
    
    
    [_Forgot.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = TRUE;
    [_Forgot.topAnchor constraintEqualToAnchor:self.RegiButton.bottomAnchor constant:12].active = TRUE;
    [_Forgot.widthAnchor constraintEqualToAnchor:self.RegiButton.widthAnchor].active = TRUE;
    [_Forgot.heightAnchor constraintEqualToConstant:50].active = TRUE;
    
    
   //Going to create a seperator field to space oout the name, email and password feilds
    
    UIView *seperatorView = [[UIView alloc] init];
    seperatorView.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:2220.0/255.0 alpha:1];
    seperatorView.translatesAutoresizingMaskIntoConstraints = false;
    
    [_inputsContainerView addSubview:seperatorView];
    //Adding constaints o the seperator view after it has been added to the parent
    [seperatorView.leftAnchor constraintEqualToAnchor:self.inputsContainerView.leftAnchor].active = TRUE;
    [seperatorView.topAnchor constraintEqualToAnchor:_Ntf.bottomAnchor].active = TRUE;
    [seperatorView.widthAnchor constraintEqualToAnchor:self.inputsContainerView.widthAnchor].active = TRUE;
    [seperatorView.heightAnchor constraintEqualToConstant:1].active = TRUE;
    
    
    _Etf = [[UITextField alloc] initWithFrame:CGRectZero];
    _Etf.textAlignment = NSTextAlignmentLeft;
    _Etf.placeholder = @"Email";
    _Etf.translatesAutoresizingMaskIntoConstraints = false;
    //Etf.layer.masksToBounds = YES;
    _Etf.opaque = NO;
    _Etf.textColor = [UIColor blackColor];
    _Etf.alpha = 1.2;
    [_inputsContainerView addSubview:_Etf];
    
    [_Etf.leftAnchor constraintEqualToAnchor:self.inputsContainerView.leftAnchor constant:12].active = TRUE;
    [_Etf.topAnchor constraintEqualToAnchor:seperatorView.bottomAnchor].active = TRUE;
    [_Etf.widthAnchor constraintEqualToAnchor:self.inputsContainerView.widthAnchor].active = TRUE;
    [_Etf.heightAnchor constraintEqualToConstant:50].active = TRUE;

    
    UIView *seperatorView2 = [[UIView alloc] init];
    seperatorView2.backgroundColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:2220.0/255.0 alpha:1];
    seperatorView2.translatesAutoresizingMaskIntoConstraints = false;
    
    [_inputsContainerView addSubview:seperatorView2];
    //Adding constaints o the seperator view after it has been added to the parent
    [seperatorView2.leftAnchor constraintEqualToAnchor:self.inputsContainerView.leftAnchor].active = TRUE;
    [seperatorView2.topAnchor constraintEqualToAnchor:_Etf.bottomAnchor].active = TRUE;
    [seperatorView2.widthAnchor constraintEqualToAnchor:self.inputsContainerView.widthAnchor].active = TRUE;
    [seperatorView2.heightAnchor constraintEqualToConstant:1].active = TRUE;

    _Ptf = [[UITextField alloc] initWithFrame:CGRectZero];
    _Ptf.textAlignment = NSTextAlignmentLeft;
    _Ptf.placeholder = @"Password";
    _Ptf.translatesAutoresizingMaskIntoConstraints = false;
    //Etf.layer.masksToBounds = YES;
    _Ptf.opaque = NO;
    _Ptf.textColor = [UIColor blackColor];
    _Ptf.alpha = 1.2;
    [_Ptf setSecureTextEntry:YES];
    [_inputsContainerView addSubview:_Ptf];
    
    [_Ptf.leftAnchor constraintEqualToAnchor:self.inputsContainerView.leftAnchor constant:12].active = TRUE;
    [_Ptf.topAnchor constraintEqualToAnchor:seperatorView2.bottomAnchor].active = TRUE;
    [_Ptf.widthAnchor constraintEqualToAnchor:self.inputsContainerView.widthAnchor].active = TRUE;
    [_Ptf.heightAnchor constraintEqualToConstant:50].active = TRUE;

   
        _BouncyImageView = [[UIImageView alloc] init];
    _BouncyImageView.image = [UIImage imageNamed:@"Round Neighborhood Logo 2.png"];
    
    
    
    
    _BouncyImageView.translatesAutoresizingMaskIntoConstraints = false;
         [self.view addSubview:_BouncyImageView];
    
    
    
    
    
    [_BouncyImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = TRUE;
    [_BouncyImageView.bottomAnchor constraintEqualToAnchor:self.SC.topAnchor constant:-3].active = TRUE;
    
    
    
    _Bouncy2 = [UIImage imageNamed:@"Round Neighborhood Logo 2.png"];
    _BouncyView2 = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, _button.frame.origin.y + 70, 100, 100)];
    _BouncyImageView2 = [[UIImageView alloc] initWithImage:_Bouncy2];
    _BouncyImageView2.frame = _BouncyView2.bounds;
    
    [_BouncyView2 addSubview:_BouncyImageView2];
    [self.view addSubview:_BouncyView2];
    
    
    
    
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior* gravityBehavior =
    [[UIGravityBehavior alloc] initWithItems:@[self.BouncyView2]];
    [self.animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior =
    [[UICollisionBehavior alloc] initWithItems:@[self.BouncyView2]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior *elasticityBehavior =
    [[UIDynamicItemBehavior alloc] initWithItems:@[self.BouncyView2]];
    elasticityBehavior.elasticity = 0.7f;
    [self.animator addBehavior:elasticityBehavior];
    
    UIPushBehavior *pushBehavior =
    [[UIPushBehavior alloc] initWithItems:@[self.BouncyView2] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.pushDirection = CGVectorMake(50, 70);
    pushBehavior.magnitude = 1.789;
    [self.animator addBehavior:pushBehavior];
    
    
    
    




    //Need to figure out a better way to handle the email address: FIREBASE????
  /*  CGPoint size = self.view.center;
    _button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button.layer.masksToBounds =YES;
    _button.backgroundColor = [UIColor colorWithRed:34.0/255.0 green:139.0/255.0 blue:34.0/255.0 alpha:1.0];
    
    _button.layer.shadowColor = [UIColor colorWithRed:(100.0f/255.0f) green:0.0 blue:0.0 alpha:1.0].CGColor;
    _button.layer.shadowOffset = CGSizeMake(5, 5.0);
       _button.frame = CGRectMake(size.x - 365.0 ,size.y * 1.6850, 720, 60);
    _button.center = CGPointMake(_button.center.x, _button.center.y - 12 );
    _button.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    _button.font = [UIFont fontWithName:@"Arial-BoldMT" size:25];
    [_button setTitle:@"Login" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button.titleLabel.alpha = .5;
    _button.layer.shadowColor = [UIColor orangeColor].CGColor;
    _button.layer.shadowOpacity = 1.0;
    _button.layer.shadowRadius = 5;
    _button.layer.borderWidth = 1.0;
    _button.layer.cornerRadius = 2.0;
    //[self.view addSubview:_button];
    [_button addTarget:self action:@selector(didPushLogin) forControlEvents:UIControlEventTouchUpInside];
    _button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _button2.layer.masksToBounds =YES;
    _button2.backgroundColor = [UIColor colorWithRed:34.0/255.0 green:139.0/255.0 blue:34.0/255.0 alpha:1.0];
    //_button2.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:127.0/255.0 blue:80.0/255.0 alpha:1.0];
    _button2.layer.shadowColor = [UIColor colorWithRed:(100.0f/255.0f) green:0.0 blue:0.0 alpha:1.0].CGColor;
    
    _button2.layer.shadowOffset = CGSizeMake(5, 5.0);
    _button2.frame = CGRectMake(_button.frame.origin.x, _button.frame.origin.y + 59, 720, 60);
    _button2.font = [UIFont fontWithName:@"Arial-BoldMT" size:25];
    [_button2 setTitle:@"Sign Up" forState:UIControlStateNormal];
    [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _button2.titleLabel.alpha = .5;
    _button2.layer.shadowColor = [UIColor orangeColor].CGColor;
    _button2.layer.shadowOpacity = 1.0;
    _button2.layer.shadowRadius = 5;
    _button2.layer.borderWidth = 1.0;
    _button2.layer.cornerRadius = 2.0;
   // [self.view addSubview:_button2];
    [_button2 addTarget:self action:@selector(didPushSignUp) forControlEvents:UIControlEventTouchUpInside];
                            
    _button.alpha = .6;
    _button2.alpha = .6;
   */           
    
}
-(void)ForgotPressed{
    
    
    UIAlertController *ForgotAlert  = [UIAlertController alertControllerWithTitle:@"Did you forget your password?" message:@"Enter your email so we may resend you a new password" preferredStyle:UIAlertControllerStyleAlert];
    
    [ForgotAlert addTextFieldWithConfigurationHandler:^(UITextField *tf){
       tf.placeholder = @"Email";
    }];
    
    
    [self presentViewController:ForgotAlert animated:YES completion:^{
    }];
}
-(void)HandledSegment{
    //prints out which segmented control option was picked
    NSLog(@"%@", [_SC titleForSegmentAtIndex:_SC.selectedSegmentIndex]);
    
    //Now that we print the name on each click, we can easliy set the title of the button, each time either segmented control is cliked
    [_RegiButton setTitle:[_SC titleForSegmentAtIndex:_SC.selectedSegmentIndex] forState:UIControlStateNormal];
    
    //Changes the constant of the constraint variable dependant on which segmented controller is prressed
    _contraint.constant = _SC.selectedSegmentIndex == 0 ? 100 : 150;
    
    
    //Constrains the name feild so with every segmented toggle, the name field changes its height
    _NameContraint.constant = _SC.selectedSegmentIndex == 1 ? 50 : 0;
    
}

-(void)RegisterPressed{
    
    //If theres no valid email address, FIREBASE will immediately quit the app
    //Wanted to use an alert view to circumvent this issue, but it returns to FIREBASE prior
    if ([_Etf.text isEqualToString:@""] || [_Ptf.text isEqualToString:@""]){
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid Entry" message:@"Please Enter Valid Name, Email and Password Fields" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [self presentViewController:alert animated:YES completion:^{[self dismissViewControllerAnimated:YES completion:nil];}];
    
    }else if (( _Ptf.text.length < 6) && (_Ptf.text.length > 0)){
        
                            UIAlertController *lengthAlert  = [UIAlertController alertControllerWithTitle:@"Entry Length" message:@"The Password Feild is too short, entry must be at least 6 charachters" preferredStyle:UIAlertControllerStyleActionSheet];
        
                                    [self presentViewController:lengthAlert animated:YES completion:^{[self dismissViewControllerAnimated:YES completion:nil];}];
    }
    else if ((_Etf.text.length < 6) && _Etf.text.length > 0){
        
        
        UIAlertController *lengthAlert  = [UIAlertController alertControllerWithTitle:@"Entry Length" message:@"The Email Feild is too short, entry must be at least 6 charachters" preferredStyle:UIAlertControllerStyleActionSheet];
        
        [self presentViewController:lengthAlert animated:YES completion:^{[self dismissViewControllerAnimated:YES completion:nil];}];
    
                }else{
    
    [[FIRAuth auth] createUserWithEmail: _Etf.text password:_Ptf.text completion:^(FIRUser *user, NSError *error){
        
        if (error != nil){
            NSLog(@"%@",error);

            
        }
        
        
        
        //User authenticated successfully
        
        NSLog(@"New User Created");
        FIRDatabaseReference *ref = [[FIRDatabase database] referenceFromURL:@"https://the-neighborhood-49cbf.firebaseio.com/"];
        //Allows for the database to save the new user, under a user node, under their specific userid(uid) so that the db is sorted
        FIRDatabaseReference *users = [[ref child:@"users"] child:user.uid];
        
        
        
        
        NSDictionary *details = @{
                                  
                                  @"name" : _Ntf.text,
                                  @"email" : _Etf.text,
                                  @"password" : _Ptf.text
                                  };
        //Instead of updating ref directly, we ref users so that the info is added under the new users tab in the db
        [users updateChildValues:details withCompletionBlock:^(NSError *err, FIRDatabaseReference *ref){
        
            if (err != nil) {
                NSLog(@"%@", err);
            }
            
        }];
        
        
    }];
    
                }
    }


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resourc  es that can be recreated.
}
-(void)viewWillLayoutSubviews{
    CGRect bounds = self.view.bounds;
    self.VCBackView.frame = bounds;
}


-(void)Right{
    
//[self.sideMenuViewController presentRightMenuViewController];
    
    
    //This commented out Presents left menu
   // LeftMenu *LeftController = [[LeftMenu alloc] init];
   // [self.sideMenuViewController setContentViewController:LeftController  animated:YES];
}
-(void)Left{
    
    [self.sideMenuViewController presentLeftMenuViewController];
    
   
    
    
    //This commented out part hides the VC
    //[self.sideMenuViewController hideMenuViewController];
}
-(void)didPushLogin{
 
    //Instead of pushing to another VC we're gonna have the textfields slowly appear on screen
   /* Options *LoginVC = [[Options alloc] init];
    UINavigationController *navCont = [[UINavigationController alloc]initWithRootViewController:LoginVC];
    
    [self presentViewController:navCont animated:YES completion:^{NSLog(@"Login Controller Pushed");}]; */
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-CondensedBold"size:22.0];
    
    CGFloat leftPadding = 20;
    CGFloat rightPadding = 40;
    
    _LogintitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftPadding, 80, self.view.frame.size.width - rightPadding, font.pointSize)];
    
    [_LogintitleLabel setFont:font];
    [_LogintitleLabel setText:@"Login Information"];
    
    CGPoint size = self.view.center;
    
    _LoginEmail1 = [[Login alloc]init];
    _LoginPassword1 = [[Login alloc] init];
    _LoginEnter = [[UIButton alloc] init];
    
    [_LogintitleLabel setText:@"Login Information"];
    [_LoginEmail1 setPlaceholder:@"Email"];
    [_LoginPassword1 setPlaceholder:@"Password"];
    [_LoginEnter setTitle:@"Enter" forState:UIControlStateNormal];
    
    [_LoginEmail1 setRequired:YES];
    [_LoginPassword1 setRequired:YES];
    
    _LoginEmail1.frame = CGRectMake(0, 0, 225, 40);
    _LoginEmail1.center = CGPointMake(size.x, (size.y / 2.0 ));
    
    _LoginPassword1.frame = CGRectMake(_LoginEmail1.frame.origin.x, _LoginEmail1.frame.origin.y - _LoginEmail1.frame.size.height + 90, 255, 40);
    
    _LoginEnter.frame = CGRectMake(_LoginPassword1.frame.origin.x, _LoginPassword1.frame.origin.y - _LoginPassword1.frame.size.height + 90, 255, 40);
    [_LoginEnter setTitleColor:[UIColor colorWithRed:34.0/255.0 green:139/255.0 blue:24/255.0 alpha:.7] forState:UIControlStateNormal];
    _LoginEnter.layer.shadowRadius = 4.25;
    _LoginEnter.layer.cornerRadius = 3.4;
    _LoginEnter.layer.borderColor = [UIColor clearColor].CGColor;
    [_LoginEnter addTarget:self action:@selector(LoginEnterPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_LoginEmail1];
    [self.view addSubview:_LoginPassword1];
    [self.view addSubview:_LoginEnter];
    [self.view addSubview:_LogintitleLabel];
    
    _LoginEmail1.alpha = 0;
    _LoginPassword1.alpha = 0;
    _LoginEnter.alpha = 0;
    _LogintitleLabel.alpha = 0;
    
    [UIView animateWithDuration:1.5 delay:.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self EnterPressed];
        
        _LoginEmail1.alpha = 1;
        _LoginPassword1.alpha = 1;
        _LoginEnter.alpha = 1;
        _LogintitleLabel.alpha = 1;
        
    } completion:^(BOOL finished){
        NSLog(@"Items were eased");
    }];

    
}
-(void)didPushSignUp{
    
   /* UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(leftPadding, 80, self.view.frame.size.width - rightPadding, font.pointSize)];
    
    [titleLabel setFont:font];
    [titleLabel setText:@"Sign-Up Information"];
    
    [self.view addSubview:titleLabel];
    */
    CGPoint size = self.view.center;
    
    _firstNameTextField1 = [[Login alloc] initWithFrame:CGRectMake(0, 0, 225, 40)];
    _firstNameTextField1.center = CGPointMake(size.x, (size.y / 1.5));
    [_firstNameTextField1 setRequired:YES];
    [_firstNameTextField1 setPlaceholder:@"First Name"];
    
    [self.view addSubview:_firstNameTextField1];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_firstNameTextField1.frame.origin.x, _firstNameTextField1.frame.size.height - _firstNameTextField1.frame.origin.y - 20, 225, 40)];
     
    
     [_titleLabel setText:@"Sign-Up Information"];
     [self.view addSubview:_titleLabel];
    
     
    _lastNameTextField1 = [[Login alloc] initWithFrame:CGRectMake(_firstNameTextField1.frame.origin.x, _firstNameTextField1.frame.size.height + _firstNameTextField1.frame.origin.y + 10, 225, 40)];
    
    [_lastNameTextField1 setPlaceholder:@"Last Name"];
    [_lastNameTextField1 setRequired:YES];
    
    [self.view addSubview:_lastNameTextField1];
    
    _email1 = [[Login alloc] initWithFrame:CGRectMake(_lastNameTextField1.frame.origin.x, _lastNameTextField1.frame.size.height + _lastNameTextField1.frame.origin.y + 10, 225, 40)];
    [_email1 setRequired:YES];
    [_email1 setPlaceholder:@"Email"];
    //email.center = self.view.center;
    [self.view addSubview:_email1];
    
    _password1 = [[Login alloc] initWithFrame:CGRectMake(_email1.frame.origin.x, _email1.frame.origin.y + 50, 225, 40)];
    [_password1 setRequired:YES];
    [_password1 setPlaceholder:@"Password"];
    [self.view addSubview:_password1];
    
    
    _Enter = [[UIButton alloc] initWithFrame:CGRectMake(_password1.frame.origin.x, _password1.frame.origin.y + 50, 225, 50)];
    
    _Enter.layer.shadowRadius = 4.25;
    _Enter.layer.cornerRadius = 3.4;
    _Enter.layer.borderColor = [UIColor clearColor].CGColor;
    [_Enter setTitle:@"Enter" forState:UIControlStateNormal];
    [_Enter setTitleColor:[UIColor colorWithRed:34.0/255.0 green:139/255.0 blue:24/255.0 alpha:.7] forState:UIControlStateNormal];
    
    [self.view addSubview:_Enter];
    [_Enter addTarget:self action:@selector(EnterPressed) forControlEvents:UIControlEventTouchUpInside];
    
    _firstNameTextField1.alpha = 0;
    _lastNameTextField1.alpha = 0;
    _email1.alpha = 0;
    _password1.alpha = 0;
    _Enter.alpha = 0;
    _titleLabel.alpha = 0;
    
    
    [UIView animateWithDuration:1.5 delay:.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        _firstNameTextField1.alpha = 1;
        _lastNameTextField1.alpha = 1;
        _email1.alpha = 1;
        _password1.alpha = 1;
        _Enter.alpha = 1;
        _titleLabel.alpha = 1;

        
    } completion:^(BOOL finished){
        NSLog(@"Items were eased");
    }];
}
- (void)EnterPressed{
    //Need to make those gloabl for this to really work out
    if ([_firstNameTextField1.text  isEqual: @""] || [_lastNameTextField1.text isEqualToString:@""] || [_email1.text isEqualToString:@""] || [_password1.text isEqualToString:@""]) {
        NSLog(@"Need to enter valid entries");
    }
    
    if (_LoginEmail1.alpha == 1 || _LoginPassword1.alpha == 1 || _LoginEnter.alpha == 1){
        [UIView animateWithDuration:1.5 delay:.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            
            _LoginEmail1.alpha = 0;
            _LoginPassword1.alpha = 0;
            _LoginEnter .alpha = 0;
            _LogintitleLabel.alpha = 0;
            
            
        }completion:^(BOOL finished){
            NSLog(@"Login Items Eased Out");
        }];

        
    }
    
    [UIView animateWithDuration:1.5 delay:.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _firstNameTextField1.alpha = 0;
    _lastNameTextField1.alpha = 0;
    _email1.alpha = 0;
    _Enter.alpha = 0;
        _password1.alpha = 0;
    
    }completion:^(BOOL finished){
        NSLog(@" Sign Up Items Eased Out");
    }];
    //Going to you an ease in/ease out trasnsition but for now we have this sloppiness
    
}
- (void)LoginEnterPressed{
    if (_firstNameTextField1.alpha == 1 || _lastNameTextField1.alpha == 1 || _email1.alpha == 1 || _Enter.alpha == 1 || _password1.alpha == 1){
        
        _firstNameTextField1.alpha = 0;
        _lastNameTextField1.alpha = 0;
        _email1.alpha = 0;
        _Enter.alpha = 0;
        _password1.alpha = 0;
    }
    else {
        [UIView animateWithDuration:1.5 delay:.2 options:UIViewAnimationOptionCurveEaseOut animations:^{

        _LoginEmail1.alpha = 0;
        _LoginPassword1.alpha = 0;
        _LoginEnter.alpha = 0;
        _LogintitleLabel.alpha = 0;
            
        }completion:^(BOOL finished){
            NSLog(@"Login Items Eased Out");
        }];

    }
}

@end
