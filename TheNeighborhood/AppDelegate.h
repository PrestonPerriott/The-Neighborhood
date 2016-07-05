//
//  AppDelegate.h
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "RESideMenu.h"
#import "CNPPopupController.h"



@interface AppDelegate : UIResponder <UIApplicationDelegate, RESideMenuDelegate, CNPPopupControllerDelegate>



@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) CNPPopupController *Popup;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

