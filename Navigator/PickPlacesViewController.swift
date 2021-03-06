


import UIKit
import GooglePlaces


class PickPlacesViewController: UIViewController {
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    var coordinate = CLLocationCoordinate2D() 
    var placeName = String()
    var latitude = CLLocationDegrees()
    var longitude = CLLocationDegrees()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self as GMSAutocompleteResultsViewControllerDelegate
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        let subView = UIView(frame: CGRect(x: 0, y: 25.0, width: 375.0, height: 45.0))
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        definesPresentationContext = true
        

    }
}


extension PickPlacesViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false

        print("Place name: \(place.name)")
        print("Place address: \(String(describing: place.formattedAddress!))")
        print("Place attributions: \(String(describing: place.attributions))")
        print("Coordinate: \(place.coordinate)")
        coordinate = place.coordinate
        latitude = coordinate.latitude
        longitude = coordinate.longitude
        
        
        placeName = place.formattedAddress!
        
        DispatchQueue.main.async(execute: {
        
            self.performSegue(withIdentifier: "GoToMap", sender: self)
        })
        
        
    }
    

    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destViewController = segue.destination as! MapViewController

        
        destViewController.placeName = self.placeName
        destViewController.latitude = self.latitude
        destViewController.longitude = self.longitude
    }

}

