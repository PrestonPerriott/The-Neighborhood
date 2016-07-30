//
//  ViewController.h
//  TheNeighborhood
//
//  Created by Preston Perriott on 6/25/16.
//  Copyright © 2016 Preston Perriott. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "LeftMenu.h"
#import "Options.h"
#import "Login.h"








@interface ViewController : UIViewController
@property (strong, nonatomic) UIImageView *VCBackView;
@property (strong, nonatomic) UIImage *VCBackImage;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UITextField *EmailField;
@property (strong, nonatomic) UITextField *PasswordField;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *passwordLabel;

@property (strong, nonatomic) Login *firstNameTextField1;
@property (strong, nonatomic) Login *lastNameTextField1;
@property (strong, nonatomic) Login *email1;
@property (strong, nonatomic) Login *password1;
@property (strong, nonatomic) UIButton *Enter;
@property (strong, nonatomic) UILabel *titleLabel;
@property (assign, nonatomic) CGPoint *size;


@property (strong, nonatomic) Login *LoginEmail1;
@property (strong, nonatomic) Login *LoginPassword1;
@property (strong, nonatomic) UIButton *LoginEnter;
@property (strong, nonatomic) UILabel *LogintitleLabel;

@property (strong, nonatomic) UITextField *Etf;
@property (strong, nonatomic) UITextField *Ntf;
@property (strong, nonatomic) UITextField *Ptf;

@property (strong, nonatomic) UIButton *RegiButton;
@property (strong, nonatomic) UIButton *Forgot;

@property (strong, nonatomic) UIImage *Bouncy2;
@property (strong, nonatomic) UIView *BouncyView2;
@property (strong, nonatomic) UIImageView *BouncyImageView2;

@property (strong, nonatomic) UIImageView *BouncyImageView;




@property (strong, nonatomic) UISegmentedControl *SC;


@property (strong, nonatomic) NSLayoutConstraint *contraint;
@property (strong, nonatomic) NSLayoutConstraint *NameContraint;

@property (strong, nonatomic) UIDynamicAnimator *animator;


@end

