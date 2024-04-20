//
//  ProductsCollectionViewCell.swift
//  ViperDemo
//
//  Created by Ajay Veer on 04/10/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(results: ProductEntity?) {
        priceLabel.text = results?.price
        titleLabel.text = results?.name
        //let url = URL(string: results?.imageLink ?? "" )
        //productImage.downloadImage(url: url, view: self)
    }
}
