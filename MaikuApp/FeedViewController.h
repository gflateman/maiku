//
//  ViewController.h
//  MaikuApp
//
//  Created by Gabriel Flateman on 8/18/13.
//  Copyright (c) 2013 Cynosaur Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController <UITextFieldDelegate>
- (IBAction)changeGreeting:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (copy, nonatomic) NSString *userName;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
