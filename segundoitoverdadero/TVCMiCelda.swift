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
    //COMO LO TENGO EN LA BASE DE DATOS MI PRIMER PROYECTO.
    @IBOutlet var lblEncabezado:UILabel?
    @IBOutlet var lblModeloPrincipal: UILabel?
    @IBOutlet var lblResumenPrincipal: UILabel?
    @IBOutlet var lbllatitudIPrincipal: UILabel?
    @IBOutlet var lbllongitudeIPrincipal: UILabel?
    @IBOutlet var lblTituloPrincipal: UILabel?
    @IBOutlet var imgvIPrincipal: UIImageView?
    
    
    var imagenDescarga:UIImage?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        func mostrarImagen(uri:String){
            self.imgvIPrincipal?.image = nil
            
            //if imagenDescarga == nil {
                
            
            let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        //func descargarImagen(ruta:String){
          //  self.imgvIPrincipal?.image=nil
            gsReference?.getData (maxSize: 1 * 1024 * 1024){ data,error in
                if let error = error {
                    
                }else{
                    //let image = UIImage(data: data!)
                    self.imagenDescarga = UIImage (data: data!)
                    self.imgvIPrincipal?.image = self.imagenDescarga
            }
            
        }
        
        
    }

}
