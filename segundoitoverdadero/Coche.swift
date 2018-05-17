//
//  Coche.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 3/5/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import CoreData

class Coche: NSObject {
    
    
    let NOMBRE = "Nombre"
    let MARCA = "Marca"
    let FABRICADO = "Fabricados"
    let LONGITUD = "lat"
    let LATITUD = "lon"
    let IMAGEN = "RutaImagenP"
    let MODELO = "modelo"
    
    var sNombre:String?
    var sMarca:String?
    var iFabricacion:Int?
    var bdLon:Double?
    var bdLat:Double?
    var surl_Imagen:String?
    var modelo:String?
    
   
    
    func setCoche(valores:[String:Any]) {
        
        sNombre=valores["Nombre"] as?   String
        sMarca=valores["Marca"] as? String
        iFabricacion=valores["Fabricados"] as? Int
        bdLat=valores["lat"] as? Double
        bdLon=valores["lon"] as? Double
        surl_Imagen=valores["RutaImagenP"] as? String
        modelo=valores["modelo"] as? String
        //
        if surl_Imagen == nil{
            surl_Imagen = "gs//primer-proyecto-33c88.appspot.com/coches/Fisker-EMotion.jpg"
        }
        
        
        print("Nombre de tu :",sNombre ?? <#default value#>)
        print("Nombre de tu :",sMarca)
        print("Nombre de tu :", iFabricacion ?? <#default value#>! as Any)
        print("Nombre de tu :", bdLon ?? <#default value#>)
        print("Nombre de tu :",bdLat, <#default value#>)
        print("Nombre de tu :",surl_Imagen, <#default value#>)
         print("Nombre de tu :",modelo, <#default value#>)
        
        func getCoche() -> [String:Any] {
            return[
                "NOMBRE":sNombre as Any,
                "MARCA":sMarca as Any,
                "FABRICADO": iFabricacion as Any,
                "LONGITUD": bdLon as Any,
                "LATITUD": bdLat as Any,
                "IMAGEN": surl_Imagen as Any,
                "MODELO": modelo as Any]
            
            
            
            
            
        }
        
        
        
    }
}
    
    
/*
    var sNombre:String?
    var sMarca:String?
    var iFabricacion:Int?
    var bdLon:Double?
    var bdLat:Double?
    var surl_Imagen:String?
    var modelo:String?
    
    //inventado por mi
    func setCoche(valores: Any){
       //e
    }
    
    init (valores:[String:AnyObject]){
        sNombre=valores["Nombre"] as?   String
        sMarca=valores["Marca"] as? String
        iFabricacion=valores["Fabricados"] as? Int
        bdLat=valores["lat"] as? Double
        bdLon=valores["lon"] as? Double
        surl_Imagen=valores["RutaImagenP"] as? String
        modelo=valores["modelo"] as? String
        
        
        
        }*/
}
