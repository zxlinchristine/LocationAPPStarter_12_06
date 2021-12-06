//
//  LocationViewController.swift
//  LocationAPPStarter
//
//  Created by 羅壽之 on 2021/11/28.
//

import UIKit
import CoreLocation

class LocationViewController: UIViewController {
    
    @IBOutlet var latLabel: UILabel!
    @IBOutlet var longLabel: UILabel!
    
    let locationManager = CLLocationManager()
    
    @IBAction func getLocation() {
        // Request the location update once
        locationManager.requestLocation()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Requests the user’s permission to use location services
        let authStatus = locationManager.authorizationStatus
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        // Set the desired accuracy (optinally)
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        // Set the delegate
        locationManager.delegate = self
        
        // Request the location update repeatedly
        locationManager.startUpdatingLocation()
    }
    
}


// Implement the receiver methods of location updates

extension LocationViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            latLabel.text = "\(location.coordinate.latitude)"
            longLabel.text = "\(location.coordinate.longitude)"
        }
    }
}
