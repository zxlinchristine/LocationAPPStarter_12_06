//
//  TraceMapViewController.swift
//  LocationAPPStarter
//
//  Created by 羅壽之 on 2021/11/28.
//

import UIKit
import MapKit

class TraceMapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Requests the user’s permission to use location services
        // Set the desired accuracy (optionally)
        
        // Set the visible region
        let region = MKCoordinateRegion(center: mapView.centerCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
        mapView.setRegion( region, animated: false)
        
        // Enable the display of the user's current location
        mapView.showsUserLocation = true
        
        // Set the delegate
        mapView.delegate = self
        
    }
   
}



// Implement the response method for location updates in the MKMapViewDelegate protocol
extension TraceMapViewController: MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
}
