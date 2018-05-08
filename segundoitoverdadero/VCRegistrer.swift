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
        print("Hey que tal!!")+(txtUser?.tex)!;)
        Auth.auth().signIn(whithEmail: (texUser?.text))!,password: textPass?.text) { (user,error) in if user document != nil{
            
            }
            
        
        
        
            
            if(error==nil){
                //self.performSegue(withIdentifier: "trregistro", sender: self)
                
            }else{
                print("ERROR EN REGISTRO",error!)
            }
                
            
        }
        
        self.performSegue(withIdentifier: "trtegistro", sender: self)
        
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

    

