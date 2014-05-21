//
//  MAPViewController.m
//  Maps
//
//  Created by Jeffery Moulds on 5/21/14.
//  Copyright (c) 2014 Jeffery Moulds. All rights reserved.
//

#import "MAPViewController.h"

#import <MapKit/MapKit.h>

#import <CoreLocation/CoreLocation.h>

#import "MAPAnnotation.h"

@interface MAPViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MAPViewController
{

    CLLocationManager * lManager;
    MKMapView * myMapView;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    
        lManager = [[CLLocationManager alloc] init];
    
        lManager.delegate = self;
        
        lManager.distanceFilter = 1000;

//        lManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        
        [lManager startUpdatingLocation];
    
    }
    return self;
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [myMapView removeAnnotations:myMapView.annotations];

    for (CLLocation * location in locations)
    {
        MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];
        
        [myMapView addAnnotation:annotation];

        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        [myMapView setRegion:region animated:YES];

        

//        NSLog(@"%@", location);
        
        
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];

        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
//            NSLog(@"%@", placemarks);
            
            for (CLPlacemark * placemark in placemarks)
            {
                NSLog(@"%@", placemark.country);
            

                NSString * cityState = [NSString stringWithFormat:@"%@, %@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                
                [annotation setTitle:cityState];
                [annotation setSubtitle:placemark.country];
                
                [myMapView selectAnnotation:annotation animated:YES];

            
            }

        }];
        

        
    }
}




- (void)viewDidLoad
{
    [super viewDidLoad];

    myMapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:myMapView];
    myMapView.delegate = self;
    
    

}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{

    MKAnnotationView * annotationView = [myMapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if (annotationView == nil)
        
    {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotationView"];
    } else {
    
        annotationView.annotation = annotation;
    }
    

    // annotationView.image = [[uiimage imageNamed:@"yellow0"]; and change above to annotation view, not pin annotaiton view.
    
    
    annotationView.draggable = YES;
    
    annotationView.canShowCallout = YES;

    return annotationView;
}



-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{

    NSLog(@"new state: %d and old state %d", (int)newState, (int)oldState);
    
    switch ((int)newState) {
        case 0 :  // not dragging
        {
            [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
            
            CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
            
            CLLocation * location = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
            
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
                //            NSLog(@"%@", placemarks);
                
                for (CLPlacemark * placemark in placemarks)
                {
                    NSLog(@"%@", placemark.addressDictionary);
                    
                    NSString * cityState = [NSString stringWithFormat:@"%@, %@",placemark.addressDictionary[@"City"],placemark.addressDictionary[@"State"]];
                    
                    [(MAPAnnotation *)view.annotation setTitle:cityState];
                    [(MAPAnnotation *)view.annotation setSubtitle:placemark.country];
                }
                
            }];
        }
            
            
            break;

        case 1 :  // starting drag
            
            break;

        case 2 :  // dragging
            
            break;

        case 4 :  // ending drag
            
            break;
    
            
            
            
        default:
            break;
    }

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
