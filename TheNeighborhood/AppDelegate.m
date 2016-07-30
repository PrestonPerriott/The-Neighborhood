//
//  AppDelegate.m
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import "AppDelegate.h"
#include "RESideMenu.h"
#include "UIViewController+RESideMenu.h"
#include "RECommonFunctions.h"
#include "LeftMenu.h"
#include "Options.h"
#include "ViewController.h"
#import "OnboardingViewController.h"
#import "OnboardingContentViewController.h"
#import "TileView.h"
#import "Zones.h"
#import "TheNeighborhood-swift.h"
#import "Buy.h"
@import Firebase;
// or #import "Firebase.h"


#define SHOP_DOMAIN @"ilovetheneighborhood.myshopify.com"
#define API_KEY @"0806b7bca7596aa2e6e696ac4a23a67f"
#define CHANNEL_ID @"59355457"
#define MERCHANT_ID @""

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [FIRApp configure];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
     self.window.backgroundColor = [UIColor whiteColor];
    
    // Initialize the Buy SDK
    _client = [[BUYClient alloc] initWithShopDomain:SHOP_DOMAIN
                                                       apiKey:API_KEY
                                                    channelId:CHANNEL_ID];
    // Setup the views
    Options *storeController = [[Options alloc] initWithClient:_client];
    storeController.merchantId = MERCHANT_ID;
    
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:storeController];
    navController.toolbarHidden = NO;
    navController.navigationBarHidden = NO;
    navController.navigationBar.barStyle = UIStatusBarStyleLightContent;

    
    
    
    
    //Before SideMenu takes control over the rootVC
    //We want to ititalize OnBoard,
    
    
    self.window.rootViewController = [self generateStandardOnboardingVC];
    //[self RootViewBackToMosaic];
    
    
 /*   ViewController *VC = [[ViewController alloc] init];
    UINavigationController *VCNav = [[UINavigationController alloc] initWithRootViewController:VC];
    self.window.rootViewController = VCNav;
    */
    
    
    //After OnBoard completes, we give control of the rootVC
    //back to the SideMenu, so that the app starts
    
    
    
    
    
    
    return YES;
}
- (OnboardingViewController *)generateStandardOnboardingVC{
    
    
    //A button optionmost likely isn't useful for the initial page as the user doesnt know what the zip code would be used for
    OnboardingContentViewController *firstPage = [OnboardingContentViewController contentWithTitle:nil body:@"Here at the Neighborhood our main focus is to help you, in the pursuit of an electrifying experience in your area" image:[UIImage imageNamed:@"Round Neighborhood Logo 2 copy.png"] buttonText:nil action:^{}];
    
    //Honestly, as we force a pop up after the 3rd controller, this one might be a tad superfluous
    //As is turns out, the extra pop up is a bit superfluous so..............
    OnboardingContentViewController *secondPage = [OnboardingContentViewController contentWithTitle:@"How It Works" body:@"You simply select a Neighborhood that you either live in, or work near; and we supply you, and your friends with amazing opportunities in that community!" image:[UIImage imageNamed:@"Round Neighborhood Logo 2 copy.png"] buttonText:nil action:^{}];
    
    secondPage.movesToNextViewController =YES;
    secondPage.viewDidAppearBlock = ^{
      
        //We dont wan the pop to happen after the 2nd onboard pushes to the next Controller
        //But rather after the third VC is dismissed
        //[self didPop];
    };
    //Only need pop up option on last and final page
    OnboardingContentViewController *thirdPage = [OnboardingContentViewController contentWithTitle:@"Lets begin , shall we?" body:@"We can't wait to get your adventure started!" image:[UIImage imageNamed:@"Round Neighborhood Logo 2 copy.png"] buttonText:@"Get Started" action:^{
        [self handleOnboardingCompletion];
        [self didPop];
    }];
    
    OnboardingViewController *onboardingVC = [OnboardingViewController onboardWithBackgroundImage:[UIImage imageNamed:@"street"] contents:@[firstPage, secondPage, thirdPage]];
    onboardingVC.shouldFadeTransitions = YES;
    onboardingVC.fadePageControlOnLastPage = YES;
    onboardingVC.fadeSkipButtonOnLastPage = YES;
    
    firstPage.bodyLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:18];
    secondPage.bodyLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:18];
    thirdPage.bodyLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:18];
    
    firstPage.titleLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:24];
    secondPage.titleLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:24];
    thirdPage.titleLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:24];
    
    firstPage.actionButton.font = [UIFont fontWithName:@"AvenirNext-UltraLightItalic" size:24];
    
    // If you want to allow skipping the onboarding process, enable skipping and set a block to be executed
    // when the user hits the skip button.
    onboardingVC.allowSkipping = YES;
    onboardingVC.skipHandler = ^{
        [self handleOnboardingCompletion];
    };
    
    return onboardingVC;
    
}
-(void)didPop{
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping   ;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:@"So we just need your Home Zip Code" attributes:@{NSFontAttributeName : [UIFont fontWithName: @"AvenirNext-UltraLightItalic" size:24], NSForegroundColorAttributeName : [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1], NSParagraphStyleAttributeName : paragraphStyle}];
    
    NSAttributedString *lineOne = [[NSAttributedString alloc] initWithString:@"Let's start with your Home Zip-Code" attributes:@{NSFontAttributeName : [UIFont fontWithName: @"AvenirNext-UltraLightItalic" size:18], NSForegroundColorAttributeName : [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1], NSParagraphStyleAttributeName : paragraphStyle}];
    
    NSAttributedString *lineTwo = [[NSAttributedString alloc] initWithString:@"Its that simple!" attributes:@{NSFontAttributeName : [UIFont fontWithName: @"AvenirNext-UltraLightItalic" size:18],  NSForegroundColorAttributeName : [UIColor colorWithRed:80.0/255.0 green:101.0/255.0 blue:161.0/255.0 alpha:1], NSParagraphStyleAttributeName : paragraphStyle}];
    
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
    button.layer.cornerRadius = 25;
    button.selectionHandler = ^(CNPPopupButton *button){
        [self.Popup dismissPopupControllerAnimated:YES];
        NSLog(@"Block for button: %@", button.titleLabel.text);
        [self DidSecondPop];
    };
    
    
    self.Popup =[[CNPPopupController alloc] initWithContents:@[titleLabel, lineOneLabel, imageView, lineTwoLabel, customView, button]];
    self.Popup.theme = [CNPPopupTheme defaultTheme];
    self.Popup.delegate = self;
    [self.Popup presentPopupControllerAnimated:YES];
    
}
//Need another popUp - function that handles the Work address of the user
-(void)DidSecondPop{
    
    
    
    
}
-(void)handleOnboardingCompletion{
    //Handles what happens at the end of the intro
    [self RootViewBackToSideMenu];
}
-(void)RootViewBackToMosaic{
    
    Zones *ZVC = [[Zones alloc] init];
    UINavigationController *navCont = [[UINavigationController alloc]initWithRootViewController:ZVC];
    self.window.rootViewController = navCont;
}
-(void)RootViewBackToSideMenu{
    ViewController *HomeVC = [[ViewController alloc] init];
    
    UINavigationController *NavCont = [[UINavigationController alloc] initWithRootViewController:HomeVC];
    
    
    LeftMenu *LeftController = [[LeftMenu alloc] init];
    
    TileView *TileViewController = [[TileView alloc] init];
    
    Zones *HoneyCombVC = [[Zones alloc]init];
    
    
    RESideMenu *sideMenuVC = [[RESideMenu alloc] initWithContentViewController:NavCont leftMenuViewController:LeftController rightMenuViewController:TileViewController honeyMenuViewController:HoneyCombVC];
    
    sideMenuVC.backgroundImage = [UIImage imageNamed:@"NeighborhoodBackground.png"];
    
    sideMenuVC.menuPreferredStatusBarStyle = 1;
    sideMenuVC.delegate = self;
    sideMenuVC.contentViewShadowColor = [UIColor blackColor];
    sideMenuVC.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuVC.contentViewShadowOpacity = .6;
    sideMenuVC.contentViewShadowRadius = 12;
    sideMenuVC.contentViewShadowEnabled = YES;
    
    
    self.window.rootViewController = sideMenuVC;
    
    [self.window makeKeyAndVisible];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "PerriottInc.TheNeighborhood" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TheNeighborhood" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TheNeighborhood.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
