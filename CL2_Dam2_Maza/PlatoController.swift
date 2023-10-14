//
//  PlatoController.swift
//  CL2_Dam2_Maza
//
//  Created by Maribel on 13/10/23.
//

import UIKit

class PlatoController: NSObject {
    // REGISTRAR Plato
    func addCliente(bean:Cliente){
        // 1. Crear objeto de clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate //accedemos al archivo appdelegate , lo casteamos
        // 2. Accedemos a  la bd
        let contextoBD=delegate.persistentContainer.viewContext  //viewcontext da el acceso
        // 3. Indicar con que entidad(tabla) vamos a trabajar
        let table=ClienteEntity(context: contextoBD)
        // 4. Asignar valores a los atributos del objeto "table" con
        // los atributos del parametro bean
        table.codigo = Int16(bean.codigo);  //lo castemos porque en el bean es Int, pero en la entity es Int 16
        table.nombre = bean.nombre;
        table.apellido = bean.apellido;
        table.edad = Int16(bean.edad);
        table.sueldo = bean.sueldo;
        
        // 5.  Grabar (con excepcion try-catch)
        do{
           // guardamos en el contexto
          try contextoBD.save()
            
        } catch(let error as NSError){
            //para saber donde esta fallando
            print(error.localizedDescription);
        }
    }
    
    //LISTAR CLIENTES
    func listCliente()->[ClienteEntity]{
        // 1. Crear objeto de clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate //accedemos al archivo appdelegate , lo casteamos
        // 2. Accedemos a  la bd
        let contextoBD=delegate.persistentContainer.viewContext  //viewcontext da el acceso
        // 3.  declara un arreglo de la entidad ClienteEntity
        // []! -ª arreglo que esta declarado pero no va estar inicializado, sino cuando se ejecute un preceso
        var resultado:[ClienteEntity]!
        do{
            // 4. obtener lista de la entidad ClienteEntity en tipo NSFetchRequest
            let datos=ClienteEntity.fetchRequest()  //es como un select y le pasa a datos
            //datos es un objeto NSFetchREquest por eso
            // 5. Convertimos datos en un arreglo de ClienteEntity
            resultado=try contextoBD.fetch(datos)
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        return resultado
    }
}
