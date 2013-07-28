//
//  TrafficStatistic.h
//  TrafficStatistic
//
//  Created by Mac on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TrafficStatistic : NSObject{
}
+(int) getGprsFlowIOBytes;
+(int) getWifiFlowIOBytes;
+(NSString*) bytesToString:(int) bytes;
@end
