//
//  tourViewController.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 11/27/23.
//

import UIKit


struct Tour {
    
    var destino: String
    var tipo: String
    var descripcion: String
    var precio: Double
    var proveedor: String
    
}

class tourViewController: UIViewController, UITableViewDataSource {

    
    
    @IBOutlet weak var tourTableView: UITableView!
    
    var tourList: [Tour] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tourTableView.dataSource = self
        
        tourList.append(Tour(destino: "Cuzco", tipo: "Full Day", descripcion: "3 lugares, hospedaje", precio: 123.78, proveedor: "IncaTravel"))
        
        tourList.append(Tour(destino: "Mexico", tipo: "Paquete", descripcion: "Todo traslado", precio: 120.18, proveedor: "Xcaret"))

  
    }
    

    @IBAction func insertarTour(_ sender: Any) {
        
        var destinoTextField = UITextField()
        var tipoTextField = UITextField()
        var descripcionTextField = UITextField()
        var precioTextField = UITextField()
        var proveedorTextField = UITextField()
        
        
        let alerta = UIAlertController(title: "Registrar Tour", message: "Datos de Tour", preferredStyle: .alert)
        
        
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese destino"
            destinoTextField = alertaTextField
        }
        
        alerta.addTextField {
            alertaTextField in alertaTextField.placeholder = "Ingrese Tipo"
            tipoTextField = alertaTextField
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
            
            
            if destinoTextField.text != "", tipoTextField.text != "", descripcionTextField.text != "",
               precioTextField.text != nil, proveedorTextField.text != "" {
                
                let destino = destinoTextField.text
                let tipo = tipoTextField.text
                let descripcion = descripcionTextField.text
                let precio = precioTextField.text
                let proveedor = proveedorTextField.text
                
                self.registrarTour(destino: destino, tipo: tipo, descripcion: descripcion, precio: precio, proveedor: proveedor)
                
            } else {
                print("Error en el registro")
            }
            
        })
        alerta.addAction(action)
        alerta.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alerta, animated: true, completion: nil)
        
    }
    
    func registrarTour(destino:String?, tipo:String?, descripcion:String?, precio:String?, proveedor:String?){
        
        if let dest = destino, let tip = tipo, let desc = descripcion, let pre = precio, let pro = proveedor {
            
            let tour = Tour(destino: dest, tipo: tip, descripcion: desc, precio: Double(pre) ?? 0.0, proveedor: pro)
            tourList.append(tour)
            tourTableView.reloadData()
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tourList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tourCell", for: indexPath) as! tourTableViewCell
        
        let tour = tourList[indexPath.row]
        
        cell.destinoLabel.text = tour.destino
        cell.tipoLabel.text = tour.tipo
        cell.descripcionLabel.text = tour.descripcion
        cell.precioLabel.text = String(tour.precio)
        cell.proveedorLabel.text = tour.proveedor
        
        
        return cell
    }
    

}
