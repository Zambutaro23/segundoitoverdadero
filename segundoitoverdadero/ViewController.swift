//
//  ViewController.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 13/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {
    
    
    @IBOutlet var txtfUsuario:NuevoTexFild?
    @IBOutlet var txtfPass:NuevoTexFild?
    @IBOutlet var txtAConsola:UITextView?
    @IBOutlet var txtfEmail:UITextView?
    @IBOutlet var uiswitchRecordar:UISwitch?
    
   //ddddddd
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //DataHolder.sharedInstance.numeroCeldasColeccion
        
        txtfUsuario?.text=DataHolder.sharedInstance.sUsuario
        txtfPass?.text=DataHolder.sharedInstance.sPassword
        
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
        Auth.auth().signIn(withEmail: (txtfEmail?.text)!,password: (txtfPass?.text)!){ (user,error) in
            if(error==nil){
                if(self.uiswitchRecordar?.isOn)!{
                    DataHolder.sharedInstance.sUsuario = self.txtfEmail?.text
                    DataHolder.sharedInstance.sPassword = self.txtfPass?.text
                    DataHolder.sharedInstance.saveData ()
                }
                self.performSegue(withIdentifier: "trregistro", sender: self)
            }else{
                print("ERROR EN REGISTRO",error!)
            }
            
            
        }         }
     }

