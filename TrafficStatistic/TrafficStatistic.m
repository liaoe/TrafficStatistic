//
//  TrafficStatistic.m
//  TrafficStatistic
//
//  Created by Mac on 12-9-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TrafficStatistic.h"
#include <ifaddrs.h>  
#include <sys/socket.h>  
#include <net/if.h> 

@implementation TrafficStatistic

+(int) getGprsFlowIOBytes{
    struct ifaddrs *ifa_list = 0, *ifa;  
    if (getifaddrs(&ifa_list) == -1)  
    {  
        return 0;  
    }  
    
    uint32_t iBytes = 0;  
    uint32_t oBytes = 0;  
    
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next)  
    {  
        if (AF_LINK != ifa->ifa_addr->sa_family)  
            continue;  
        
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))  
            continue;  
        
        if (ifa->ifa_data == 0)  
            continue;  
        
        if (!strcmp(ifa->ifa_name, "pdp_ip0"))  
        {  
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;  
            
            iBytes += if_data->ifi_ibytes;  
            oBytes += if_data->ifi_obytes;  
            NSLog(@"%s :iBytes is %d, oBytes is %d",  
                  ifa->ifa_name, iBytes, oBytes);  
        }  
    }  
    freeifaddrs(ifa_list);  
    
    return iBytes + oBytes;
}

+(int) getWifiFlowIOBytes{
    struct ifaddrs *ifa_list = 0, *ifa;  
    if (getifaddrs(&ifa_list) == -1)  
    {  
        return 0;  
    }  
    
    uint32_t iBytes = 0;  
    uint32_t oBytes = 0;  
    
    for (ifa = ifa_list; ifa; ifa = ifa->ifa_next)  
    {  
        if (AF_LINK != ifa->ifa_addr->sa_family)  
            continue;  
        
        if (!(ifa->ifa_flags & IFF_UP) && !(ifa->ifa_flags & IFF_RUNNING))  
            continue;  
        
        if (ifa->ifa_data == 0)  
            continue;  
        
        /* Not a loopback device. */  
        if (strncmp(ifa->ifa_name, "lo", 2))  
        {  
            struct if_data *if_data = (struct if_data *)ifa->ifa_data;  
            
            iBytes += if_data->ifi_ibytes;  
            oBytes += if_data->ifi_obytes;  
            
            //            NSLog(@"%s :iBytes is %d, oBytes is %d",  
            //                  ifa->ifa_name, iBytes, oBytes);  
        }  
    }  
    freeifaddrs(ifa_list);  
    
    return iBytes+oBytes;
}

+(NSString *) bytesToString:(int)bytes{
    
	if(bytes < 1024)		// B
	{
		return [NSString stringWithFormat:@"%dB", bytes];
	}
	else if(bytes >= 1024 && bytes < 1024 * 1024)	// KB
	{
		return [NSString stringWithFormat:@"%.1fKB", (double)bytes / 1024];
	}
	else if(bytes >= 1024 * 1024 && bytes < 1024 * 1024 * 1024)	// MB
	{
		return [NSString stringWithFormat:@"%.2fMB", (double)bytes / (1024 * 1024)];
	}
	else	// GB
	{
		return [NSString stringWithFormat:@"%.3fGB", (double)bytes / (1024 * 1024 * 1024)];
	}

}

@end
