//
//  ActivityIndicatorViewController.m
//  ActivityIndicatorView
//
//  Created by Liu Chuan on 2016/12/20.
//  Copyright © 2016年 LC. All rights reserved.
//

#import "ActivityIndicatorViewController.h"



@interface ActivityIndicatorViewController ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *grayStyleActivityIndicatorView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *tintedActivityIndicatorView;

@property (weak, nonatomic) UIColor *applicationPurpleColor;


@end

@implementation ActivityIndicatorViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _applicationPurpleColor = [UIColor colorWithRed:0.659 green:0.271 blue:0.988 alpha:1];
    
    [self Setup_GrayStyleActivityIndicatorView];
    [self Setup_TintedActivityIndicatorView];
    

}

- (void)Setup_GrayStyleActivityIndicatorView {
    
    _grayStyleActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [_grayStyleActivityIndicatorView startAnimating];
    
    //当停止动画的时候，是否隐藏。默认为YES
    _grayStyleActivityIndicatorView.hidesWhenStopped = YES;

}

- (void)Setup_TintedActivityIndicatorView {
    
    _tintedActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    _tintedActivityIndicatorView.color = _applicationPurpleColor;
    
    [_tintedActivityIndicatorView startAnimating];
    
    
}

@end
