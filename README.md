STActivities
============

STActivities consist of UIActivity subclasses for Twitter and Facebook sharing, which send users to Setting if they are not logged into their accounts.
In iOS 7 and prior embedded Facebook and Twitter UIActivities don't show up in a list of activities if user is not logged in these account in iOS Settings.
By replacing the embedded activities with these these two, you will make the Facebook and Twitter icons always show up in the list.

How to use
============

1. Copy `STFacebookActivity.h`, `STFacebookActivity.m`, `STTwitterActivity.h`, `STTwitterActivity.m` and `facebook(@2x).png`/`twitter(@2x).png` images into your project
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
