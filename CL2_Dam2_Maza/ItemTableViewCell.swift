//
//  ItemTableViewCell.swift
//  CL2_Dam2_Maza
//
//  Created by Maribel on 13/10/23.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    //var
    @IBOutlet weak var lblDescripcion: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
