//
//  ViewController.swift
//  SampleViper
//
//  Created by Ajay Veer on 03/10/22.
//

import UIKit

class ProductViewController: UIViewController{
    @IBOutlet weak var noDataView: UIView!
    
    @IBOutlet weak var noDataLabel: UILabel!
    var presentor:ViewToPresenterProtocol?
    @IBOutlet weak var productsCollectionView: UICollectionView!{
        didSet{
            self.productsCollectionView.register(UINib.init(nibName: Constants.CollectionViewCell.productsCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: Constants.CollectionViewCell.productsCollectionViewCell)
        }
    }
    var products : [ProductEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductRouter.createModule(view: self);
        setupView()
        presentor?.startFetchingProductList()
        
    }
    
    func setupView() {
        self.title = Constants.products
        noDataView.isHidden = true
        noDataLabel.text = Constants.noDatatext
    }
}

extension ProductViewController : PresenterToViewProtocol {
    func fetchProductListOnSuccess(productArray: Array<ProductEntity>) {
   
        //        DispatchQueue.main.async {
        //stopLoader()
        self.products = productArray
        self.noDataView.isHidden = true
        self.productsCollectionView.isHidden = false
        self.productsCollectionView.reloadData()
        //}
    }
    
    func showError() {
        DispatchQueue.main.async {
            //stopLoader()
            self.noDataView.isHidden = false
            self.noDataLabel.text = Constants.noDatatext
            self.productsCollectionView.isHidden = true
        }
    }
    func showNetworkError() {
        DispatchQueue.main.async {
            //stopLoader()
            self.noDataView.isHidden = false
            self.noDataLabel.text = Constants.pleaseCheckInternetConnection
            self.productsCollectionView.isHidden = true
            //showAlert(vc: self, title:Constants.newtworkError, message: Constants.pleaseCheckInternetConnection)
        }
    }
}
extension ProductViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - Collection View delegate, datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if self.products.count > 0 {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCell.productsCollectionViewCell, for: indexPath) as? ProductsCollectionViewCell{
                cell.configure(results: (products[indexPath.item]))
                return cell
            }
        }
        return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width  = (view.frame.width-20)/2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "product", sender: indexPath.row)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "product" {
            let viewController = segue.destination as! ProductsDetailsViewController
            viewController.products = self.products[sender as! Int]
            
        }
    }
    
}
