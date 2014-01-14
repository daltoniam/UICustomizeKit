# UICustomizeKit #

[![Build Status](https://travis-ci.org/daltoniam/UICustomizeKit.png)](https://travis-ci.org/daltoniam/UICustomizeKit)

The UICustomizeKit extends standard UIKit components to make amazing looking controls. I saw that there was a lot of good UI kits cropping up for iOS, but none of them had a full implementation of controls or where/are easy to customize outside of the theme's scope. The goal of UICustomizeKit is to allow you to customize all controls easily, to create a great style with minimal effort. A Flat and Bootstrap control kits are currently provided (and hopefully you will contribute and add more!). Those repos can be found here:

https://github.com/daltoniam/FlatUIKit

https://github.com/daltoniam/BootstrapUIKit

# Dependencies #

Requires CoreGraphics framework, quartz framework.

# Examples #

**Button Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    // silly button example, to show off every property in BaseButton.
    NSArray *colors = @[[UIColor colorWithWhite:0.9 alpha:1], [UIColor colorWithWhite:0.7 alpha:1]];
    CGRect rect = { .origin.x = 20.0, .origin.y = 70.0, .size.width = 44.0, .size.height = 24.0 };
    BaseButton *button = [[BaseButton alloc] initWithFrame:rect];
    button.colors = colors;
    CGFloat *colorLocs = (CGFloat*)malloc(sizeof(CGFloat) * 2);
    colorLocs[0] = 0.0f;
    colorLocs[1] = 1.0f;
    button.colorRange = colorLocs;
    button.selectedColors = colors;
    button.selectedRange = colorLocs;
    button.disabledColors = @[[UIColor lightGrayColor]];
    button.borderWidth = 1.0f;
    button.borderColor = [UIColor colorWithWhite:0.7 alpha:1];
    button.isBackButton = YES;
    button.corners = 5.0;

    // a more modern button.
    CGRect rect2 = { .origin.x = 20.0, .origin.y = 110.0, .size.width = 132.0, .size.height = 44.0 };
    BaseButton *modernButton = [[BaseButton alloc] initWithFrame:rect2];
    modernButton.colors = @[[UIColor colorWithRed:72.0f/255 green:153.0f/255 blue:251.0f/255 alpha:1]];
    modernButton.selectedColors = @[[UIColor blueColor]];
    modernButton.disabledColors = @[[UIColor lightGrayColor]];
    [modernButton setTitle:@"Hi There" forState:UIControlStateNormal];
    [modernButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    modernButton.rounding = 10.0f;
    modernButton.corners = UIRectCornerAllCorners;
    CGFloat *range = (CGFloat*)malloc(sizeof(CGFloat) * 2);
    colorLocs[0] = 0.0f;
    colorLocs[1] = 1.0f;
    modernButton.colorRange = range;


    [self.view addSubview:button];
    [self.view addSubview:modernButton];
}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/button.png)

**ProgressView Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    // progress view example.
    NSArray *colors = @[[UIColor colorWithRed:72.0f/255 green:153.0f/255 blue:251.0f/255 alpha:1]];
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0, .size.width = 182.0, .size.height = 44.0 };
    BaseProgressView *progressView = [[BaseProgressView alloc] initWithFrame:rect];
    progressView.colors = colors;
    CGFloat *colorLocs = (CGFloat*)malloc(sizeof(CGFloat) * 2);
    colorLocs[0] = 0.0f;
    colorLocs[1] = 1.0f;
    progressView.colorRange = colorLocs;
    progressView.trackColors = @[[UIColor lightGrayColor]];
    progressView.trackRange = colorLocs;
    progressView.borderWidth = 1;
    progressView.borderColor = [UIColor colorWithWhite:0.4 alpha:1];
    progressView.rounding = 8;
    progressView.corners = UIRectCornerAllCorners;
    [progressView setProgress:0.75 animated:YES];
    progressView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:progressView];

}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/progressView.png)

