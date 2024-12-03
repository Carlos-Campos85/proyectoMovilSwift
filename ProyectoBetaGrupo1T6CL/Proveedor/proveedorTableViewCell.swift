//
//  proveedorTableViewCell.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by DAMII on 12/11/23.
//

import UIKit

class proveedorTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var nombreApellidosLabel: UILabel!
    
    
    @IBOutlet weak var dniLabel: UILabel!
    
    @IBOutlet weak var telefonoLabel: UILabel!
    
    
    @IBOutlet weak var emailLabel: UILabel!
    
    
    @IBOutlet weak var productoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
