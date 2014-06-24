# JBGradientTextViews

[![Version](https://img.shields.io/cocoapods/v/JBGradientTextViews.svg?style=flat)](http://cocoadocs.org/docsets/JBGradientTextViews)
[![License](https://img.shields.io/cocoapods/l/JBGradientTextViews.svg?style=flat)](http://cocoadocs.org/docsets/JBGradientTextViews)
[![Platform](https://img.shields.io/cocoapods/p/JBGradientTextViews.svg?style=flat)](http://cocoadocs.org/docsets/JBGradientTextViews)


JBGradient classes provide a useful way of adding gradients to UILabels UITextViews and UITextFields.  Usually you need to add a gradient to a UIView and then add one of these text display classes as a subview.  These gradient classes are subclasses to the standard UI classes mentioned above, so they can be used in the same way as your other labels (etc).

## Usage

To use the classes add the gradient files to your project and just designate your UILabel, UITextView, or UITextField as a subclass of the JBGradientLabel, JBGradientTextView, JBGradientLabel then set the CGGradientLayer properties for the subclass:

```objective-c
#import "JBGradientLabel.h"
...
- (void)viewDidLoad {
[super viewDidLoad];

JBGradientLabel *label = [[JBGradientLabel alloc] initWithFrame:CGRectMake(20, 20, 280, 100)];
label.gradientColors =  @[[UIColor blackColor], [UIColor redColor]];
label.textColor = [UIColor whiteColor];
[label setText:@"This is a gradient label!"];
[self.view addSubview:label];
}
```
Each  UILabel, UITextView, and UITextField each contain the following additional properties:

```objective-c
// For all Gradients
@property (nonatomic, assign) JBGradientType gradientType;

@property (nonatomic, strong) NSArray *gradientColors;
@property (nonatomic, strong) NSArray *gradientLocations;
@property (nonatomic, assign) CGGradientDrawingOptions options;

// For the Linear Gradients
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;

// For the Radial Gradients
@property (nonatomic, assign) CGPoint startCenter;
@property (nonatomic, assign) CGFloat startRadius;
@property (nonatomic, assign) CGPoint endCenter;
@property (nonatomic, assign) CGFloat endRadius;

```

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

JBGradientTextViews is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "JBGradientTextViews"

## Author

carleek, bryson.joshua@gmail.com

## License

JBGradientTextViews is available under the MIT license. See the LICENSE file for more info.

