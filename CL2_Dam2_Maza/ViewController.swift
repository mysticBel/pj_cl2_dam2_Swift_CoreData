//
//  ViewController.swift
//  CL2_Dam2_Maza
//
//  Created by Maribel on 13/10/23.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{


    //arreglo de estructura
    var listaPlatos:[PlatoEntity]=[]
    //
    var posPlato = -1 //para el tableView
    let refreshControl = UIRefreshControl();
    
    @IBOutlet weak var tvPlatos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // llenamos arreglo : core data
        listaPlatos=PlatoController().listPlato()
               
        //indicamos que la tabla trabaja con origen de datos (self es como this)
        tvPlatos.dataSource = self
        tvPlatos.delegate = self
               
        tvPlatos.rowHeight = 120
        // RefreshControl
               refreshControl.addTarget(self, action: #selector(reloadDatos(_:)), for: .valueChanged)
               tvPlatos.refreshControl = refreshControl
    }


    @IBAction func btnNuevoPlato(_ sender: UIButton) {
        performSegue(withIdentifier: "nuevoPlato", sender: self)
    }
    
    
    @IBAction func btnRefresh(_ sender: UIButton) {
        reloadDatos(sender)
    }
    
    
    // metodos del delegate UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPlatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // acceder al identificador "celda" (TableViewCell)
        // y haremos un casteo
        let vista = tvPlatos.dequeueReusableCell(withIdentifier: "celda") as! ItemTableViewCell
               
        //acceder a los atributos
        vista.lblDescripcion.text =  listaPlatos[indexPath.row].descripcion
        vista.lblPrecio.text =  String(listaPlatos[indexPath.row].precio)
       
        return vista
    }
    
    
    /*navigation segue**/
    // metodo de UITableViewDelegate
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          posPlato=indexPath.row
          //llamar al segue "detalle"
          performSegue(withIdentifier: "detalle", sender: self)
      }
      
      //metodo para enviar datos a la otra pantalla (prepare)
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          //(VALIDAR segue)
          if segue.identifier=="detalle" {
              // Creamos objeto de la clase DetalleViewController
              let destino=segue.destination as! DetalleViewController
              destino.bean=listaPlatos[posPlato]
          }
         
      }
    

    @objc func reloadDatos(_ sender: Any) {
           // Recargamos los datos desde Core Data
           listaPlatos = PlatoController().listPlato()
           
           // Recargamos la tabla
           tvPlatos.reloadData()
           
           // Detenemos la animación de actualización
           refreshControl.endRefreshing()
       }
}

