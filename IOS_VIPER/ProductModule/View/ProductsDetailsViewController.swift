//
//  ProductsDetailsViewController.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import UIKit

class ProductsDetailsViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var products:ProductEntity?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = products?.name;
        descriptionLabel.text = "Price:"+(products?.price ?? "");
    }
}
