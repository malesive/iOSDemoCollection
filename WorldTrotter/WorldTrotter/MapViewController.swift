//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by June801 on 16/1/18.
//  Copyright © 2016年 June801. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    
    override func loadView() {
        print("loadView method is called")
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite",])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
//        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor,constant: 8)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
    }
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initLocation()
        initButton()
        print("MapViewController loaded its view.")
//        if CLLocationManager.authorizationStatus() == .NotDetermined {
//            locationManager.requestWhenInUseAuthorization()
//        }
        mapView.userTrackingMode = .Follow
//        mapView.showsUserLocation = true
    }
    
//    var btn: UIButton!
    
    func initButton() {
        let btn = UIButton()
        btn.frame = CGRect(x: 8, y: 100, width: 40, height: 40)
        btn.backgroundColor = UIColor.purpleColor()
        btn.addTarget(self, action: "btnPressed:", forControlEvents: .TouchUpInside)
        view.addSubview(btn)
    }
    
    func btnPressed(btn: UIButton) {
        print("请求位置权限")
        locationManager.requestWhenInUseAuthorization()
//        UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
    }
    
    func initLocation() {
//        locationManager = CLLocationManager()
////        locationManager.delegate = self
//        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        
//        let authorizationStatus = CLLocationManager.authorizationStatus()
//        switch authorizationStatus {
//        case .Authorized:
//            print("authorized")
//        case .AuthorizedWhenInUse:
//            print("authorized when in use")
//        case .Denied:
//            print("denied")
//        case .NotDetermined:
//            print("not determined")
//        case .Restricted:
//            print("restricted")
//        }
//        
//        locationManager.requestWhenInUseAuthorization()
//        locationManager.startUpdatingLocation()
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        let distance:CLLocationDistance = 10.0
        locationManager.distanceFilter = distance
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if (authorizationStatus == CLAuthorizationStatus.NotDetermined) {
            locationManager.requestWhenInUseAuthorization()
        } else if (authorizationStatus == CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if (status == CLAuthorizationStatus.AuthorizedWhenInUse) {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        let coordinate = location.coordinate
        print("经度：\(coordinate.longitude)  纬度：\(coordinate.latitude)")
        locationManager.stopUpdatingLocation()
    }
    
    func mapTypeChanged(segControl: UISegmentedControl){
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
}
