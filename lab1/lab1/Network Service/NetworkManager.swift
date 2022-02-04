//
//  NetworkManager.swift
//  lab1
//
//  Created by Adam Bokun on 23.10.21.
//

import Foundation

extension NetworkManager {
    enum ErrorHandler: Error {
        case invalidURL
    }
}

public class NetworkManager {

    typealias NetworkRouterCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()
    var task: URLSessionTask?
    
    func request (pageId: Int, completion: @escaping NetworkRouterCompletion) {
        let session = URLSession.shared
        do {
            guard let request = try buildRequest(appendingPath: pageId)
            else {
                completion(nil, nil, ErrorHandler.invalidURL)
                return
            }
            
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                completion(data, response, error)
            })
            
        } catch {
            completion(nil, nil, error)
        }
        task?.resume()
    }
    
    public func cancel (){
        task?.cancel()
    }
    
    private func buildRequest(appendingPath: Int) throws -> URLRequest? {
        
        guard let requestUrl = URL(string: "https://api.github.com/events?page=\(appendingPath)")
        else { return nil }
        
        var request = URLRequest(url: requestUrl,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 30.0)
        
        request.httpMethod = "GET"
        return request
    }
}
