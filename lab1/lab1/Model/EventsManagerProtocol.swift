//
//  EventsManagerProtocol.swift
//  lab1
//
//  Created by Adam Bokun on 25.10.21.
//

import Foundation


protocol EventsManagerProtocol {
    func getEvents(pageId: Int, completion: @escaping (Result<[Events],Error>) -> Void)
}
