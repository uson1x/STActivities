//
//  STFacebookActivity.m
//  STActivitiesSample
//
//  Created by Ivan Parfenchuk on 12.09.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import "STFacebookActivity.h"
#import <Social/Social.h>
#import <Social/SLComposeViewController.h>

NSString *const UIActivityTypePostToFacebookCustom = @"UIActivityTypePostToFacebookCustom";

@interface STFacebookActivity ()
@property (strong, nonatomic) NSMutableArray * sharingImages;
@property (strong, nonatomic) NSMutableString * sharingText;
@end

@implementation STFacebookActivity

- (id)init
{
    self = [super init];
    if (self) {
        self.sharingText = [[NSMutableString alloc] init];
        self.sharingImages = [[NSMutableArray alloc] init];
    }
    return self;
}

#if __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_6_1
+ (UIActivityCategory)activityCategory
{
    return UIActivityCategoryShare;
}
#endif

- (NSString *)activityType
{
    return UIActivityTypePostToFacebookCustom;
}

- (NSString *)activityTitle
{
    return @"Facebook";
}

- (UIImage *)activityImage
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        return [UIImage imageNamed:@"STActivity.bundle/facebook-ios8"];
    } else {
        return [UIImage imageNamed:@"STActivity.bundle/facebook"];
    }
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    for (UIActivityItemProvider * item in activityItems)
    {
        if (![item isKindOfClass:[NSString class]] && ![item isKindOfClass:[UIImage class]])
        {
            return NO;
        }
    }
    return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    for (id item in activityItems)
    {
        if ([item isKindOfClass:[UIImage class]])
        {
            [self.sharingImages addObject:item];
        }
        else if ([item isKindOfClass:[NSString class]])
        {
            [self.sharingText appendString:self.sharingText.length ? item : [NSString stringWithFormat:@"%@\n", item]];
        }
    }
}

- (UIViewController *)activityViewController
{
    SLComposeViewController * vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [vc setInitialText:self.sharingText];
    for (UIImage * image in self.sharingImages) {
        [vc addImage:image];
    }
    [vc setCompletionHandler:^(SLComposeViewControllerResult result){
        [self activityDidFinish:result == SLComposeViewControllerResultDone];
     }];
    return vc;
}

@end
