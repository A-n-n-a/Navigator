

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController {

    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    var placeName = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placemark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = placeName
        mapItem.openInMaps(launchOptions: options)
        
    }
    


}
