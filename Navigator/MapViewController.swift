//
//  MapViewController.swift
//  Navigator
//
//  Created by Anna on 22.06.17.
//  Copyright © 2017 Anna. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    var placeName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        manager.delegate = self
        //        manager.desiredAccuracy = kCLLocationAccuracyBest
        //        manager.requestWhenInUseAuthorization()
        //        manager.startUpdatingLocation()
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: options)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    //        let location = locations[0]
    //        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
    //        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    //        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
    //        map.setRegion(region, animated: true)
    //        self.map.showsUserLocation = true
    //
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
