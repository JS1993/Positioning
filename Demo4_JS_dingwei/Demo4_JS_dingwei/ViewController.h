//
//  ViewController.h
//  Demo4_JS_dingwei
//
//  Created by  江苏 on 16/3/16.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>
@property(nonatomic,strong)CLLocationManager* manager;
@end

