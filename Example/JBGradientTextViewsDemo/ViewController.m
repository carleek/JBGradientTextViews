//
//  ViewController.m
//  JBGradientTextViewsDemo
//
//  Created by Joshua Bryson on 6/23/14.
//  Copyright (c) 2014 Quickwork Apps LLC. All rights reserved.
//

#import "ViewController.h"
#import "JBGradientLabel.h"
#import "JBGradientTextView.h"
#import "JBGradientTextField.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JBGradientLabel *label = [[JBGradientLabel alloc] initWithFrame:CGRectMake(20, 20, 280, 100)];
    label.gradientColors =  @[[UIColor blackColor], [UIColor redColor]];
    label.textColor = [UIColor whiteColor];
    [label setText:@"This is a gradient label!"];
    [self.view addSubview:label];
    
    JBGradientTextField *textField = [[JBGradientTextField alloc] initWithFrame:CGRectMake(20, 140, 280, 100)];
    textField.gradientColors =  @[[UIColor redColor],[UIColor whiteColor], [UIColor blueColor]];
    [textField setText:@"Boom! A gradient textField"];
    [self.view addSubview:textField];
    
    
    JBGradientTextView *textView = [[JBGradientTextView alloc] initWithFrame:CGRectMake(20, 260, 280, 100)];
    textView.gradientColors =  @[[UIColor blueColor],[UIColor redColor], [UIColor colorWithWhite:.1 alpha:.9]];
    textView.textColor = [UIColor whiteColor];
    [textView setGradientLocations: @[@0.0, @0.25, @1.0]];
    [textView setText:@"This is a sweet textView\nWith a ton of awesome text space too!"];
    [self.view addSubview:textView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
