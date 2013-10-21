# UICustomizeKit #

The UICustomizeKit extends standard UIKit components to make amazing looking controls. I saw that there was a lot of good UI kits cropping up for iOS, but none of them had a full implementation of controls or where/are easy to customize outside of the theme's scope. The goal of UICustomizeKit is to allow you to customize all controls easily, to create a great style with minimal effort. A Flat and Bootstrap control kits are currently provided (and hopefully you will contribute and add more!). Those repos can be found here:

https://github.com/daltoniam/FlatUIKit

https://github.com/daltoniam/BootstrapUIKit

# Dependancies #

Requires CoreGraphics framework, quartz framework. 

# Examples #

	Dalton you, need to add some! With some pictures too!
	
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
+	Button
+	TabBar
+	BarButton
+	NavigationBar
+	TextField
+	TextView
+	SwitchView
+	SliderView

### TODOs: ###
+	add AlertView
+	add statusView (statusBar)
+	port FontAwesome (and add any other great/open source fonts!)
+	add loading/progress dialog (more like UIActivityView)
+	add a searchBar view
+	maybe an actionsheet?
+	possible port/add DCDataViews? (not sure if that fits in this scope)
