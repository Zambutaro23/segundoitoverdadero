//
//  DataHolder.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 18/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import Firebase
//import QuickLook
import FirebaseDatabase
import FirebaseStorage

class DataHolder: NSObject {
    
    static let sharedInstance:DataHolder=DataHolder()
    var numeroCeldasColeccion:UInt=20;
    var locationAdmin:LocationAdmin?
    var firDataBaseRef:DatabaseReference!
    var fireStoreDB:Firestore?
    var sNick:String="Yony"
    var miperfil:miPerfil = miPerfil()
    var arCoches:Array<Coche>?
    var firStorage:Storage?
    var firStorageRef:StorageReference?
    var hmImagenDescargadas:[String:UIImage]?=[:]
    var sUsuario:String?
    var sPassword:String?
    
 
    
    
    //var delegate:DataHolderDelegate?
    
    //Esto es de la clase para el tercer ito.
    
    
    
    func initFireBase(){
        FirebaseApp.configure()//me quede en este paso.
        firDataBaseRef=Database.database().reference().child("SwiftTutorial")
        firStorage = Storage.storage()
        fireStoreDB = Firestore.firestore()
        firStorageRef = firStorage?.reference()
        firStorage = Storage.storage()
        
        
        
    }
    
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    
    
    
    func loadData() {
        let props = UserDefaults.standard
        sUsuario = props.string(forKey: "usuario_login")
        sPassword = props.string(forKey: "usuario_login")
    }
    func saveData(){
        let props = UserDefaults.standard
        props.setValue(sUsuario, forKey: "usuario_login")
        props.setValue(sPassword, forKey: "usuario_login")
        props.synchronize()
    }
    
    
    
    func insertarCoche(coche:Coche,posicion post:Int) {
    
        let rutaTemp = String(format: "/Coches/%d",post )
        let childUpdates = [rutaTemp:Coche.getDiccionary()]
        firDataBaseRef.updateChildValues(childUpdates)
    
    }
    
    
    
    
    
    func statusDataholder(delegate:DataHolderDelegate){
        var i = 0
        while i<10000000 {
            i += 1
        }
        delegate.dataHolderPruebaDataHolder!(status: 0)
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
extension UIViewController {
    
    func hideKeyBoardWhenTappedAround(){
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
}


@objc protocol DataHolderDelegate{
    @objc optional func dataHolderImagenDescargada(imagen:UIImage)
    @objc optional func dataHolderPruebaDataHolder(status:Int)

}

