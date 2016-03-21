//
//  ViewController.m
//  FaceBookPopAnimation
//
//  Created by Zin_戦 on 16/3/20.
//  Copyright © 2016年 Zin戦壕. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>


#import "CustomModalViewController.h"
#import "PresentingAnimationController.h"
#import "DismissingAnimationController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>
- (IBAction)popButtonWasClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *popButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor yellowColor]}];
    
}

- (IBAction)popButtonWasClick:(id)sender {
    
//    POPSpringAnimation *anim = [POPSpringAnimation animation];
//    [_popButton.layer pop_addAnimation:anim forKey:@"myKey"];
//    NSLog(@"0------");

//    POPSpringAnimation *shake = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
//    
//    shake.springBounciness = 20;
//    shake.velocity = @(3000);
//    
//    [self.popButton.layer pop_addAnimation:shake forKey:@"shakePassword"];

    POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    
    sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(8, 8)];
    sprintAnimation.springBounciness = 20.f;
    [self.popButton pop_addAnimation:sprintAnimation forKey:@"sendAnimation"];

    
//    POPSpringAnimation *spin = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
//    
//    spin.fromValue = @(M_PI / 4);
//    spin.toValue = @(0);
//    spin.springBounciness = 20;
//    spin.velocity = @(10);
//    [self.popButton.layer pop_addAnimation:spin forKey:@"likeAnimation"];
    
    CustomModalViewController *modalVC = [self.storyboard instantiateViewControllerWithIdentifier:@"customModal"];
    
    
    modalVC.transitioningDelegate = self;
    
    modalVC.modalPresentationStyle = UIModalPresentationCustom;
    
    [self.navigationController presentViewController:modalVC animated:YES completion:nil];
    
}


#pragma mark - UIViewControllerTransitionDelegate -

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentingAnimationController alloc] init];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissingAnimationController alloc] init];
}
@end
