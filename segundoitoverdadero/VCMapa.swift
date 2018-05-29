//
//  VCMapa.swift
//  segundoitoverdadero
//
//  Created by JAVIER SÁNCHEZ RODRIGUEZ on 20/4/18.
//  Copyright © 2018 JAVIER SÁNCHEZ RODRIGUEZ. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase
import CoreLocation

class VCMapa: UIViewController,MKMapViewDelegate{

    
    @IBOutlet var MiMapa:MKMapView?
    var pines:[String:MKAnnotation]? = [:]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        MiMapa?.showsUserLocation=true
        
        if DataHolder.sharedInstance.arCoches.count == 0 {
            DataHolder.sharedInstance.fireStoreDB?.collection("Coches").addSnapshotListener{(querySnapshot,err) in
                if let err = err {
                    print ("Error getting documents: \(err)")
                }else {
                    DataHolder.sharedInstance.arCoches=[]
                    for document in querySnapshot!.documents {
                        
                        let coche:Coche=Coche (valores: document.data())
                        
                        //coche.setMap(Valores: document.data())
                        DataHolder.sharedInstance.arCoches.append(coche)
                        
                        var coordTemp: CLLocationCoordinate2D = CLLocationCoordinate2D()
                        coordTemp.latitude = coche.bdLat!
                        coordTemp.longitude = coche.bdLon!
                        self.agregarPin(coordenada: coordTemp, titulo: coche.sNombre!)
  
                    }
                    print("------>>>> ",DataHolder.sharedInstance.arCoches.count)
                    
                    //self.tbMiTableView?.reloadData()//(ORIGINAL EN EL VIDEO DE YONY (self.miTabla?.reloadData()  )
                    
                }
                
                
            }
        }
        
        else{
            for coche in DataHolder.sharedInstance.arCoches{
                var coordTemp: CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = coche.bdLat!
                coordTemp.longitude = coche.bdLon!
                self.agregarPin(coordenada: coordTemp, titulo: coche.sNombre!)
            }
        }
       
       // MiMapa?.delegate=self
        
        // Do any additional setup after loading the view.
        
        
        //Esta es la parte que tenemos que comenzar a emplear en base de datos.
        
        /*var coordTemp: CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.4165000
        coordTemp.longitude = -3.7025600
        agregarPin(coordenada: coordTemp, titulo:"PIN1")*/
        
    
        
        
            
    //};)
    

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String){
        var annotation:MKPointAnnotation = MKPointAnnotation()
        
        if(pines?[varTitulo] == nil){
            
        }
        else{
            annotation = pines? [varTitulo]as!MKPointAnnotation
            MiMapa?.removeAnnotation(annotation)
            
            
        }
        
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        pines?[varTitulo]=annotation
        MiMapa?.addAnnotation(annotation)
        
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D){
        
        
        let region:MKCoordinateRegion=MKCoordinateRegion(center:coordenada,span:MKCoordinateSpan(latitudeDelta:0.01,longitudeDelta:0.01))
        self.MiMapa?.setRegion(region, animated: true)
    }
    
    
    func mapView(_mapView: MKMapView,dibujate userLocation: MKUserLocation){
        centralizarEnPosicion(coordenada: userLocation.coordinate)
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
