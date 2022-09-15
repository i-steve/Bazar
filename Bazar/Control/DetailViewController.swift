//
//  DetailViewController.swift
//  Bazar
//
//  Created by SpanTechnologyServices on 9/15/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailProductNameLabel: UILabel!
    @IBOutlet weak var detailProductDescriptionLabel: UILabel!
    @IBOutlet weak var detailProductPriceLabel: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    

}
