//
//  ProductRouter.swift
//  SampleViper
//
//  Created by Ajay Veer on 04/10/22.
//

import Foundation
import UIKit

class ProductRouter:PresenterToRouterProtocol{
    
    
    static func createModule(view:ProductViewController) {
        
        var presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = ProductPresenter()
        var interactor: PresenterToInteractorProtocol = ProductInteractor()
        let router:PresenterToRouterProtocol = ProductRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
    }
    
    static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
    
}
