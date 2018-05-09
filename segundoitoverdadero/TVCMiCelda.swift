//
//  TVCMiCelda.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 17/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import FirebaseStorage

class TVCMiCelda: UITableViewCell {
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgvIPrincipal: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        func descargarImagen(ruta:String){
            self.imgvIPrincipal?.image=nil
            let islandRef = DataHolder.sharedInstance.firDataBaseRef?.child(ruta)
            islandRef?.data(withMaxSize: 1 * 1024 * 1024){
                data,error in
                if error != nil {
                    
                }
            }
            
        }
        
        
    }

}
