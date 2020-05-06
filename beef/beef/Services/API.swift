//
//  API.swift
//  beef
//
//  Created by abe on 5/4/20.
//  Copyright © 2020 thoughtbot. All rights reserved.
//

import Foundation
import Combine

struct API {
    enum EndPoints {
        static var baseURL = URLComponents(string: "http://localhost:8080/api/users/login")!
        case signup(name: String, username: String, password: String)
        var url: URL {
            switch self {
            case .signup(name: let name, username: let username, password: let password):
                EndPoints.baseURL.queryItems = [
                    URLQueryItem(name: "name", value: name),
                    URLQueryItem(name: "username", value: username),
                    URLQueryItem(name: "password", value: password)
                ]
                return EndPoints.baseURL.url!
            }
        }
    }
    
    private let apiQueue = DispatchQueue(label: "API", qos: .default, attributes: .init())
    private let decoder = JSONDecoder()
    
//    func signup(name: String, username: String, password: String) -> AnyPublisher<User, Error> {
//
//        let url = EndPoints.signup(name: name, username: username, password: password).url
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        return URLSession.shared.dataTaskPublisher(for: request)
//            .map{
//                print("DATA: ", $0)
//                return $0.data
//        }
//        .decode(type: User.self, decoder: decoder)
//        .eraseToAnyPublisher()
//    }
    
}
