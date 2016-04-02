//
//  ViewController.m
//  Demo4_JS_dingwei
//
//  Created by  江苏 on 16/3/16.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "JSAnnotation.h"
@interface ViewController ()
@property(nonatomic)CLLocationCoordinate2D coordx;
@property (strong, nonatomic) IBOutlet MKMapView *myMapView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //询问用户是否开启定位
//    if ([CLLocationManager locationServicesEnabled]) {
         self.manager=[[CLLocationManager alloc]init];
        //设置精度
        [self.manager setDesiredAccuracy:kCLLocationAccuracyBest];
        //设置每移动10米刷新一次
        [self.manager setDistanceFilter:10];
        //设置代理
        self.manager.delegate=self;
        //开始更新位置
        [self.manager startUpdatingLocation];
        [self.manager requestAlwaysAuthorization];
//        [self.manager requestWhenInUseAuthorization];
//    }
//    CLLocationCoordinate2D coordx;
//    coordx.longitude=108.95000;
//    coordx.latitude=34.26667;
    [self.myMapView setShowsUserLocation:YES];
//    MKCoordinateSpan span;
//    span.longitudeDelta = 0.001;
//    span.latitudeDelta = 0.001;
//    [self.myMapView setRegion:MKCoordinateRegionMake(coordx, span)];

}
//MapView委托方法，当定位自身时调用
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0){
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [self.myMapView setRegion:region animated:YES];
}
//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
//    CLLocation *location=[locations lastObject];
//    MKCoordinateSpan span;
//    span.longitudeDelta = 0.001;
//    span.latitudeDelta = 0.001;
//    [self.myMapView setRegion:MKCoordinateRegionMake(location.coordinate, span)];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)tapAction:(UITapGestureRecognizer *)sender {
    CGPoint p=[sender locationInView:self.view];
    CLLocationCoordinate2D coord=[self.myMapView convertPoint:p toCoordinateFromView:self.view];
    JSAnnotation* annotation=[[JSAnnotation alloc]init];
    [annotation setCoordinate:coord];
    annotation.title=@"目的地";
    annotation.subtitle=@"目的地";
    [self.myMapView addAnnotation:annotation];
}
@end
