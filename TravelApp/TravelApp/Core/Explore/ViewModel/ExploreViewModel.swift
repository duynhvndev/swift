//
//  ExploreViewModel.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 9/11/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""

    private let service: ExploreService
    private var originalListing = [Listing]()

    init(service: ExploreService) {
        self.service = service

        Task {
            await fetchListings()
        }
    }

    func fetchListings() async {
        do {
            listings = try await service.fetchListings()
            originalListing = listings
        } catch {
            print("DEBUG: Failed to fetch listings: \(error.localizedDescription)")
        }
    }

    // explain underscore char in the function:
    // It means that the function doesn't have a parameter name when calling the function
    func updateListingsForLocation(_ cleanup: Bool = false) {
        if cleanup {
            listings = originalListing
            return
        }
        let filteredListings = listings.filter {
            $0.city.lowercased() == searchLocation.lowercased() || $0.state.lowercased() == searchLocation.lowercased()
        }

        listings = filteredListings.isEmpty ? originalListing : filteredListings
    }
}
