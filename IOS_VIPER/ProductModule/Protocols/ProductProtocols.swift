//
//  ProductProtocols.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation
import UIKit

protocol ViewToPresenterProtocol{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingProductList()
    
}

protocol PresenterToViewProtocol{
    func fetchProductListOnSuccess(productArray:Array<ProductEntity>)
    func showError()
    func showNetworkError()
}

protocol PresenterToRouterProtocol {
    static func createModule(view:ProductViewController)
}

protocol PresenterToInteractorProtocol {
    var presenter:InteractorToPresenterProtocol? {get set}
    func getProductsList()
}

protocol InteractorToPresenterProtocol {
    func productFetchedSuccess(productEntityArray:Array<ProductEntity>)
    func productFetchFailed()
    func networkError()
}
