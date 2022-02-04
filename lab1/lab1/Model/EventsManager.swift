//
//  EventsManager.swift
//  lab1
//
//  Created by Adam Bokun on 25.10.21.
//

import Foundation

private enum NetworkResponse: String, Error {
    case success
    case failed = "Error"
    case noData = "No data"
    case ubableToDecode = "Unable to decode"
}

final class EventsManager {
    let network = NetworkManager()
}

extension EventsManager: EventsManagerProtocol {
    func getEvents(pageId: Int, completion: @escaping (Result<[Events], Error>) -> Void) {
        network.request(pageId: pageId) { data, response, error in
            if error != nil {
                completion(.failure(NetworkResponse.failed))
            }
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    case 200...299:
                        guard let responseData = data else {
                            completion(.failure(NetworkResponse.noData))
                            return
                        }
                        do {
                            let apiResponse = try JSONDecoder().decode([Events].self, from: responseData)
                            completion(.success(apiResponse))
                        } catch {
                            completion(.failure(NetworkResponse.ubableToDecode))
                        }
                        
                    default:
                        print(response.description)
                        print(response.statusCode)
                        completion(.failure(NetworkResponse.failed))
                }
            }
        }
    }
}


