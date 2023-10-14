//
//  NuevoPlatoViewController.swift
//  CL2_Dam2_Maza
//
//  Created by Maribel on 13/10/23.
//

import UIKit

class NuevoPlatoViewController: UIViewController {

    //var
    @IBOutlet weak var txtCodigo: UITextField!
    @IBOutlet weak var txtDescripcion: UITextField!
    @IBOutlet weak var txtPrecio: UITextField!
    @IBOutlet weak var txtStock: UITextField!
    @IBOutlet weak var txtChef: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    /*
    @IBAction func btnGrabar(_ sender: UIButton) {
        var cod, stock:Int
        var descrip, chef:String
        var precio:Double
        //nulos y enteros
        cod=Int(txtCodigo.text ?? "0") ?? 0
        stock=Int(txtStock.text ?? "0") ?? 0
        descrip=txtDescripcion.text ?? ""
        chef=txtChef.text ?? ""
        precio=Double(txtPrecio.text ?? "0") ?? 0
               
        //crear variable de la estructura Plato
        let data=Plato(codigo: cod, descripcion: descrip, precio: precio, stock:stock, chef: chef)
        //invocar al metodo addPlato)
               PlatoController().addPlato(bean: data)
               //
               print("Correcto")
    }*/
    
    @IBAction func btnGrabar(_ sender: UIButton) {
            guard let codigo = Int(txtCodigo.text ?? "0"),
                  let stock = Int(txtStock.text ?? "0"),
                  let descripcion = txtDescripcion.text,
                  let chef = txtChef.text,
                  let precio = Double(txtPrecio.text ?? "0")
            else {
                print("Valores no válidos")
                return
            }

            // Verificamos si el código ya existe en Core Data
            if PlatoController().platoExists(withCodigo: codigo) {
                // Mostramos una alerta si el código ya existe
                showAlert(message: "Código de Plato Ya existe!")
            } else {
                // variable de la struct Plato
                let data = Plato(codigo: codigo, descripcion: descripcion, precio: precio, stock: stock, chef: chef)
                // Invocamos al método addPlato
                PlatoController().addPlato(bean: data)
                print("Correcto")
            }
        }

        // alerta
        func showAlert(message: String) {
            let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true, completion: nil)
        }
    
}
