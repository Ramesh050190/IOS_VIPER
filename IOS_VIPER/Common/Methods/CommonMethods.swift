////
////  CommonMethods.swift
////  SampleViper
////
////  Created by Ajay Veer on 04/10/22.
////
//
//import Foundation
//import SystemConfiguration
//import UIKit
//import KRProgressHUD
//
//func showAlert(vc:UIViewController,title : String, message : String,_ completionhandler:(() -> ())? = nil) {
//    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//    alert.addAction(UIAlertAction(title: Constants.okay, style: UIAlertAction.Style.default, handler: nil))
//    vc.present(alert, animated: true, completion: nil)
//}
//func getPrice(price: String)-> String {
//    return Constants.currency +  price
//}
//func startLoader() {
//    KRProgressHUD.show()
//}
//func stopLoader() {
//    KRProgressHUD.dismiss()
//}
//public class Internet {
//    class func isConnected() -> Bool {
//        var zeroAddress = sockaddr_in()
//        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
//                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
//            }
//        }
//        
//        var flags = SCNetworkReachabilityFlags()
//        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
//            return false
//        }
//        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
//        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
//        return (isReachable && !needsConnection)
//    }
//}
