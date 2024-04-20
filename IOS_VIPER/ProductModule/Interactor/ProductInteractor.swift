//
//  ProductInteractor.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation

class ProductInteractor: PresenterToInteractorProtocol{
    var presenter: InteractorToPresenterProtocol?
    
    func getProductsList() {
        self.presenter?.productFetchedSuccess(productEntityArray: [ProductEntity(id: 1, brand: "Fruits", name: "Apples", price:"20"),ProductEntity(id: 2, brand: "Vegitables", name: "Tamato", price:"30"),ProductEntity(id: 3, brand: "Cloths", name: "Shirt", price:"500")])
        
//            guard let url = URL(string: Constants.BaseUrl.productsAPI)
//            else {
//                return
//            }
//            
//            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
//                guard let data = data, error == nil else {
//                    self?.presenter?.productFetchFailed()
//                    return
//                }
//                
//                do {
//                    let products = try JSONDecoder().decode([ProductEntity].self,from: data)
//                    self?.presenter?.productFetchedSuccess(productEntityArray: [ProductEntity(id: 1, brand: "Ramesh", name: "hello", price:"20")])
//                } catch {
//                    self?.presenter?.productFetchFailed()
//                }
//            }
//            task.resume()
        
           // self.presenter?.networkError()
            
        
    }
}
