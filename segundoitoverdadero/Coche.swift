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
    
    var sEncabezados:String?
    var sModelo:String?
    var sResumen:String?
    var bdLon:Double?
    var bdLat:Double?
    var surl_Imagen:String?
    var sTitulo:String?
    
    override init() {
        super.init()
        sEncabezados=""
        sModelo=""
        sResumen=""
        bdLat=0
        bdLon=0
        surl_Imagen=""
        sTitulo=""
    }
    
    init(valores:[String:Any]) {
        sEncabezados=valores["ENCABEZADO"] as?   String
        sResumen=valores["INTERNACIONAL"] as? String
        sTitulo=valores["TITULO"] as? String
        bdLat=valores["lat"] as? Double
        bdLon=valores["lon"] as? Double
        sTitulo=valores["TITULO"] as? String
    }
    
    func getDiccionary()-> [String:AnyObject]{
        var hm:[String:AnyObject]=[:]
        hm["Nombre"]=sEncabezados! as AnyObject
        hm["Marca"]=sModelo! as AnyObject
        hm["Fabricados"]=sResumen! as AnyObject
        hm["lat"]=bdLat! as AnyObject
        hm["lon"]=bdLon! as AnyObject
        hm["RutaImagenP"]=sTitulo! as AnyObject
       
        
        return hm;
    }
    
    func setCoche(valores:[String:Any]) {
        
        sEncabezados=valores["ENCABEZADO"] as?   String
        sResumen=valores["INTERNACIONAL"] as? String
        sTitulo=valores["sTitulo"] as? String
        bdLat=valores["lat"] as? Double
        bdLon=valores["lon"] as? Double
        
        //
        if surl_Imagen == nil{
            surl_Imagen = "gs//primer-proyecto-33c88.appspot.com/coches/Fisker-EMotion.jpg"
        }
 
        
    }
    
    func getCoche() -> [String:Any] {
        return[
            "NOMBRE":sEncabezados as Any,
            "MARCA":sResumen as Any,
            "FABRICADO": sTitulo as Any,
            "LONGITUD": bdLon as Any,
            "LATITUD": bdLat as Any,
            "IMAGEN": surl_Imagen as Any,
            "MODELO": sTitulo as Any]
        
        
        
        
        
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

