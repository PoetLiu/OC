//
//  MapViewController.m
//  WorldTrotter
//
//  Created by liupeng on 16/3/23.
//  Copyright © 2016年 liupeng. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
@property (strong, nonatomic) MKMapView *mapView;
@end

@implementation MapViewController

- (void)loadView {
	self.mapView	= [[MKMapView alloc] init];
	[self setView:self.mapView];
	
	UISegmentedControl *segmentedControl	= [[UISegmentedControl alloc] initWithItems:@[@"Standard", @"Hybrid", @"Satellite"]];
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
