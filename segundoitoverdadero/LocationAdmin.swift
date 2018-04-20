//
//  LocationAdmin.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 20/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import CoreLocation

class LocationAdmin: NSObject, CLLocationManagerDelegate {

    var locationManager:CLLocationManager?
    var delegate:LocationAdminDelegate?
    
    
    override init(){
      super.init()
    locationManager=CLLocationManager()
    locationManager?.delegate=self
    locationManager?.startUpdatingLocation()
    locationManager?.requestAlwaysAuthorization()
    
    }
    func locationManager(_manager:CLLocationManager,didUpdateLocations locations: [CLLocation]){
        print("mi pos en lat:",locations[0].coordinate.latitude,"long:",locations[0].coordinate.longitude)
    }
}
    protocol LocationAdminDelegate{
        func localizacionActualizada(coordenada:CLLocationCoordinate2D)
    }

