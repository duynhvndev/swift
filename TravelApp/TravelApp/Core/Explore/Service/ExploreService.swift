//
//  ExploreService.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 9/11/24.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
