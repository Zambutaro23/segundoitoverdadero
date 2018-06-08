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
    

    var sModelo:String?
    var sEncabezado:String?
    var sResumen:String?
    var sTitulo:String?
    
    
    @IBOutlet var tbMiTableView:UITableView?
    //var arCochei: [Coche] = []
    
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
                DataHolder.sharedInstance.arCoches=[]
                for document in querySnapshot!.documents {
                    
                    let coche:Coche=Coche (valores: document.data())
                  
                    //coche.setMap(Valores: document.data())
                    DataHolder.sharedInstance.arCoches.append(coche)
                    
                    
                    
                    
                }
                print("------>>>> ",DataHolder.sharedInstance.arCoches.count)
                
                self.refreshUI()
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
        print("SSOO CONSULTA CANTIDAD DE FILAS PARA PINTAR ", DataHolder.sharedInstance.arCoches.count)
        return DataHolder.sharedInstance.arCoches.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell:TVCMiCelda=tableView.dequeueReusableCell(withIdentifier: "micelda1") as!TVCMiCelda
        
        //let cochei:Coche=DataHolder.sharedInstance.arCoches![indexPath.row]
        //cell.lblNombre?.text=cochei.sNombre
        let celda = tableView.dequeueReusableCell(withIdentifier:"micelda1") as!TVCMiCelda
        celda.lblEncabezado?.text = DataHolder.sharedInstance.arCoches[indexPath.row].sEncabezados
        celda.lblModeloPrincipal?.text = DataHolder.sharedInstance.arCoches[indexPath.row].sModelo
        celda.lblResumenPrincipal?.text = DataHolder.sharedInstance.arCoches[indexPath.row].sResumen
        celda.lblTituloPrincipal?.text = DataHolder.sharedInstance.arCoches[indexPath.row].sTitulo

        return celda
    }
   
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath){
        print("He selecionado la posicción: %d",indexPath.row);
        let posf = DataHolder.sharedInstance.arCoches.count
        let co = Coche()
        co.sEncabezados=String(format: "Coche numero%d",posf)
        DataHolder.sharedInstance.insertarCoche(coche: co, posicion: posf)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("He deseleccionado la posicion:",indexPath.row);
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
    }
    func refreshUI() {
        DispatchQueue.main.async(execute: {
        self.tbMiTableView?.reloadData()// preguntar a Yony.......................................................................................................................Ayuda
        })
    }
    

}
