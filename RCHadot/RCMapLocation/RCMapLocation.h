//
//  RCMapLocation.h
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014   RidgeCorn. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "RCObject.h"

@interface RCMapLocation : RCObject

+ (CLLocationCoordinate2D)BD09toGCJ02:(CLLocationCoordinate2D)coordinate;

+ (CLLocationCoordinate2D)GCJ02toBD09:(CLLocationCoordinate2D)coordinate;

+ (MKCoordinateSpan)calculateCoordinateSpanWithMapView:(MKMapView *)mapView centerCoordinate:(CLLocationCoordinate2D)centerCoordinate andZoomLevel:(NSUInteger)zoomLevel;

+ (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)coordinate1 sameAs:(CLLocationCoordinate2D)coordinate2;

+ (NSInteger)getMapViewZoomLevel:(MKMapView *)mapView;

@end
