//
//  BolosCell.swift
//  Loja_Bolos
//
//  Created by COTEMIG on 02/10/20.
//  Copyright © 2020 Cotemig. All rights reserved.
//

import UIKit

class BolosCell: UITableViewCell {
    @IBOutlet weak var Imagem: UIImageView!
    @IBOutlet weak var Preco: UILabel!
    @IBOutlet weak var Descricao: UILabel!
    @IBOutlet weak var Nome: UILabel!
    @IBOutlet weak var Sabor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
