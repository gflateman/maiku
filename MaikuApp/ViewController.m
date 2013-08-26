//
//  ViewController.m
//  MaikuApp
//
//  Created by Gabriel Flateman on 8/18/13.
//  Copyright (c) 2013 Cynosaur Apps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userName = _userName;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeGreeting:(id)sender {
    self.userName = self.textField.text;
    
    NSString *nameString = self.userName;
    if ([nameString length] == 0) {
        nameString = @"World";
    }
    
    NSString *str=@"http://www.consignd.com/api/consignments?sale_id=1132&page=1";
    NSURL *url=[NSURL URLWithString:str];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSError *error=nil;
    NSDictionary *response=[NSJSONSerialization JSONObjectWithData:data options:
                 NSJSONReadingMutableContainers error:&error];
    
//    NSLog(@"Your JSON Object: %@ Or Error is: %@", response, error);
    UILabel *itemName;
    UIImage *img;
    UIImageView *imgView;
    CGFloat y = 0;
    int scrollWidth = [self.scrollView frame].size.width;
    for(NSDictionary *consignment in response[@"collection"]) {
//        NSLog(@"Item: %@", consignment[@"item"][@"name"]);
        
        // Add Label
        itemName = [[UILabel alloc] initWithFrame:CGRectMake(0, y, scrollWidth, 20)];
        itemName.text = consignment[@"item"][@"name"];
        [self.scrollView addSubview:itemName];
 
        // Add Image
        NSString *fetchUrl = [[NSString alloc] initWithFormat: @"http:%@", consignment[@"item"][@"photo"][@"medium_url"]];
        NSData *receivedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:fetchUrl]];

        NSLog(@"Fetching url: %@", fetchUrl);
        
        NSLog(@"Got data with size: %lu", (unsigned long)[receivedData length]);
        img = [[UIImage alloc] initWithData:receivedData];
        imgView = [[UIImageView alloc] initWithImage:img];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.frame = CGRectMake(0, y+20, scrollWidth, 200);
        
        [self.scrollView addSubview:imgView];

        y += 220;
        [self.scrollView setContentSize:CGSizeMake(scrollWidth, y)];
    }
    
    NSString *greeting = [[NSString alloc] initWithFormat:@"Hello, %@!", nameString];
    self.label.text = greeting;
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.textField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

@end
