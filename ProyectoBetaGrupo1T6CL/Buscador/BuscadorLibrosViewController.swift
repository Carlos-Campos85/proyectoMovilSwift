//
//  BuscadorLibrosViewController.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 11/30/23.
//

import UIKit

class BuscadorLibrosViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource {
    

    @IBOutlet weak var buscadorSearchBar: UISearchBar!
    
    
    @IBOutlet weak var librosTableView: UITableView!
    
    var librosList: [Book] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buscadorSearchBar.delegate = self
        librosTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        guard let criterioBusqueda = searchBar.text else {return}
        buscarLibro(criterio: criterioBusqueda)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func buscarLibro(criterio: String) {
        // https://api.itbook.store/1.0/search/mongodb
        let urlBuscar = String(format: "%@%@", "https://api.itbook.store/1.0/search/", criterio)
        
        guard let url = URL(string: urlBuscar) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response,
            error in
            
            guard let data = data, let response = response as? HTTPURLResponse,
                  error == nil else {
                print("Error: ", error ?? "")
                return
            }
            
            let status = response.statusCode
            guard(200...299).contains(status) else {
                print("Response Code: ", status)
                return
            }
            
            if let libros = try? JSONDecoder().decode(BookResponse.self, from: data) {
                
                self.librosList = libros.books
                
                DispatchQueue.main.async {
                    self.librosTableView.reloadData()
                }
            } else {
                print("Respuesta invalida")
            }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return librosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemLibro", for: indexPath) as! BuscadorLibrosTableViewCell
        
        let book = librosList[indexPath.row]
        
        cell.tituloLibroLabel.text = book.title
        cell.descripcionLibroLabel.text = book.subtitle
        cell.precioLibroLabel.text = book.price
        
        return cell
    }

    
    
    //uitableviewdatasource
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
