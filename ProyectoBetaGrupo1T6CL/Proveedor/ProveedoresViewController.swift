//
//  ProveedoresViewController.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by DAMII on 12/11/23.
//

import UIKit

import CoreData

struct Proveedor{
    var nombre: String
    var dni: Int
    var telefono: Int
    var email: String
    var producto: String    
}

class ProveedoresViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var proveedoresTableView: UITableView!
    
    var proveedoresList: [Proveedor] = []
    
    var proveedoresEntidadList: [ProveedorEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proveedoresTableView.dataSource =  self
        proveedoresTableView.delegate = self
        
        listarProveedores()
        
        /*
        proveedoresList.append(Proveedor(nombre: "Maria Manuel Rojas", dni: 43452523, telefono: 93456876, email: "JMR@gmail.com", producto: "Computadora"))
        
        proveedoresList.append(Proveedor(nombre: "Lorenzo Manuel Rojas", dni: 43452523	, telefono: 934567876, email: "JMR@gmail.com", producto: "Camas"))        // Do any additional setup after loading the view.
         
         
         registrarProveedor(nombre: "Maria Manuel Rojas", dni: "43452523", numero: "93456876", email: "JMR@gmail.com", producto: "Computadora")
         registrarProveedor(nombre: "Lorenzo Manuel Rojas", dni: "43452524", numero: "934567877", email: "LMR@gmail.com", producto: "Camas")
         
         */
    }
    
    
    @IBAction func abrirAlertaRegistro(_ sender: Any) {
        
        var nombreTextField = UITextField()
        var dniTextField = UITextField()
        var numeroTextField = UITextField()
        var emailTextField = UITextField()
        var productoTextField = UITextField()
        
        let alerta = UIAlertController(title: "Registrar Proveedor", message: "Completa todos los datos", preferredStyle: .alert)
    
    alerta.addTextField {
        alertTextField in alertTextField.placeholder = "Ingrese nombre"
        nombreTextField = alertTextField
    }
    alerta.addTextField {
        alertTextField in alertTextField.placeholder = "Ingrese DNI(8 digitos)"
        alertTextField.keyboardType = .numberPad
        dniTextField = alertTextField
    }
    alerta.addTextField {
        alertTextField in alertTextField.placeholder = "Ingrese telefono"
        alertTextField.keyboardType = .numberPad
        numeroTextField = alertTextField
    }
    alerta.addTextField {
        alertTextField in alertTextField.placeholder = "Ingrese correo"
        alertTextField.keyboardType = .emailAddress
        emailTextField = alertTextField
    }
    alerta.addTextField {
        alertTextField in alertTextField.placeholder = "Ingrese nombre producto"
        productoTextField = alertTextField
    }
    
    let action = UIAlertAction(title: "Registrar", style: .default, handler: {
        action in
        
        if nombreTextField.text != "", dniTextField.text != nil, numeroTextField.text != nil , emailTextField.text != "", productoTextField.text != "" {
            let nombre = nombreTextField.text
            let dni = dniTextField.text
            let telefono = numeroTextField.text
            let email = emailTextField.text
            let producto = productoTextField.text
            self.registrarProveedor(nombre: nombre, dni: dni, numero: telefono, email: email, producto: producto)
            
        } else {
            
            print("Error en el registro")
        }
                
    })
    alerta.addAction(action)
    alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
    present(alerta, animated: true, completion: nil)
}

    //Numero de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return proveedoresEntidadList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"proveedorCell", for: indexPath) as! proveedorTableViewCell
        
       // let proveedor = proveedoresList[indexPath.row]
        let proveedor = proveedoresEntidadList[indexPath.row]
        cell.nombreApellidosLabel.text = proveedor.nombre
        cell.dniLabel.text = String(proveedor.dni)
        cell.telefonoLabel.text = String(proveedor.telefono)
        cell.emailLabel.text = proveedor.email
        cell.productoLabel.text = proveedor.producto
        return cell
        
        
    }
    func registrarProveedor(nombre: String?, dni: String?, numero: String?, email: String?, producto: String?){

        if let name = nombre, let d = dni, let phone = numero, let mail = email, let product = producto {
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let managedcontext = appDelegate.persistenContainer.viewContext
            
            let entidad = ProveedorEntity(context: managedcontext)
            entidad.nombre = name
            entidad.dni = Int32(d)!
            entidad.telefono = Int32(phone)!
            entidad.email = mail
            entidad.producto = product
            
            do {
                try managedcontext.save()
                proveedoresEntidadList.append(entidad)
            
            }
            catch let error as NSError {
                print("No se pudo guardar los datos \(error),\(error.userInfo)")
            }
            proveedoresTableView.reloadData()
        }
    }
    
    
    func listarProveedores() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistenContainer.viewContext
        do {
            let results = try managedContext.fetch(ProveedorEntity.fetchRequest())
            proveedoresEntidadList = results as! [ProveedorEntity]
        }
        catch let error as NSError {
            print("No se pudo listar los datos \(error), \(error.userInfo)")
        }
        proveedoresTableView.reloadData()
    }
    

}
