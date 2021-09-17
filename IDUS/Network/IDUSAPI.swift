//
//  IDUSAPI.swift
//  IDUS
//
//  Created by 이해상 on 2021/09/17.
//

import Foundation
import Moya

// API
// http://itunes.apple.com/lookup?id=872469884

public enum IDUSAPI {
    static let id = 872469884
    
    case appStoreLookup(id: Int)
}

extension IDUSAPI: TargetType {

    public var baseURL: URL {
        return URL(string: "http://itunes.apple.com")!
    }
    
    public var headers: [String: String]? {
        return ["Accept-Encoding": "gzip"]
    }
    
    public var path: String {
        switch self {
        case .appStoreLookup:
            return "/lookup"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .appStoreLookup:
            return .get
        }
    }
    
    public var parameters: [String: String] {
        switch self {
        case let .appStoreLookup(id):
        return ["id": "\(id)"]
        }
    }
    
    public var task: Task {
        return .requestParameters(parameters: self.parameters,
                                  encoding: URLEncoding.default)
    }

    public var sampleData: Data {
        return Data()
    }
}


