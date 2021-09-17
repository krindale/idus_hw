//
//  APIManager.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation
import RxSwift
import Moya

final class APIManager {
    // APIManager Singleton
    static let share = APIManager()
    
    // Moya Provider
    private let provider: MoyaProvider<IDUSAPI>
    
    var startIndicatorClosure: () -> Void = {}
    var endIndicatorClosure: () -> Void = {}
    
    private init() {
        /// NetworkActivityPlugin
        let networkClosure = {(_ change: NetworkActivityChangeType, _ target: TargetType) in
            switch change {
            case .began:
                print("Network Begin")
                APIManager.share.startIndicatorClosure()
            case .ended:
                print("Network End")
                APIManager.share.endIndicatorClosure()
            }
        }

        let plugin = NetworkActivityPlugin(networkActivityClosure: networkClosure)
        
        self.provider = MoyaProvider<IDUSAPI>(plugins: [ plugin])
    }
    
    // Request API
    func request(target: IDUSAPI) -> Single<Response> {
        
        return provider.rx.request(target)
            .do(onError: { [weak self] error in
                // Network Error 공통 처리
                self?.errorPopup(error: error)
            })
    }
    
    // Network Error Popup
    private func errorPopup(error: Error) {
        let alert = UIAlertController(title: "알림", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(cancelAction)
        
        UIApplication.shared.topViewController?.present(alert, animated: false)
    }
}

