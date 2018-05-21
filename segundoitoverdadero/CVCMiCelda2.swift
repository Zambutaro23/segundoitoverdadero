//
//  CVCMiCelda2.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 18/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import FirebaseStorage

class CVCMiCelda2: UICollectionViewCell {
    
    
    
     @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgMain:UIImageView?


    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //Intializacion code
    }
    func descargarImagen(ruta:String){
    //Create a referencia to the file you want to dowload
        let islandRef = DataHolder.sharedInstance.firStorageRef?.child(ruta)
    
    
        islandRef?.getData(maxSize:1*1024*1024){ data,error in
          
                let image=UIImage(data:data!)
                //self.image=image
        
          
    
        }
    }

    
}
