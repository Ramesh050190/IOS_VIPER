//
//  ProductPresenter.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation
import UIKit

class ProductPresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingProductList() {
        interactor?.getProductsList()
    }
}

extension ProductPresenter: InteractorToPresenterProtocol{
    
    func productFetchedSuccess(productEntityArray: Array<ProductEntity>) {
        view?.fetchProductListOnSuccess(productArray: productEntityArray)
    }
    
    func productFetchFailed() {
        view?.showError()
    }
    func networkError() {
        view?.showNetworkError()
    }
    
}
