//
//  ViewController.swift
//  IndoorPositiongSystem
//
//  Created by KOO on 20/01/2017.
//  Copyright © 2017 itech. All rights reserved.
//
import UIKit
import CoreLocation
import CoreGraphics


var numberOfBeacon = 0
class ViewController: UIViewController , CLLocationManagerDelegate{

    @IBOutlet weak var near: UILabel!
    @IBOutlet weak var near_RSSI: UILabel!
    
    @IBOutlet weak var immediate_RSSI: UILabel!
    @IBOutlet weak var immediate: UILabel!
    @IBOutlet weak var far: UILabel!
    @IBOutlet weak var far_RSSI: UILabel!
    @IBOutlet weak var notice: UILabel!
    
    @IBOutlet weak var point1: UIImageView!
    @IBOutlet weak var welcomemessage: UILabel!
    
    @IBOutlet weak var ITSD: UIImageView!
    @IBOutlet weak var examHall: UIImageView!
    
    var minor = ""
    
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "29B723B8-9E11-4A20-AEB7-2AA90368A261") as! UUID , identifier: "")
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //web service

        point1.isHidden = true
        ITSD.isHidden = true
        examHall.isHidden=true
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
        var location = CGPoint(x:20, y:20)
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown}
        if (knownBeacons.count >= 3){

            notice.text="is working now !"
            point1.isHidden = false
            let beaconNear = knownBeacons[0] as CLBeacon
            let beaconImmediate = knownBeacons[1] as CLBeacon
            let beaconFar = knownBeacons[2] as CLBeacon
            
            near.text=String(beaconNear.minor.intValue)
            near_RSSI.text=String(beaconNear.rssi)
            
            immediate.text=String(beaconImmediate.minor.intValue)
            immediate_RSSI.text=String(beaconImmediate.rssi)
            
            far.text=String(beaconFar.minor.intValue)
            far_RSSI.text=String(beaconFar.rssi)
            
            if beaconNear.minor.intValue < 8000{
                ITSD.isHidden=false
                examHall.isHidden=true
            }
            
            if beaconNear.minor.intValue > 8000{
                examHall.isHidden=false
                ITSD.isHidden=true
            }
            
            switch beaconNear.minor.intValue{
            case 1001:
                location = CGPoint(x:870,y:390)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 1002:
                location = CGPoint(x:800,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1003:
                location = CGPoint(x:730,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1004:
                location = CGPoint(x:660,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1005:
                location = CGPoint(x:590,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1006:
                location = CGPoint(x:520,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1007:
                location = CGPoint(x:450,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1008:
                location = CGPoint(x:380,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1009:
                location = CGPoint(x:310,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1010:
                location = CGPoint(x:240,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1011:
                location = CGPoint(x:170,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 1012:
                location = CGPoint(x:100,y:390)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 2001:
                location = CGPoint(x:870,y:290)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 2002:
                location = CGPoint(x:800,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2003:
                location = CGPoint(x:730,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2004:
                location = CGPoint(x:660,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2005:
                location = CGPoint(x:590,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2006:
                location = CGPoint(x:520,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2007:
                location = CGPoint(x:450,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2008:
                location = CGPoint(x:380,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2009:
                location = CGPoint(x:310,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2010:
                location = CGPoint(x:240,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2011:
                location = CGPoint(x:170,y:290)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 2012:
                location = CGPoint(x:100,y:290)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 3001:
                location = CGPoint(x:870,y:610)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 3002:
                location = CGPoint(x:800,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3003:
                location = CGPoint(x:730,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3004:
                location = CGPoint(x:660,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3005:
                location = CGPoint(x:590,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3006:
                location = CGPoint(x:520,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3007:
                location = CGPoint(x:450,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3008:
                location = CGPoint(x:380,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3009:
                location = CGPoint(x:310,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3010:
                location = CGPoint(x:240,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3011:
                location = CGPoint(x:170,y:610)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 3012:
                location = CGPoint(x:100,y:610)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 4001:
                location = CGPoint(x:870,y:70)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 4002:
                location = CGPoint(x:800,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4003:
                location = CGPoint(x:730,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4004:
                location = CGPoint(x:660,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4005:
                location = CGPoint(x:590,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4006:
                location = CGPoint(x:520,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4007:
                location = CGPoint(x:450,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4008:
                location = CGPoint(x:380,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4009:
                location = CGPoint(x:310,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4010:
                location = CGPoint(x:240,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4011:
                location = CGPoint(x:170,y:70)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 4012:
                location = CGPoint(x:100,y:70)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 5001:
                location = CGPoint(x:870,y:340)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 5002:
                location = CGPoint(x:800,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5003:
                location = CGPoint(x:730,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5004:
                location = CGPoint(x:660,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5005:
                location = CGPoint(x:590,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5006:
                location = CGPoint(x:560,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5007:
                location = CGPoint(x:415,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5008:
                location = CGPoint(x:380,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5009:
                location = CGPoint(x:310,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5010:
                location = CGPoint(x:240,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5011:
                location = CGPoint(x:170,y:340)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 5012:
                location = CGPoint(x:100,y:340)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 6001:
                location = CGPoint(x:870,y:450)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 6002:
                location = CGPoint(x:800,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6003:
                location = CGPoint(x:730,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6004:
                location = CGPoint(x:660,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6005:
                location = CGPoint(x:590,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6006:
                location = CGPoint(x:520,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6007:
                location = CGPoint(x:455,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6008:
                location = CGPoint(x:380,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6009:
                location = CGPoint(x:310,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6010:
                location = CGPoint(x:240,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6011:
                location = CGPoint(x:170,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 6012:
                location = CGPoint(x:100,y:450)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 7001:
                location = CGPoint(x:870,y:540)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 7002:
                location = CGPoint(x:800,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7003:
                location = CGPoint(x:730,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7004:
                location = CGPoint(x:660,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7005:
                location = CGPoint(x:590,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7006:
                location = CGPoint(x:520,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7007:
                location = CGPoint(x:455,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7008:
                location = CGPoint(x:380,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7009:
                location = CGPoint(x:310,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7010:
                location = CGPoint(x:240,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7011:
                location = CGPoint(x:170,y:540)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 7012:
                location = CGPoint(x:100,y:540)
                welcomemessage.text = "Welcome to ITSD!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 8001:
                location = CGPoint(x:870,y:250)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8002:
                location = CGPoint(x:870,y:300)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8003:
                location = CGPoint(x:870,y:350)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8004:
                location = CGPoint(x:870,y:390)
                welcomemessage.text = "Welcome to Exam Hall!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 8005:
                location = CGPoint(x:870,y:430)
                welcomemessage.text = "Welcome to Exam Hall!"
                welcomemessage.backgroundColor = UIColor.lightGray
            case 8006:
                location = CGPoint(x:870,y:470)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8007:
                location = CGPoint(x:790,y:390)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8008:
                location = CGPoint(x:790,y:450)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8009:
                location = CGPoint(x:850,y:520)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            case 8010:
                location = CGPoint(x:850,y:580)
                welcomemessage.text = ""
                welcomemessage.backgroundColor = UIColor.white
            
            default:
                location = CGPoint(x:0,y:0)
            }
            point1.center=location;
            
        }else{
            notice.text="Need more than 3 beacons to work !"
        }
    }
    


}