**Slider Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    //slider example
    NSArray *colors = @[[UIColor redColor]];
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0, .size.width = 182.0, .size.height = 44.0 };
    BaseSlider *slider = [[BaseSlider alloc] initWithFrame:rect];
    slider.colors = colors;
    CGFloat *colorLocs = (CGFloat*)malloc(sizeof(CGFloat) * 2);
    colorLocs[0] = 0.0f;
    colorLocs[1] = 1.0f;
    slider.colorRange = colorLocs;
    slider.trackColors = @[[UIColor lightGrayColor]];
    slider.trackRange = colorLocs;
    slider.thumbColors = @[[UIColor blackColor]];
    slider.thumbRange = colorLocs;
    slider.thumbSelectedColors = @[[UIColor yellowColor]];
    slider.thumbSelectedRange = colorLocs;

    [self.view addSubview:slider];

}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/sliderView.png)

**Switch Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    //switch example
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0};
    BaseSwitchView *sw = [[BaseSwitchView alloc] initWithFrame:rect];
    sw.onText = @"Yes";
    sw.offText = @"No";
    sw.backgroundColor = [UIColor lightGrayColor];
    sw.onBackgroundColor = [UIColor blackColor];
    sw.onColor = [UIColor blackColor];
    sw.offBackgroundColor = [UIColor redColor];
    sw.offColor = [UIColor redColor];
    [sw setOn:YES animated:NO];

}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/switch.png)

**TextField Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    //textfield example
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0, .size.width = 182.0, .size.height = 44.0 };
    BaseTextField *textField = [[BaseTextField alloc] initWithFrame:rect];
    textField.borderWidth = 1;
    textField.mainTextColor = [UIColor redColor];
    textField.borderColor = [UIColor colorWithWhite:0.8 alpha:1];
    textField.bodyColor = [UIColor colorWithWhite:0.9 alpha:1];

}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/textField.png)

**TextView Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    //textView example
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0, .size.width = 182.0, .size.height = 44.0 };
    BaseTextView *textView = [[BaseTextView alloc] initWithFrame:rect];
    textView.mainTextColor = [UIColor redColor];
    textView.borderWidth = 1;
    textView.borderColor = [UIColor colorWithWhite:0.9 alpha:1];

    [self.view addSubview:textView];
}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/textView.png)

**RadialProgressView Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    //radial progress view example
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0, .size.width = 40, .size.height = 40 };
    BaseRadialProgressView *view = [[BaseRadialProgressView alloc] initWithFrame:rect];
    view.borderColor = [UIColor greenColor];
    [view setProgress:0.8 animated:YES];

    [self.view addSubview:view];
}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/radialProgressView.png)

**ActivityView Example:**

```objc
- (void)viewDidLoad
{
    [super viewDidLoad];

    //ActivityView example
    CGRect rect = { .origin.x = 20.0, .origin.y = 80.0, .size.width = 40, .size.height = 40 };
    BaseActivityView *view = [[BaseActivityView alloc] initWithFrame:rect];
    [self.view addSubview:view];
    [view startAnimating];

    [self.view addSubview:view];
}
```

![alt tag](https://raw.github.com/daltoniam/UICustomizeKit/images/activityView.png)

# Requirements #

This framework requires at least iOS 5 above.

# License #

UICustomizeKit is license under the Apache License.

# Install #

The recommended approach for installing UICustomizeKit is via the CocoaPods package manager, as it provides flexible dependency management and dead simple installation.

via CocoaPods (not done yet, still need to get this add in)

Install CocoaPods if not already available:

	$ [sudo] gem install cocoapods
	$ pod setup
Change to the directory of your Xcode project, and Create and Edit your Podfile and add RestKit:

	$ cd /path/to/MyProject
	$ touch Podfile
	$ edit Podfile
	platform :ios, '5.0'
	pod 'UICustomizeKit'

Install into your project:

	$ pod install

Open your project in Xcode from the .xcworkspace file (not the usual project file)

# Contact #

### Dalton Cherry ###
* https://github.com/daltoniam
* http://twitter.com/daltoniam

### Current Controls: ###
+	ProgressView
+	RadialProgressView
+	Button
+	TabBar
+	BarButton
+	NavigationBar
+	TextField
+	TextView
+	SwitchView
+	SliderView
+	Loading/progress dialog (similar to UIActivityIndicatorView)

### TODOs: ###
+	add AlertView
+	add statusView (statusBar)
+	add FontAwesome (and add any other great/open source fonts!)
+	add a searchBar view
+	add an actionsheet
+   add stepper view
+   add segmented control
