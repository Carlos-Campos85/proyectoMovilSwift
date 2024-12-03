//
//  hotelViewController.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 11/27/23.
//

import UIKit

struct Hotel {
    
    var destino: String
    var nombre: String
    var descripcion: String
    var precio: Double
    var proveedor: String
}

class hotelViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var hotelTableView: UITableView!
    
    var hotelList:[Hotel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hotelTableView.dataSource = self
        
        hotelList.append(Hotel(destino: "Mexico", nombre: "Xcaret Hotel", descripcion: "2 dias y 1 noche", precio: 400.78, proveedor: "Xcaret"))
        
        hotelList.append(Hotel(destino: "Cuzco", nombre: "MariHotel", descripcion: "3 dias y una noche", precio: 1290.18, proveedor: "Incatravel"))

    }
    

    @IBAction func insertarHotel(_ sender: Any) {
        
        
        var destinoTextField = UITextField()
        var nombreTextField = UITextField()
        var descripcionTextField = UITextField()
        var precioTextField = UITextField()
        var proveedorTextField = UITextField()
        
        
        let alerta = UIAlertController(title: "Registrar hotel", message: "Datos de Hotel", preferredStyle: .alert)
        
        
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese destino"
            destinoTextField = alertaTextField
        }
        
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese nombre de hotel"
            nombreTextField = alertaTextField
        }
        
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese descripcion"
            descripcionTextField = alertaTextField
        }
        
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese precio"
            precioTextField = alertaTextField
        }
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese proveedor"
            proveedorTextField = alertaTextField
        }
        
        
        let action = UIAlertAction(title: "Registrar", style: .default, handler: {
            
            action in
            
            
            if destinoTextField.text != "", nombreTextField.text != "", descripcionTextField.text != "",
               precioTextField.text != nil, proveedorTextField.text != "" {
                
                let destino = destinoTextField.text
                let nombre = nombreTextField.text
                let descripcion = descripcionTextField.text
                let precio = precioTextField.text
                let proveedor = proveedorTextField.text
                
                self.registrarHotel(destino: destino, nombre: nombre, descripcion: descripcion, precio: precio, proveedor: proveedor)
                
            } else {
                print("Error en el registro")
            }
            
        })
        alerta.addAction(action)
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alerta, animated: true, completion: nil)
        
    }
    
    
    
    func registrarHotel(destino:String?, nombre:String?, descripcion:String?, precio:String?, proveedor:String?){
        
        if let dest = destino, let nom = nombre, let desc = descripcion, let pre = precio, let pro = proveedor {
            
            let hotel = Hotel(destino: dest, nombre: nom, descripcion: desc, precio: Double(pre) ?? 0.0, proveedor: pro)
            hotelList.append(hotel)
            hotelTableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hotelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath) as! hotelTableViewCell
        
        let hotel = hotelList[indexPath.row]
        
        cell.destinoLabel.text = hotel.destino
        cell.nombreLabel.text = hotel.nombre
        cell.descripcionLabel.text = hotel.descripcion
        cell.precioLabel.text = String(hotel.precio)
        cell.proveedorLabel.text = hotel.proveedor
        
        
        return cell
        
    }
}
