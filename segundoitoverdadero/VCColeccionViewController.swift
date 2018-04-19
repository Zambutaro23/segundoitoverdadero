//
//  VCColeccionViewController.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 18/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit

class VCColeccionViewController:UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet var colPrincipal:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(DataHolder.sharedInstance.numeroCeldasColeccion);
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CVCMiCelda2=collectionView.dequeueReusableCell (withReuseIdentifier:"micelda2", for:indexPath) as!CVCMiCelda2
        cell.lblNombre?.text=DataHolder.sharedInstance.nombreDeCelda(numero: indexPath.row) as String
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
