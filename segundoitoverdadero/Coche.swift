//
//  Coche.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 3/5/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit

class Coche: NSObject {
    
    var sNombre:String?
    var sMarca:String?
    var iFabricacion:Int?
    var bdLon:Double?
    var bdLat:Double?
    var sRutaImagenP:String?
    
    init (valores:[String:AnyObject]){
        sNombre=valores["Nombre"] as?   String
        sMarca=valores["Marca"] as? String
        iFabricacion=valores["Fabricados"] as? Int
        bdLat=valores["lat"] as? Double
        bdLon=valores["lon"] as? Double
        sRutaImagenP=valores["RutaImagenP"] as? String
        
    }
}
