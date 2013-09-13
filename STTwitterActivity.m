//
//  STTwitterActivity.m
//  STActivitiesSample
//
//  Created by Ivan Parfenchuk on 12.09.13.
//  Copyright (c) 2013 Ivan Parfenchuk. All rights reserved.
//

#import "STTwitterActivity.h"
#import <Social/Social.h>
#import <Social/SLComposeViewController.h>

NSString *const UIActivityTypePostToTwitterCustom = @"UIActivityTypePostToTwitterCustom";

@interface STTwitterActivity ()
@property (strong, nonatomic) NSMutableArray * sharingImages;
@property (strong, nonatomic) NSMutableString * sharingText;
@end

@implementation STTwitterActivity

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
    return UIActivityTypePostToTwitterCustom;
}

- (NSString *)activityTitle
{
    return @"Twitter";
}

- (UIImage *)activityImage
{
    return [UIImage imageNamed:@"STActivity.bundle/twitter"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSInteger countOfImages = 0;
    for (UIActivityItemProvider * item in activityItems)
    {
        BOOL itemIsImage = NO;
        BOOL itemIsString = NO;
        if ([item isKindOfClass:[UIImage class]])
        {
            countOfImages += 1;
            itemIsImage = YES;
        }
        else if ([item isKindOfClass:[NSString class]])
        {
            itemIsString = YES;
        }

        if ((!itemIsString && !itemIsImage) || countOfImages > 1)
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
            [self.sharingText appendString:self.sharingText.length ? item : [NSString stringWithFormat:@"\n%@", item]];
        }
    }
}

- (UIViewController *)activityViewController
{
    SLComposeViewController * vc = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [vc setInitialText:self.sharingText];
    for (UIImage * image in self.sharingImages)
    {
        [vc addImage:image];
    }
    [vc setCompletionHandler:^(SLComposeViewControllerResult result){
        [self activityDidFinish:result == SLComposeViewControllerResultDone];
    }];
    return vc;
}


@end
