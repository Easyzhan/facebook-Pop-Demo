//
//  CustomModalViewController.m
//  FaceBookPopAnimation
//
//  Created by Zin_戦 on 16/3/20.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "CustomModalViewController.h"

@interface CustomModalViewController ()
- (IBAction)didClickOnClose:(id)sender;

@end

@implementation CustomModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.layer.cornerRadius = 8.f;
}


- (IBAction)didClickOnClose:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
