//
//  Constants.swift
//  SampleViper
//
//  Created by Ajay Veer on 03/10/22.
//

import Foundation
struct Constants {
    struct BaseUrl {
        static let productsAPI =  "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
    }
    struct CollectionViewCell {
        static let productsCollectionViewCell = "ProductsCollectionViewCell"
    }
    struct ViewController {
        static let productsDetailsViewController = "ProductsDetailsViewController"
    }
    static let products = "Products"
    static let productsDetails = "Products Details"
    static let okay = "Okay"
    static let currency = "₹"
    static let pleaseCheckInternetConnection = "Please Check Internet Connection"
    static let newtworkError = "Network Alert"
    static let noDatatext = "No Data Available"
}
