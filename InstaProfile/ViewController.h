//
//  ViewController.h
//  InstaProfile
//
//  Created by Amir Farsad on 5/22/16.
//  Copyright © 2016 Emersad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)button:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)save:(id)sender;


@end

