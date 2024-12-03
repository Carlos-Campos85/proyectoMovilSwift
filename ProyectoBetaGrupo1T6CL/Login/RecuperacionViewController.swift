//
//  RecuperacionViewController.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 10/13/23.
//

import UIKit

class RecuperacionViewController: UIViewController {

    
    @IBOutlet weak var usuario2TextField: UITextField!

    @IBOutlet weak var recuperarBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recuperarClave(_ sender: Any) {
        
        let usuario2 = usuario2TextField.text

        if let user2 = usuario2, !user2.isEmpty
        {
               print("Se le envio informacion al correo de usuario:", user2)
                limpiarCajas()
        }
        else {
            
            let alert = UIAlertController(title: "Alerta", message: "Ingresar un usuario valido", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)}))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func limpiarCajas(){
        usuario2TextField.text = ""
    }
    

    
    

}
