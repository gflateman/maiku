//
//  LoginViewController.m
//  MaikuApp
//
//  Created by Eli Bosworth on 9/8/13.
//  Copyright (c) 2013 Cynosaur Apps. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController {
    NSMutableData *responseFromPost;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"Did Receive Data");
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);
    if(!data.length) return;
    
    [responseFromPost appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"Did Receive Response");
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"Did Fail With Error");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"way to go");
    NSLog(@"%@", [[NSString alloc] initWithData:responseFromPost encoding:NSASCIIStringEncoding]);
}

- (IBAction)registerUser:(id)sender {
    NSLog(@"Username: %@, Password: %@", self.usernameField.text, self.passwordField.text);
    
    NSString *post = [[NSString alloc] initWithFormat:@"username=%@&password=%@", self.usernameField.text, self.passwordField.text];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    
    NSURL *url = [NSURL URLWithString:@"http://www.sammycanhelp.com/register"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPBody:postData];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        NSString *someCallbackDataMaybe = [NSMutableData data];
        NSLog(@"%@", someCallbackDataMaybe);
    }
    else
    {
        NSLog(@"Inside the else condition");
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}
@end