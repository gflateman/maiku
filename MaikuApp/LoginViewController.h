//
//  LoginViewController.h
//  MaikuApp
//
//  Created by Eli Bosworth on 9/8/13.
//  Copyright (c) 2013 Cynosaur Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate, NSURLConnectionDelegate>

- (IBAction)registerUser:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end
