//
//  LoadingAPI.swift
//  iOS_PokeApp
//
//  Created by Tuấn Nguyễn on 16/07/2022.
//

import Foundation


enum APIError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}

enum APIState {
    case loading
    case success
    case failure(APIError)
}
