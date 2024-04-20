////
////  Extensions.swift
////  SampleViper
////
////  Created by Ajay Veer on 04/10/22.
////
//
//import Foundation
//import Kingfisher
//import UIKit
//
//extension UIImageView{
//    func downloadImage(url: Resource?,view: UIView) {
//        self.kf.setImage(with: url,
//                         placeholder: nil,
//                         options: [.transition(.fade(0.3)),
//                                   .cacheOriginalImage,
//                                   .forceTransition]) { (_, _) in
//                                       
//                                   } completionHandler: { (_, _, _, _) in
//                                       if let imgPlace = view.subviews.first(where: { $0.layer.name == "placeholder" }) {
//                                           imgPlace.isHidden = true
//                                       }
//                                   }
//    }
//}
