//
//  Cyty.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 10/5/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit




class Cyty: NSObject {
    
    let IDNAME = "name"
    let IDCAPITAL = "capital"
    let IDCONTRY = "contry"
    let IDPOPULATION = "population"
    let IDSTATE = "state"
    
    
    var bCapital:Bool?
    var sName:String?
    var sContry:String?
    var iPopulation:Int?
    var sState:String?
    
    func setMap(valores:[String:Any]) {
        
        sName = valores[IDNAME] as? String
        bCapital = valores[IDCAPITAL] as? Bool
        sContry = valores[IDCONTRY] as? String
        iPopulation = valores[IDPOPULATION] as? Int
        sState = valores[IDSTATE] as? String
        
       
        
        
        
        print("Nombre de tu perfil:",bCapital ?? <#default value#>)
        print("Nombre de tu perfil:",sName)
        print("Nombre de tu perfil:",sContry ?? <#default value#>! as Any)
        print("Nombre de tu perfil:",iPopulation ?? <#default value#>)
        print("Nombre de tu perfil:",sState ?? <#default value#>)
        
        
        
        func getMap() -> [String:Any] {
            return[
                "IDCAPITAL":bCapital as Any,
                "IDNAME":sName as Any,
                "IDCONTRY": sContry as Any,
                "IDPOPULATION": iPopulation as Any,
                "IDSTATE": sState as Any]
          
            
      
            
        
        
        
    }
    
    
    
}
}
