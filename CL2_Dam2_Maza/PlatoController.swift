//
//  PlatoController.swift
//  CL2_Dam2_Maza
//
//  Created by Maribel on 13/10/23.
//

import UIKit
import CoreData

class PlatoController: NSObject {
    
    // REGISTRAR Plato
    func addPlato(bean:Plato){
        // 1. Crear objeto de clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate //accedemos al archivo appdelegate , lo casteamos
        // 2. Accedemos a  la bd
        let contextoBD=delegate.persistentContainer.viewContext  //viewcontext da el acceso
        // 3. Indicar con que entidad(tabla) vamos a trabajar
        let table=PlatoEntity(context: contextoBD)
        // 4. Asignar valores a los atributos del objeto "table" con
        // los atributos del parametro bean
        table.codigo = Int16(bean.codigo);  //lo castemos porque en el bean es Int, pero en la entity es Int 16
        table.descripcion = bean.descripcion;
        table.precio = bean.precio;
        table.stock = Int16(bean.stock);
        table.chef = bean.chef;
        
        // 5.  Grabar (con excepcion try-catch)
        do{
           // guardamos en el contexto
          try contextoBD.save()
            
        } catch(let error as NSError){
            //para saber donde esta fallando
            print(error.localizedDescription);
        }
    }
    
    //LISTAR PLATOS
    func listPlato()->[PlatoEntity]{
        // 1. Crear objeto de clase AppDelegate
        let delegate=UIApplication.shared.delegate as! AppDelegate //accedemos al archivo appdelegate , lo casteamos
        // 2. Accedemos a  la bd
        let contextoBD=delegate.persistentContainer.viewContext  //viewcontext da el acceso
        // 3.  declara un arreglo de la entidad PlatoEntity
        // []! -ª arreglo que esta declarado pero no va estar inicializado, sino cuando se ejecute un preceso
        var resultado:[PlatoEntity]!
        do{
            // 4. obtener lista de la entidad ClienteEntity en tipo NSFetchRequest
            let datos=PlatoEntity.fetchRequest()  //es como un select y le pasa a datos
            //datos es un objeto NSFetchREquest por eso
            // 5. Convertimos datos en un arreglo de PlatoEntity
            resultado=try contextoBD.fetch(datos)
        }
        catch let error as NSError{
            print(error.localizedDescription)
        }
        return resultado
    }
    
    //ELIMINAR PLATO
    func deletePlato(bean: PlatoEntity){
        let delegate = UIApplication.shared.delegate as! AppDelegate;
             let contextoBD = delegate.persistentContainer.viewContext;
             // Eliminar
             do{
                 contextoBD.delete(bean);
                 //grabar eliminar
                 try contextoBD.save();
             } catch(let error as NSError){
                 print(error.localizedDescription);
             }
       }
     
    // validacion
    func platoExists(withCodigo codigo: Int) -> Bool {
        let delegate = UIApplication.shared.delegate as! AppDelegate;
        let contextoBD = delegate.persistentContainer.viewContext;

         let fetchRequest: NSFetchRequest<PlatoEntity> = PlatoEntity.fetchRequest()
         fetchRequest.predicate = NSPredicate(format: "codigo == %d", codigo)

         do {
             let count = try contextoBD.count(for: fetchRequest)
             return count > 0
         } catch {
             print("Error al ingresar codigo: \(error.localizedDescription)")
             return false
         }
     }
}
