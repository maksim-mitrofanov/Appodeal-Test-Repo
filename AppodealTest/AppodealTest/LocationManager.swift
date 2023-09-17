//
//  LocationManager.swift
//  AppodealTest
//
//  Created by Максим Митрофанов on 16.09.2023.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    @Published private(set) var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published private(set) var authorizationStatusDescription: String = "Empty"

    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
        
        switch authorizationStatus {
        case .notDetermined:
            authorizationStatusDescription = "Not determined"
        case .restricted:
            authorizationStatusDescription = "Restricted"
        case .denied:
            authorizationStatusDescription = "Denied"
        case .authorizedAlways:
            authorizationStatusDescription = "Always auth"
        case .authorizedWhenInUse:
            authorizationStatusDescription = "Auth when in use"
        case .authorized:
            authorizationStatusDescription = "Authorized"
        default: authorizationStatusDescription = "Unknown"
        }
    }
}
