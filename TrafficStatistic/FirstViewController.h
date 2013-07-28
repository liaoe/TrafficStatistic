//
//  FirstViewController.h
//  TrafficStatistic
//
//  Created by Mac on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{

    //GPRS流量
    int gprsData ;
    //WiFi流量
    int wifiData;
    
    //GPRS和WiFi标签
    UILabel *gprsLabel;
    UILabel *wifiLabel;
}

@property (nonatomic,retain) IBOutlet UILabel *gprsLabel;
@property (nonatomic,retain) IBOutlet UILabel *wifiLabel;
@property (nonatomic,assign) int gprsData;
@property (nonatomic,assign) int wifiData;


@end
