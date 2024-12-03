//
//  BuscadorLibrosTableViewCell.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 11/30/23.
//

import UIKit

class BuscadorLibrosTableViewCell: UITableViewCell {
    
    
    /*labels*/
    
    @IBOutlet weak var tituloLibroLabel: UILabel!
    
    @IBOutlet weak var descripcionLibroLabel: UILabel!
    
    @IBOutlet weak var precioLibroLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
