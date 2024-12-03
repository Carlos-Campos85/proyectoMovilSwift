

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usuarioTextField: UITextField!
    
    @IBOutlet weak var claveTextField: UITextField!
    
    @IBOutlet weak var ingresarBtn: UIButton!
    
    @IBOutlet weak var olvidarLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.recuperarLabel))
        self.olvidarLabel.isUserInteractionEnabled = true
        self.olvidarLabel.addGestureRecognizer(tap)

    }
    
    /* Ingreso al sistema */
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if usuarioTextField.text?.isEmpty == true || claveTextField.text?.isEmpty == true {
                let alert = UIAlertController(title: "Alerta", message: "Completar todos los campos", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                    alert.dismiss(animated: true, completion: nil)
                }))
                present(alert, animated: true, completion: nil)
                return false
            } else if contieneCaracteresEspeciales(usuarioTextField.text ?? "") {
                muestraAlerta(mensaje: "El usuario no debe contener caracteres especiales")
                return false
            } else if contieneCaracteresEspeciales(claveTextField.text ?? "") {
                muestraAlerta(mensaje: "La clave no debe contener caracteres especiales")
                return false
            } else if let texto = usuarioTextField.text, texto.count <= 4 {
                validaUsuario()
                return false
            } else if let texto = claveTextField.text, texto.count <= 6 {
                validaClave()
                return false
            } else {
                let user = usuarioTextField.text
                print("Bienvenido " , user!)
                limpiarCajas()
                return true
            }
    }
    
    @IBAction func ingresarSistema(_ sender: Any) {

    }
    
    /* Opcion de Recuperacion */
    @IBAction func recuperarLabel(_ sender : UITapGestureRecognizer) {
        print("Vista de Recuperacion")
        
        limpiarCajas()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let recuperar = main.instantiateViewController(withIdentifier: "recuperacionView")
        self.present(recuperar, animated: true, completion: nil)
    }
    
    func limpiarCajas(){
        
        //usuarioTextField.text = ""
        claveTextField.text = ""
    }
    
    func validaUsuario(){
            let alert = UIAlertController(title: "Alerta", message: "El usuario debe tener mas de 4 caracteres", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)}))
            present(alert, animated: true, completion: nil)
    }
    
    func validaClave(){
            let alert = UIAlertController(title: "Alerta", message: "La clave debe tener mas de 6 caracteres", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action) in
                alert.dismiss(animated: true, completion: nil)}))
            present(alert, animated: true, completion: nil)
    }
    
    
    func muestraAlerta(mensaje: String) {
        let alert = UIAlertController(title: "Alerta", message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        present(alert, animated: true, completion: nil)
    }

    func contieneCaracteresEspeciales(_ texto: String) -> Bool {
        let patroCaracteresEspeciales = "[^A-Za-z0-9]" // Patrón que permite letras y números

        return texto.range(of: patroCaracteresEspeciales, options: .regularExpression) != nil
    }
    
    
    
}
