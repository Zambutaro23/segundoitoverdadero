//
//  VCSelectimg.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 18/5/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit

class VCSelectimg: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet var imgView:UIImageView?
let imagePicker = UIImagePickerController ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func accionBotonGaleria(){
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        self.present (imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func accioBotonCamara(){
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .camera
        
        self.present(imagePicker,animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
        imgView?.image = img
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
