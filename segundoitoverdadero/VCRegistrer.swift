//
//  VCRegistrer.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 17/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegistrer: UIViewController {
    
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    

    override func viewDidLoad() {

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func acccionBotonRegistrar(){
        DataHolder.sharedInstance.miperfil.sNombre = "Yony"
        DataHolder.sharedInstance.miperfil.sApellido = "BM"
        DataHolder.sharedInstance.miperfil.iFecha = 1600
        DataHolder.sharedInstance.miperfil.iAltura = 184
        
        Auth.auth().createUser(withEmail: (txtEmail?.text)!, password: (txtPass?.text)!) { (user, error) in
            if(error == nil){
                //self.performSegue(withIdentifier: "trregistro", sender: self)
                DataHolder.sharedInstance.fireStoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miperfil.getMap())
                self.performSegue(withIdentifier: "trtegistro", sender: self)
                
            }
            else{
                print("ERROR EN REGISTRO",error!)
            }
        }
       
        
    }         
        
}
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    

