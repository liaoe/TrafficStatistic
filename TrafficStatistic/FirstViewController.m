//
//  FirstViewController.m
//  TrafficStatistic
//
//  Created by Mac on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#include <ifaddrs.h>  
#include <sys/socket.h>  
#include <net/if.h> 
#import "TrafficStatistic.h"

@interface FirstViewController ()
{
    NSTimer     *timer;
}

@end

@implementation FirstViewController
@synthesize gprsData,wifiData;
@synthesize gprsLabel,wifiLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
- (void)dealloc
{
    [timer invalidate];
    [timer release];
    [super dealloc];
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //获取wifi和gprs数据
    gprsData = [TrafficStatistic getGprsFlowIOBytes];
    wifiData = [TrafficStatistic getWifiFlowIOBytes];
    
    NSString *gprsDataStr = [TrafficStatistic bytesToString:gprsData]; 
    NSString *wifiDataStr = [TrafficStatistic bytesToString:wifiData]; 
    
    gprsLabel.text = gprsDataStr;
    wifiLabel.text = wifiDataStr;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(doTimer) userInfo:nil repeats:YES];
    
}

-(void)doTimer
{
    //获取wifi和gprs数据
    gprsData = [TrafficStatistic getGprsFlowIOBytes];
    wifiData = [TrafficStatistic getWifiFlowIOBytes];
    
    NSString *gprsDataStr = [TrafficStatistic bytesToString:gprsData];
    NSString *wifiDataStr = [TrafficStatistic bytesToString:wifiData];
    
    gprsLabel.text = gprsDataStr;
    wifiLabel.text = wifiDataStr;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
