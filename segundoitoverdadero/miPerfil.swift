//
//  miPerfil.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 24/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import Firebase

class miPerfil: NSObject {
    
    var sEmail:String?
    var ifPass:Int?
    var sNombre:String?
    var sApellido:String?
    var iAltura: Int?
    var iFecha:Int?
    
    
    func setMap(valores:[String:Any]){
        sNombre = valores["nombre"]as? String
        sApellido = valores["nacimiento"]as? String
        iFecha = valores["altura"]as? Int
        iAltura = valores["altura"] as? Int
        
        print(sNombre)
        
        }
    
    
    func getMap() -> [String:Any] {
        return[
            "nombre":sNombre as Any,
            "apellido":sApellido as Any,
            "nacimiento": iFecha as Any,
            "altura": iAltura as Any
        
        
        
        
        
        ]
        
    }
    
    
}
