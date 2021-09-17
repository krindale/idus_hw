//
//  UIImageView+Extension.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    // Set Image with URL
    func setImage(imageURL: String) {
        let url = URL(string: imageURL)
        let processor = RoundCornerImageProcessor(cornerRadius: 20)
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: url,
            options: [
                .processor(processor),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]) { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                break
            }
        }
    }

}
