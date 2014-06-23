#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "JBGradientTextViews"
  s.version          = File.read('VERSION')
  s.summary          = "JBGradientTextViews adds the ability to add gradients to all your favorite UI text classes!"
  s.description      = <<-DESC
JBGradientTextViews
===================

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


                                             DESC
  s.homepage         = "https://github.com/carleek/JBGradientTextViews"
  s.license          = 'MIT'
  s.author           = { "carleek" => "joshbryson@quickworkapps.com" }
  s.source           = { :git => "https://github.com/carleek/JBGradientTextViews.git", :tag => s.version.to_s }

  s.platform     = :ios, '5.0'
  s.requires_arc = true

  s.source_files = 'Classes'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
end
