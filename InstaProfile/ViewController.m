//
//  ViewController.m
//  InstaProfile
//
//  Created by Amir Farsad on 5/22/16.
//  Copyright © 2016 Emersad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)getProfilePic:(NSString *)username {
    NSString *urlFetcher = [NSString stringWithFormat:@"http://instagram.com/%@",username];
    NSURL *urlToGo = [NSURL URLWithString:urlFetcher];
    NSString *urlProcessor = [NSString stringWithContentsOfURL:urlToGo encoding:NSUTF8StringEncoding error:nil];
    NSString* scanString = @"";
    if (urlProcessor.length > 0) {
        
        NSScanner* scanner = [[NSScanner alloc] initWithString:urlProcessor];
        
        @try {
            [scanner scanUpToString:@"\"profile_pic_url_hd\": \"" intoString:nil];
            scanner.scanLocation += [@"\"profile_pic_url_hd\": \"" length];
            [scanner scanUpToString:@"\", \"follows_viewer\":" intoString:&scanString];
        }
        @finally {
                    NSLog(scanString);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *finalStr = [scanString stringByReplacingOccurrencesOfString:@"s320x320/" withString:@""];
                _imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:finalStr]]];            });
        }
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button:(id)sender {
    if (_textField.text == @"") {
        return;
    }
    else {
        
        [self getProfilePic:_textField.text];
    }
}
- (IBAction)save:(id)sender {
    if (_imageView.image == nil) {
        return;
    }
    else {
        UIImageWriteToSavedPhotosAlbum(_imageView.image,nil,nil,nil);
    }
}
@end
