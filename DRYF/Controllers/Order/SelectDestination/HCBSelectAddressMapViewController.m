//
//  HCBSelectAddressMapViewController.m
//  DRYF
//
//  Created by AppsCreationTech on 09/11/15.
//  Copyright © 2015 AppsCreationTech. All rights reserved.
//

#import "HCBSelectAddressMapViewController.h"
#import "HCBLocationManager.h"

@import GoogleMaps;

static CGFloat const kDefaultZoom = 16.0;

@interface HCBSelectAddressMapViewController ()
<
    GMSMapViewDelegate
>

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@end

@implementation HCBSelectAddressMapViewController

-(void)viewDidLoad
{
    [super viewDidLoad];

    [_mapView setCamera:[GMSCameraPosition cameraWithTarget:[HCBLocationManager sharedManager].currentLocation.coordinate
                                                       zoom:kDefaultZoom]];

    [self updateAddress:[HCBLocationManager sharedManager].currentLocation];
}

#pragma mark - GMSMapViewDelegate

-(void)mapView:(GMSMapView *)mapView idleAtCameraPosition:(GMSCameraPosition *)position
{
    [self updateAddress:[[CLLocation alloc] initWithLatitude:mapView.camera.target.latitude
                                                   longitude:mapView.camera.target.longitude]];
}

#pragma mark - Helpers

-(void)updateAddress:(CLLocation *)location
{
    __weak typeof(self) weakSelf = self;
    [[HCBLocationManager sharedManager] stringFromLocation:location completionBlock:^(NSString *addressString)
    {
        weakSelf.addressLabel.text = addressString;
    }];
}

#pragma mark - Actions

-(IBAction)searchButtonClicked:(id)sender
{

}

-(IBAction)currentLocationButtonClicked:(id)sender
{
    [_mapView animateToLocation:[HCBLocationManager sharedManager].currentLocation.coordinate];
}

-(IBAction)doneButtonClicked:(id)sender
{

}

@end
