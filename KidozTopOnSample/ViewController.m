//
//  ViewController.m
//  KidozTopOnSample
//
//  Created by Lev Firer on 23/11/2020.
//  Copyright © 2020 Kidoz. All rights reserved.
//

#import "ViewController.h"

#import <AnyThinkSDK/AnyThinkSDK.h>
#import <AnyThinkInterstitial/AnyThinkInterstitial.h>
#import <AnyThinkRewardedVideo/AnyThinkRewardedVideo.h>
#import <AnyThinkBanner/AnyThinkBanner.h>

NSString *const interstitialPlacementID = @"b5fb1116e776c4";
NSString *const rewardedPlacementID = @"b5fb664ab42481";
NSString *const bannerPlacementID = @"b5fba95475f18c";


@interface ViewController()<ATInterstitialDelegate,ATRewardedVideoDelegate,ATBannerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *logText;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBorder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@synthesize logText;

-(void)setBorder{
    [[self.logText layer] setBorderColor:[[UIColor orangeColor] CGColor]];
    [[self.logText layer] setBorderWidth:2.3];
    [[self.logText layer] setCornerRadius:15];
}

-(void)logOut:(NSString*)message withUITextView:(UITextView*)textView withTimestamp:(NSString*)timestamp{
    textView.text = [textView.text stringByAppendingString:timestamp];
    textView.text = [textView.text stringByAppendingString:@" - "];
    textView.text = [textView.text stringByAppendingString:message];
    textView.text = [textView.text stringByAppendingString:@"\n"];
    NSRange bottom = NSMakeRange(logText.text.length -1, 1);
    [textView scrollRangeToVisible:bottom];
}

-(NSString*)getTimestamp{
    NSDateFormatter *objDateformat = [[NSDateFormatter alloc] init];
    [objDateformat setDateFormat:@"HHmmssSSS"];
    NSString *timestamp = [objDateformat stringFromDate:[NSDate date]];
    return timestamp;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}


- (void)didFailToLoadADWithPlacementID:(NSString *)placementID error:(NSError *)error {
    if([placementID isEqual:interstitialPlacementID]){
        [self logOut:@"Interstitial Did Fail To Load AD" withUITextView:logText withTimestamp:[self getTimestamp]];
    }else if([placementID isEqual:rewardedPlacementID]){
        [self logOut:@"Rewarded Did Fail To Load AD" withUITextView:logText withTimestamp:[self getTimestamp]];
    }else if([placementID isEqual:bannerPlacementID]){
        [self logOut:@"Banner Did Fail To Load AD" withUITextView:logText withTimestamp:[self getTimestamp]];
    }
}

- (void)didFinishLoadingADWithPlacementID:(NSString *)placementID {
    if([placementID isEqual:interstitialPlacementID]){
        [self logOut:@"Interstitial Did Finish Loading AD" withUITextView:logText withTimestamp:[self getTimestamp]];
    }else if([placementID isEqual:rewardedPlacementID]){
        [self logOut:@"Rewarded Did Finish Loading AD" withUITextView:logText withTimestamp:[self getTimestamp]];
    }else if([placementID isEqual:bannerPlacementID]){
        [self logOut:@"Banner Did Finish Loading AD" withUITextView:logText withTimestamp:[self getTimestamp]];
    }
}

