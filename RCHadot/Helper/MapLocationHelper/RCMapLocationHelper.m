//
//  RCMapLocationHelper.m
//  RCHadot
//
//  Created by Looping on 14-4-10.
//  Copyright (c) 2014    RidgeCorn. All rights reserved.
//

#import "RCMapLocationHelper.h"
#import <NSObject+RCVerify.h>

#define X_PI M_PI * 50 / 3.0f

#define MERCATOR_OFFSET 268435456
#define MERCATOR_RADIUS 85445659.44705395

@implementation RCMapLocationHelper

+ (CLLocationCoordinate2D)GCJ02toBD09:(CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D BD09Coordinate;
    double x = coordinate.longitude, y = coordinate.latitude;
    double z = sqrt(x * x + y * y) + 0.00002 * sin(y * X_PI);
    double theta = atan2(y, x) + 0.000003 * cos(x * X_PI);
    BD09Coordinate.longitude = z * cos(theta) + 0.0065;
    BD09Coordinate.latitude = z * sin(theta) + 0.006;
    return BD09Coordinate;
}

+ (CLLocationCoordinate2D)BD09toGCJ02:(CLLocationCoordinate2D)coordinate {
    CLLocationCoordinate2D GCJ02Coordinate;
    double x = coordinate.longitude - 0.0065, y = coordinate.latitude - 0.006;
    double z = sqrt(x * x + y * y) - 0.00002 * sin(y * X_PI);
    double theta = atan2(y, x) - 0.000003 * cos(x * X_PI);
    GCJ02Coordinate.longitude = z * cos(theta);
    GCJ02Coordinate.latitude = z * sin(theta);
    return GCJ02Coordinate;
}

+ (double)longitudeToPixelSpaceX:(double)longitude
{
    return round(MERCATOR_OFFSET + MERCATOR_RADIUS * longitude * M_PI / 180.0);
}

+ (double)latitudeToPixelSpaceY:(double)latitude
{
    return round(MERCATOR_OFFSET - MERCATOR_RADIUS * logf((1 + sinf(latitude * M_PI / 180.0)) / (1 - sinf(latitude * M_PI / 180.0))) / 2.0);
}

+ (double)pixelSpaceXToLongitude:(double)pixelX
{
    return ((round(pixelX) - MERCATOR_OFFSET) / MERCATOR_RADIUS) * 180.0 / M_PI;
}

+ (double)pixelSpaceYToLatitude:(double)pixelY
{
    return (M_PI / 2.0 - 2.0 * atan(exp((round(pixelY) - MERCATOR_OFFSET) / MERCATOR_RADIUS))) * 180.0 / M_PI;
}

+ (MKCoordinateSpan)calculateCoordinateSpanWithMapView:(MKMapView *)mapView
                                      centerCoordinate:(CLLocationCoordinate2D)centerCoordinate
                                          andZoomLevel:(NSUInteger)zoomLevel
{
    double centerPixelX = [self longitudeToPixelSpaceX:centerCoordinate.longitude];
    double centerPixelY = [self latitudeToPixelSpaceY:centerCoordinate.latitude];
    
    NSInteger zoomExponent = 20 - zoomLevel;
    double zoomScale = pow(2, zoomExponent);
    
    CGSize mapSizeInPixels = mapView.bounds.size;
    double scaledMapWidth = mapSizeInPixels.width * zoomScale;
    double scaledMapHeight = mapSizeInPixels.height * zoomScale;
    
    double topLeftPixelX = centerPixelX - (scaledMapWidth / 2);
    double topLeftPixelY = centerPixelY - (scaledMapHeight / 2);
    
    CLLocationDegrees minLng = [self pixelSpaceXToLongitude:topLeftPixelX];
    CLLocationDegrees maxLng = [self pixelSpaceXToLongitude:topLeftPixelX + scaledMapWidth];
    CLLocationDegrees longitudeDelta = maxLng - minLng;
    
    CLLocationDegrees minLat = [self pixelSpaceYToLatitude:topLeftPixelY];
    CLLocationDegrees maxLat = [self pixelSpaceYToLatitude:topLeftPixelY + scaledMapHeight];
    CLLocationDegrees latitudeDelta = -1 * (maxLat - minLat);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(latitudeDelta, longitudeDelta);
    return span;
}

+ (NSInteger)getMapViewZoomLevel:(MKMapView *)mapView {
    return 20 - round(log2(mapView.region.span.longitudeDelta * MERCATOR_RADIUS * M_PI / (180.0f * mapView.bounds.size.width)));
}

+ (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)coordinate1 sameAs:(CLLocationCoordinate2D)coordinate2 {
    BOOL isSameLocationCoordinate = NO;
    if ([NSObject isFloatZero:(coordinate1.latitude - coordinate2.latitude)] && [NSObject isFloatZero:(coordinate1.longitude - coordinate2.longitude)]) {
        isSameLocationCoordinate = YES;
    }
    return isSameLocationCoordinate;
}

@end
