STActivities
============

STActivities consist of UIActivity subclasses for replacing the standard Twitter and Facebook UIActivities. 
In iOS 7 and prior embedded Facebook and Twitter UIActivities don't show up in a list of activities if user is not logged into these accounts in iOS Settings.
By replacing the embedded activities with these these two, you can make the icons always show up in the list.

How to install
============
Either copy files from `STActivity` directory to your project directly or include the following line into your Podfile file:

``` ruby
pod 'STActivity', :git => 'https://github.com/uson1x/STActivities.git'
```

How to use
============

1. Include required headers
``` objective-c
#import "STFacebookActivity.h"
#import "STTwitterActivity.h"
```
2. Initialize `UIActivityViewController` using `@[[STFacebookActivity new], [STTwitterActivity new]]` as applicationActivities array
3. Set `excludedActivityTypes` to `@[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter]`
4. Present created UIActivityViewController as usual


``` objective-c
NSString * sharingText = @"Test text";
UIActivityViewController * activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[sharingText]
                                                                          applicationActivities:@[[STFacebookActivity new],
                                                                                                  [STTwitterActivity new]]];
activityVC.excludedActivityTypes = @[UIActivityTypePostToFacebook, UIActivityTypePostToTwitter];
[self presentViewController:activityVC animated:YES completion:nil];
```
