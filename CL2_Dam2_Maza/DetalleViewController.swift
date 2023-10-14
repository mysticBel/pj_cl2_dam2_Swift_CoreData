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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
