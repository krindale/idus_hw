//
//  String+Extension.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation

extension String {
    var byteToMB: String {
        guard let byte = Double(self) else { return "0.0 MB"}
        
        return "\(String(format: "%.1f",  byte/(1024 * 1024))) MB"
    }
}
