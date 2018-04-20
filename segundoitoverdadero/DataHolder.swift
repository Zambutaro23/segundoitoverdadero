//
//  DataHolder.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 18/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import Firebase
import QuickLook
class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder=DataHolder()
    var numeroCeldasColeccion:UInt=20;
    var locationAdmin:LocationAdmin?
    
    func initFireBase(){
        FirebaseApp.configure()
    }
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    
    func nombreDeCelda(numero:Int)->NSString {
        if(numero==0){
            return"Yony"
            
        }
        else if(numero==1){
            return"Javi"
            
        }
        else if(numero==2){
            return"Sergio"
            
        }
        else if(numero==3){
            return"Sebas"
          
        }
        else if(numero==4){
            return"Isak"
           
        }
        else if(numero==5){
            return "Ismael"
           
        }
        
        return ""
    }


}
