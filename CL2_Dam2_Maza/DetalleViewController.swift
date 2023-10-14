//
//  DetalleViewController.swift
//  CL2_Dam2_Maza
//
//  Created by Maribel on 13/10/23.
//

import UIKit

class DetalleViewController: UIViewController {

    
    // var
    @IBOutlet weak var lblCodigo: UILabel!
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var lblStock: UILabel!
    @IBOutlet weak var lblChef: UILabel!
    
    //
    var bean:PlatoEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // impresion en los labels
        lblCodigo.text = String(bean.codigo)
        lblDescripcion.text = bean.descripcion
        lblPrecio.text = String(bean.precio)
        lblStock.text = String(bean.stock)
        lblChef.text = bean.chef
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
        // Crear ventana alerta "alert"
            let alert = UIAlertController(
            title: "SISTEMA",
            message: "Estas seguro de eliminar?",
            preferredStyle: .alert)
        // Boton Aceptar
            let buttonAcept = UIAlertAction(
            title: "Aceptar", style: .default,
            handler: {
                // accion de eliminar desde el controller
                action in PlatoController().deletePlato(bean: self.bean)
                           })
                           // Agregar accion a la alerta
                           alert.addAction(buttonAcept)
                       // Boton Cancelar y accion
                       let buttonCancel = UIAlertAction(
                          title: "Cancelar", style: .cancel)
                          // Agregar accion a la alerta
                          alert.addAction(buttonCancel)
                   // Mostrar la alerta
                   present(alert, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
