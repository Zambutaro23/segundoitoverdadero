//
//  ViewController.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 13/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController, DataHolderDelegate {
    
    
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfPass:UITextField?
    @IBOutlet var txtAConsola:UITextView?
    @IBOutlet var uiswitchRecordar:UISwitch?
    
   //ddddddd
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //DataHolder.sharedInstance.numeroCeldasColeccion
        
       DataHolder.sharedInstance.miperfil.sEmail=txtfUsuario?.text
       
        
        //if (DataHolder.sharedInstance.sPassword?.isEmpty)!{
           // accionBotonLogear()
        //}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        self.hideKeyBoardWhenTappedAround()
        // Dispose of any resources that can be recreated.
    }
    
    /*func logearse(){
        //..........................................CREO QUE NO ES NECESARIO PERO PREGUNTO A YONY..........................................................................AYUDA
        Auth.auth().singIn(withEmail: (txtfUsuario?.text))!;, password: (txtfPass?.text)!) { (user, error) in
            
            if (error==nil){
            
            if(self.uiswitchRecordar?.isOn)!{
                 DataHolder.sharedInstance.sUsuario = self.textfUsuario?.text
                DataHolder.sharedInstance.sPassword = self.txtfPass?.text
                DataHolder.sharedInstance.saveData()
            }
                self.performSegue(withIdentifier: "train1", sender: self)
        }
            else{
                print("ERROR EN REGISTRO;:",error)
            }
        }
    }
    */
    
    
    
    
    @IBAction func accionBotonLogear(){
        Auth.auth().signIn(withEmail: (txtfUsuario?.text)!, password: (txtfPass?.text)!){ (user, error) in
            if(user != nil){
                
                let refPerfil=DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!)
                refPerfil?.getDocument{(document , error) in
                    if (document != nil){
                        //DataHolder.sharedInstance.miperfil.setMap(valores: (document?.data())!)
                        self.performSegue(withIdentifier: "trlogin", sender: self)
                    }
                }
                if(self.uiswitchRecordar?.isOn)!{
                    DataHolder.sharedInstance.sUsuario = self.txtfUsuario?.text
                    DataHolder.sharedInstance.sPassword = self.txtfPass?.text
                    DataHolder.sharedInstance.saveData ()
                }
                
            }else{
                print("ERROR EN REGISTRO",error!)
            }
            
            
        }         }
     }

