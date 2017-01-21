//
//  ViewController.swift
//  IndoorPositiongSystem
//
//  Created by KOO on 20/01/2017.
//  Copyright © 2017 itech. All rights reserved.
//
import UIKit
import CoreLocation

class ViewController: UIViewController , CLLocationManagerDelegate{
    
    @IBOutlet weak var near: UILabel!
    @IBOutlet weak var near_RSSI: UILabel!
    
    
    @IBOutlet weak var immediate_RSSI: UILabel!
    @IBOutlet weak var immediate: UILabel!
    
    @IBOutlet weak var far: UILabel!
    @IBOutlet weak var far_RSSI: UILabel!
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "29B723B8-9E11-4A20-AEB7-2AA90368A261") as! UUID , identifier: "")
    let colors = [
        1111: UIColor(red: 33/255, green: 77/255, blue: 160/255, alpha: 1),
        2222: UIColor(red: 240/255, green: 77/255, blue: 0/255, alpha: 1),
        3333: UIColor(red: 0/255, green: 255/255, blue: 60/255, alpha: 1),
        ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        if(CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startRangingBeacons(in: region)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown}
        if (knownBeacons.count > 0){
            let beaconNear = knownBeacons[0] as CLBeacon
            let beaconImmediate = knownBeacons[1] as CLBeacon
            let beaconFar = knownBeacons[2] as CLBeacon
            
            near.text=String(beaconNear.minor.intValue)
            near_RSSI.text=String(beaconNear.rssi)
            
            immediate.text=String(beaconImmediate.minor.intValue)
            immediate_RSSI.text=String(beaconImmediate.rssi)
            
            far.text=String(beaconFar.minor.intValue)
            far_RSSI.text=String(beaconFar.rssi)
        }
    }
    
}
