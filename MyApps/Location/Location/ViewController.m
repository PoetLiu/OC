//
//  ViewController.m
//  Location
//
//  Created by liupeng on 16/6/30.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) UIButton *locationButton;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:NO];
    [self.navigationController setToolbarHidden:NO animated:NO];
}

- (void)activityIndicatorSetAnimate:(BOOL)animate {
	if (self.activityIndicator == nil) {
		self.activityIndicator	= [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		self.activityIndicator.hidesWhenStopped	= YES;
		[self.view addSubview:self.activityIndicator];
		self.activityIndicator.center	= self.locationButton.center;
	}
	if (animate) {
		[self.activityIndicator startAnimating];
	} else {
		[self.activityIndicator stopAnimating];
	}
}

- (BOOL)showUserLocationAnnotation {
	if (self.mapView.userLocation.location != nil && self.mapView.isUserLocationVisible != YES) {
		[self.mapView showAnnotations:@[self.mapView.userLocation] animated:YES];
		return YES;
	} else {
		return NO;
	}
	
}

- (void)beginShowUserLocation {
	self.mapView.showsUserLocation  = YES;
	if ([self showUserLocationAnnotation] == YES) {
		return;
	}
	self.locationButton.hidden      = YES;
	[self activityIndicatorSetAnimate:YES];
}

- (void)endShowUserLocation {
	self.mapView.showsUserLocation  = NO;
	self.locationButton.hidden      = NO;
	[self activityIndicatorSetAnimate:NO];
	[self showUserLocationAnnotation];
}

- (void)currentLocationShow {
	if (self.locationManager == nil) {
		self.locationManager = [[CLLocationManager alloc] init];
		self.locationManager.delegate	= self;
	}
	CLAuthorizationStatus currentStatus = [CLLocationManager authorizationStatus];
	NSLog(@"%d", currentStatus);
	if (currentStatus == kCLAuthorizationStatusNotDetermined || currentStatus == kCLAuthorizationStatusDenied) {
		[self.locationManager requestAlwaysAuthorization];
	} else {
		[self beginShowUserLocation];
	}
}

- (void)mapTypeChanged:(UISegmentedControl *)segControl {
	switch (segControl.selectedSegmentIndex) {
		case 0:
			self.mapView.mapType	= MKMapTypeStandard;
			break;
		case 1:
			self.mapView.mapType	= MKMapTypeHybrid;
			break;
		case 2:
			self.mapView.mapType	= MKMapTypeSatellite;
			break;
		default:
			break;
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
	NSLog(@"MapViewController loaded its view");
	
	NSString *standardString	= NSLocalizedString(@"Standard", @"Standard map view");
	NSString *satelliteString	= NSLocalizedString(@"Satellite", @"Satellite map view");
	NSString *hybridString		= NSLocalizedString(@"Hybrid", @"Hybrid map view");
	UISegmentedControl *segmentedControl	= [[UISegmentedControl alloc] initWithItems:@[standardString, satelliteString, hybridString]];
	segmentedControl.backgroundColor	= [[UIColor whiteColor] colorWithAlphaComponent:0.5];
	segmentedControl.selectedSegmentIndex	= 0;
	segmentedControl.translatesAutoresizingMaskIntoConstraints	= false;
	[segmentedControl addTarget:self action:@selector(mapTypeChanged:) forControlEvents:UIControlEventValueChanged];
	[self.view addSubview:segmentedControl];
	
	NSLayoutConstraint *topConstraint	= [segmentedControl.topAnchor constraintEqualToAnchor:[self.topLayoutGuide bottomAnchor] constant:8];
	UILayoutGuide *magins	= self.view.layoutMarginsGuide;
	NSLayoutConstraint *leadingConstraint = [segmentedControl.leadingAnchor constraintEqualToAnchor:magins.leadingAnchor];
	NSLayoutConstraint *traillingConstraint	= [segmentedControl.trailingAnchor constraintEqualToAnchor:magins.trailingAnchor];
	topConstraint.active	= true;
	leadingConstraint.active	= true;
	traillingConstraint.active	= true;
	
	UIButton *location = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[location setFrame:CGRectMake(0, 100, 0, 0)];
	[location setImage:[UIImage imageNamed:@"Location"] forState:UIControlStateNormal];
	location.contentMode = UIViewContentModeScaleToFill;
	[location sizeToFit];
	[location setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
	[location addTarget:self action:@selector(currentLocationShow) forControlEvents:UIControlEventTouchUpInside];
	NSLog(@"x:%f y:%f width:%f heigth:%f", location.frame.origin.x, location.frame.origin.y, location.frame.size.height, location.frame.size.width);
	self.locationButton	= location;
	[self.view addSubview:location];
	
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate
-(void)mapViewWillStartLocatingUser:(MKMapView *)mapView {
	NSLog(@"will start locating user");
}

-(void)mapViewDidStopLocatingUser:(MKMapView *)mapView {
	NSLog(@"Locating user stoped");
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
	NSLog(@"user location already updated.");
	[self endShowUserLocation];
}

-(void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error {
	NSLog(@"faild to locate user err:%@", error);
	[self endShowUserLocation];
}

#pragma mark - CLLocationManager delegate
-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
	NSLog(@"got authorization status change, new:%d", status);
	if (status == kCLAuthorizationStatusAuthorizedAlways) {
		[self beginShowUserLocation];
	}
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
