//
//  VCPrincipal.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 17/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class VCPrincipal: UIViewController,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    
   
    
    
    @IBOutlet var tbMiTableView:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataHolder.sharedInstance.firDataBaseRef.child("Coches").observe(DataEventType.value,with:{ (snapshot) in
            let arTemp=snapshot.value as? Array<AnyObject>
            //if (DataHolder.sharedInstance.arCoches==nil){
               DataHolder.sharedInstance.arCoches=Array<Coche>()
           // }
            for co in arTemp!as [AnyObject]{
                let cochei=Coche(valores:co as![String:AnyObject])
                DataHolder.sharedInstance.arCoches?.append(cochei)
            }
            self.tbMiTableView?.reloadData()
            //let coche0=Coche(valores: arTemp?[0] as![String : AnyObject])
            
            //let coche0=arTemp?[0] as? [String:AnyObject]
                //print("EL COCHE EN LA POSICION 0 ES: ", DataHolder.sharedInstance.arCoches)
            
        })
        
           
                // let postDict = snapshot.value as? [String:AnyObject]??[:]
                
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(DataHolder.sharedInstance.arCoches==nil){
            return 0
            
        }
        
        else{
        return (DataHolder.sharedInstance.arCoches?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
        let cell:TVCMiCelda=tableView.dequeueReusableCell(withIdentifier: "micelda1") as!TVCMiCelda
        
        let cochei:Coche=DataHolder.sharedInstance.arCoches![indexPath.row]
        cell.lblNombre?.text=cochei.sNombre
        
        
        
        
       // cell.lblNombre?.text="Yony"
        /*if(indexPath.row==0){
            cell.lblNombre?.text="Yony"
        }
        else if(indexPath.row==1){
            cell.lblNombre?.text="Javi"
        }
        else if(indexPath.row==2){
            cell.lblNombre?.text="Sergio"
        }
        else if(indexPath.row==3){
            cell.lblNombre?.text="Sebas"
        }
        else if(indexPath.row==4){
            cell.lblNombre?.text="Isak"
        }
             else if(indexPath.row==5){
                cell.lblNombre?.text="Ismael"
        }*/
        return cell;
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        print("He selecionado la posicción: %d",indexPath.row);
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("He deseleccionado la posicion:",indexPath.row);
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
