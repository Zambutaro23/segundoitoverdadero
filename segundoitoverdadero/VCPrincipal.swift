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

//ayuda..........................................................................................................................................
class VCPrincipal: UIViewController,UITableViewDelegate,UITableViewDataSource,DataHolderDelegate{
    

   

    
    @IBOutlet var tbMiTableView:UITableView?
    var arCochei: [Coche] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
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
        */
           
                // let postDict = snapshot.value as? [String:AnyObject]??[:]
                
        DataHolder.sharedInstance.fireStoreDB?.collection("Coches").addSnapshotListener{(querySnapshot,err) in
            if let err = err {
                print ("Error getting documents: \(err)")
            }else {
                self.arCochei=[]
                for document in querySnapshot!.documents {
                    
                    let coche:Coche=Coche (valores: document.data())
                  
                    //coche.setMap(Valores: document.data())
                    self.arCochei.append(coche)
                    
                    
                    
                    
                }
                print("------>>>> ",self.arCochei.count)
                
                //self.refreshUI().......................................................................................ayudA DEL MAESTRO.
               //self.tbMiTableView?.reloadData()//(ORIGINAL EN EL VIDEO DE YONY (self.miTabla?.reloadData()  )
                
            }
            
            
        }

        // Do any additional setup after loading the view.
    }
    
    func dataHolderPruebaDataHolder(status: Int) {
        print("*----->>>>>*",status)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("SSOO CONSULTA CANTIDAD DE FILAS PARA PINTAR ", self.arCochei.count)
        return self.arCochei.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell:TVCMiCelda=tableView.dequeueReusableCell(withIdentifier: "micelda1") as!TVCMiCelda
        
        //let cochei:Coche=DataHolder.sharedInstance.arCoches![indexPath.row]
        //cell.lblNombre?.text=cochei.sNombre
        let celda = tableView.dequeueReusableCell(withIdentifier:"tvcmicelda") as!TVCMiCelda
        celda.lblNombre?.text = self.arCochei[indexPath.row].sNombre
        celda.lblPais?.text = self.arCochei[indexPath.row].sMarca
        //celda.mostrarImagen(uri: self.arcoches[indexPath.row].surl_Imagen!).................................................Ayuda
        
        /*
        cell.lblNombre?.text="Yony"
        if(indexPath.row==0){
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
        let coche = Coche()
        let pos = DataHolder.sharedInstance.arCoches?.count
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("He deseleccionado la posicion:",indexPath.row);
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    }
    func refreshUI() {
        DispatchQueue.main.async(execute: {
        //self.miTabla?.reloadData()// preguntar a Yony.......................................................................................................................Ayuda
        })
    }
    


