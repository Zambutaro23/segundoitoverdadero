//
//  NuevoTexFild.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 17/5/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit

class NuevoTexFild: UITextField,UITextFieldDelegate {

    
    
    
    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
        
        delegate=self
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        self.resignFirstResponder()
        
        return false
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
