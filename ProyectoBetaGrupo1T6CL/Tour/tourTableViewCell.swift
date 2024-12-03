//
//  tourTableViewCell.swift
//  ProyectoBetaGrupo1T6CL
//
//  Created by virtualMac on 11/27/23.
//

import UIKit

class tourTableViewCell: UITableViewCell {

    
    @IBOutlet weak var destinoLabel: UILabel!
    
    @IBOutlet weak var tipoLabel: UILabel!
    
    @IBOutlet weak var descripcionLabel: UILabel!
    
    @IBOutlet weak var precioLabel: UILabel!
    
    @IBOutlet weak var proveedorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
