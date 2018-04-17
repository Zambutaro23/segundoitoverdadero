//
//  ViewController.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 13/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var btnLogear:UIButton?
    @IBOutlet var txtfUsuario:UITextField?
    @IBOutlet var txtfPass:UITextField?
    @IBOutlet var txtAConsola:UITextView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func accionBotonLogear(){

}
    @IBAction func acccionBotonLogear(){
        //txtAConsola?.text="AUTOMATIZANDO EL MUNDO"
        //txtAConsola?.text=String(format:"hola usuario:%@ pasword: %@",(txtfUsuario?.text)!,
                                  //(txtfPass?.text)!)
        
        self.performSegue(withIdentifier: "tran1",sender: self)
        
        if txtfUsuario?.text=="yo" && txtfPass?.text=="12345" {
            self.performSegue(withIdentifier: "tran1",sender: self)
        }
        else{
            txtAConsola?.text=String(format:"hola usuario:%@ pasword: %@",(txtfUsuario?.text)!,(txtfPass?.text)!)
            
            
        }
}
}