////////// Interstitial //////////
- (IBAction)loadInterstitial:(id)sender {
    [[ATAdManager sharedManager] loadADWithPlacementID:interstitialPlacementID extra:nil delegate:self];
    [self logOut:@"Load Interstitial" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (IBAction)showInterstitial:(id)sender {
    [[ATAdManager sharedManager] showInterstitialWithPlacementID:interstitialPlacementID inViewController:self delegate:self];
    [self logOut:@"Show Interstitial" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialDidClickForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
   NSLog(@"interstitialDidClickForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Interstitial Did Click" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialDidCloseForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
   NSLog(@"interstitialDidCloseForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Interstitial Did Close" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialDidEndPlayingVideoForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
   NSLog(@"interstitialDidEndPlayingVideoForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Interstitial Did End Playing Video" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialDidFailToPlayVideoForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {
   NSLog(@"interstitialDidFailToPlayVideoForPlacementID:%@ error:%@ extra:%@", placementID, error, extra);
    [self logOut:@"Interstitial Did Fail ToPlay Video" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialDidShowForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
   NSLog(@"interstitialDidShowForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Interstitial Did Show" withUITextView:logText withTimestamp:[self getTimestamp]];

}

- (void)interstitialDidStartPlayingVideoForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
   NSLog(@"interstitialDidStartPlayingVideoForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Interstitial Did Start Playing Video" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (void)interstitialFailedToShowForPlacementID:(NSString *)placementID error:(NSError *)error extra:(NSDictionary *)extra {
   NSLog(@"interstitialFailedToShowForPlacementID:%@ error:%@ extra:%@", placementID, error, extra);
    [self logOut:@"Interstitial Failed To Show" withUITextView:logText withTimestamp:[self getTimestamp]];
}


////////// Rewarded //////////////
- (IBAction)loadRewarded:(id)sender {
    [[ATAdManager sharedManager] loadADWithPlacementID:rewardedPlacementID extra:nil delegate:self];
    [self logOut:@"Load Rewarded" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (IBAction)showRewarded:(id)sender {
    [[ATAdManager sharedManager] showRewardedVideoWithPlacementID:rewardedPlacementID scene:nil inViewController:self delegate:self];
    [self logOut:@"Show Rewarded" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void) rewardedVideoDidRewardSuccessForPlacemenID:(NSString *)placementID extra:(NSDictionary *)extra{
    NSLog(@"rewardedVideoDidRewardSuccessForPlacemenID:%@ extra:%@",placementID,extra);
    [self logOut:@"Rewarded Video Did Reward Success" withUITextView:logText withTimestamp:[self getTimestamp]];

}

-(void) rewardedVideoDidStartPlayingForPlacementID:(NSString *)placementID extra:(NSDictionary *)extra {
    NSLog(@"rewardedVideoDidStartPlayingForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Rewarded Video Did Start Playing" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void) rewardedVideoDidEndPlayingForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra {
    NSLog(@"rewardedVideoDidEndPlayingForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Rewarded Video Did End Playing" withUITextView:logText withTimestamp:[self getTimestamp]];

}

-(void) rewardedVideoDidFailToPlayForPlacementID:(NSString*)placementID error:(NSError*)error extra:(NSDictionary *)extra {
    NSLog(@"rewardedVideoDidFailToPlayForPlacementID:%@ error:%@ extra:%@", placementID, error, extra);
    [self logOut:@"Rewarded Video Did Fail ToPlay" withUITextView:logText withTimestamp:[self getTimestamp]];

}

-(void) rewardedVideoDidCloseForPlacementID:(NSString*)placementID rewarded:(BOOL)rewarded extra:(NSDictionary *)extra {
    NSLog(@"rewardedVideoDidCloseForPlacementID:%@, rewarded:%@ extra:%@", placementID, rewarded ? @"yes" : @"no", extra);
    [self logOut:@"Rewarded Video Did Close" withUITextView:logText withTimestamp:[self getTimestamp]];

}

-(void) rewardedVideoDidClickForPlacementID:(NSString*)placementID extra:(NSDictionary *)extra {
    NSLog(@"rewardedVideoDidClickForPlacementID:%@ extra:%@", placementID, extra);
    [self logOut:@"Rewarded Video Did Click" withUITextView:logText withTimestamp:[self getTimestamp]];
}


////////// Banner //////////
- (IBAction)loadBanner:(id)sender {
    [[ATAdManager sharedManager] loadADWithPlacementID:bannerPlacementID extra:nil delegate:self];
    [self logOut:@"Load Banner" withUITextView:logText withTimestamp:[self getTimestamp]];
}

- (IBAction)showBanner:(id)sender {
    [self logOut:@"Show Banner" withUITextView:logText withTimestamp:[self getTimestamp]];

    if ([[ATAdManager sharedManager] bannerAdReadyForPlacementID:bannerPlacementID]) {
          NSInteger tag = 3333;
          [[self.view viewWithTag:tag] removeFromSuperview];
           ATBannerView * bannerView = [[ATAdManager sharedManager] retrieveBannerViewForPlacementID:bannerPlacementID];
           bannerView.delegate = self;
           bannerView.presentingViewController = self;
           bannerView.translatesAutoresizingMaskIntoConstraints = NO;
           bannerView.tag = tag;
           [self.view addSubview:bannerView];
        
        [self.view addConstraints:@[
        [NSLayoutConstraint constraintWithItem:bannerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide
                                                                 attribute:NSLayoutAttributeTop multiplier:1 constant:0],
        [NSLayoutConstraint constraintWithItem:bannerView attribute:NSLayoutAttributeCenterX  relatedBy:NSLayoutRelationEqual toItem:self.view
                                                                 attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]
                                    ]];
        
       } else {
           [self logOut:@"Banner ad's not ready" withUITextView:logText withTimestamp:[self getTimestamp]];
           NSLog(@"Banner ad's not ready for placementID:%@",bannerPlacementID);
       }
    
}

- (IBAction)hideBanner:(id)sender {
    [[self.view viewWithTag:3333] removeFromSuperview];
    [self logOut:@"Hide Banner" withUITextView:logText withTimestamp:[self getTimestamp]];
}

-(void) bannerView:(ATBannerView*)bannerView didShowAdWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"bannerView:didShowAdWithPlacementID:%@ with extra: %@", placementID,extra);
    [self logOut:@"Banner Did Show Ad" withUITextView:logText withTimestamp:[self getTimestamp]];


}
-(void) bannerView:(ATBannerView*)bannerView didClickWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"bannerView:didClickWithPlacementID:%@ with extra: %@", placementID,extra);
    [self logOut:@"Banner Did Click" withUITextView:logText withTimestamp:[self getTimestamp]];

}
-(void) bannerView:(ATBannerView*)bannerView didCloseWithPlacementID:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"bannerView:didCloseWithPlacementID:%@ with extra: %@", placementID,extra);
    [self logOut:@"Banner Did Close" withUITextView:logText withTimestamp:[self getTimestamp]];

}
-(void) bannerView:(ATBannerView*)bannerView didAutoRefreshWithPlacement:(NSString*)placementID extra:(NSDictionary *)extra{
    NSLog(@"bannerView:didAutoRefreshWithPlacement:%@ with extra: %@", placementID,extra);
    [self logOut:@"Banner Did Auto Refresh" withUITextView:logText withTimestamp:[self getTimestamp]];

}
-(void) bannerView:(ATBannerView*)bannerView failedToAutoRefreshWithPlacementID:(NSString*)placementID  extra:(NSDictionary *)extra error:(NSError*)error {
    NSLog(@"bannerView:failedToAutoRefreshWithPlacementID:%@ error:%@", placementID, error);
    [self logOut:@"Banner Failed To Auto Refresh" withUITextView:logText withTimestamp:[self getTimestamp]];

}
-(void) bannerView:(ATBannerView*)bannerView didTapCloseButtonWithPlacementID:(NSString*)placementID extra:(NSDictionary*)extra {
    NSLog(@"bannerView:didTapCloseButtonWithPlacementID:%@ extra: %@", placementID,extra);
    [self logOut:@"Banner Did Tap Close Button" withUITextView:logText withTimestamp:[self getTimestamp]];}



@end
