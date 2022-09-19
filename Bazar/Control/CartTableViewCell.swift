//
//  CartTableViewCell.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/15/22.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartProductImage: UIImageView!
    @IBOutlet weak var cartNameLabel: UILabel!
    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var cartStepper: UIStepper!
    @IBOutlet weak var cartCountLabel: UILabel!
    @IBOutlet weak var removeFromCartButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func removeFromCartButtonPressed(_ sender: Any) {
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
