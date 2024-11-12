//
//  DeveloperPreview.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 9/11/24.
//

import Foundation

// mock data for Listings --> Model --> Listing.swift, with imageURLs [String], random mock order number of imageURLs for each listing with 4 items from 1 to 15, properties that related to address should be random too
//

class DeveloperPreview {
    static let shared = DeveloperPreview()

    var listings: [Listing] = [
        .init(id: "1", ownerUid: "1", ownerName: "Duy Nguyen Hoang", ownerImageUrl: "https://i.pravatar.cc/150?img=1", numberOfBedrooms: 2, numberOfBathrooms: 2, numberOfGuests: 4, numberOfBeds: 3, pricePerNight: 100, latitude: 37.7749, longitude: -122.4194, address: "2000 Post St", city: "San Francisco", state: "CA", title: "Modern apartment in the heart of the city", rating: 4.5, numberOfReviews: 12, imageURLs: ["listing-1", "listing-5", "listing-10", "listing-15"], features: [.selfCheckin, .superHost], amenities: [.wifi, .kitchen, .airConditioning, .tv], type: .apartment),
        
        .init(id: "2", ownerUid: "2", ownerName: "Alex Johnson", ownerImageUrl: "https://i.pravatar.cc/150?img=2", numberOfBedrooms: 3, numberOfBathrooms: 1, numberOfGuests: 5, numberOfBeds: 4, pricePerNight: 85, latitude: 40.7128, longitude: -74.0060, address: "500 Park Ave", city: "New York", state: "NY", title: "Cozy condo near Central Park", rating: 4.7, numberOfReviews: 20, imageURLs: ["listing-2", "listing-6", "listing-9", "listing-11"], features: [.superHost], amenities: [.wifi, .tv], type: .house),
        
        .init(id: "3", ownerUid: "3", ownerName: "Sarah Lee", ownerImageUrl: "https://i.pravatar.cc/150?img=3", numberOfBedrooms: 4, numberOfBathrooms: 3, numberOfGuests: 8, numberOfBeds: 6, pricePerNight: 200, latitude: 34.0522, longitude: -118.2437, address: "350 Sunset Blvd", city: "Los Angeles", state: "CA", title: "Luxury villa with a pool", rating: 4.9, numberOfReviews: 30, imageURLs: ["listing-3", "listing-7", "listing-12", "listing-8"], features: [.selfCheckin], amenities: [.wifi, .kitchen, .airConditioning, .pool], type: .villa),
        
        .init(id: "4", ownerUid: "4", ownerName: "Maria Gonzalez", ownerImageUrl: "https://i.pravatar.cc/150?img=4", numberOfBedrooms: 1, numberOfBathrooms: 1, numberOfGuests: 2, numberOfBeds: 1, pricePerNight: 60, latitude: 41.8781, longitude: -87.6298, address: "700 State St", city: "Chicago", state: "IL", title: "Charming studio in downtown", rating: 4.3, numberOfReviews: 15, imageURLs: ["listing-4", "listing-1", "listing-5", "listing-14"], features: [], amenities: [.wifi, .tv], type: .apartment),
       
        .init(id: "5", ownerUid: "5", ownerName: "James Brown", ownerImageUrl: "https://i.pravatar.cc/150?img=5", numberOfBedrooms: 3, numberOfBathrooms: 2, numberOfGuests: 6, numberOfBeds: 3, pricePerNight: 120, latitude: 47.6062, longitude: -122.3321, address: "100 Pine St", city: "Seattle", state: "WA", title: "Spacious house with a garden", rating: 4.6, numberOfReviews: 18, imageURLs: ["listing-6", "listing-10", "listing-3", "listing-9"], features: [.superHost], amenities: [.wifi, .kitchen, .alarmSystem], type: .house),
       
        .init(id: "6", ownerUid: "6", ownerName: "Emily Davis", ownerImageUrl: "https://i.pravatar.cc/150?img=6", numberOfBedrooms: 2, numberOfBathrooms: 1, numberOfGuests: 4, numberOfBeds: 2, pricePerNight: 95, latitude: 32.7157, longitude: -117.1611, address: "300 Harbor Dr", city: "San Diego", state: "CA", title: "Beachside condo with a view", rating: 4.8, numberOfReviews: 22, imageURLs: ["listing-2", "listing-15", "listing-7", "listing-12"], features: [.selfCheckin], amenities: [.wifi, .tv, .airConditioning], type: .apartment),
      
        .init(id: "7", ownerUid: "7", ownerName: "Liam Wilson", ownerImageUrl: "https://i.pravatar.cc/150?img=7", numberOfBedrooms: 4, numberOfBathrooms: 2, numberOfGuests: 10, numberOfBeds: 5, pricePerNight: 180, latitude: 39.7392, longitude: -104.9903, address: "400 Market St", city: "Denver", state: "CO", title: "Mountain cabin retreat", rating: 4.4, numberOfReviews: 25, imageURLs: ["listing-5", "listing-8", "listing-1", "listing-4"], features: [.superHost, .selfCheckin], amenities: [.wifi, .kitchen, .balcony], type: .villa),
     
        .init(id: "8", ownerUid: "8", ownerName: "Sophia Martinez", ownerImageUrl: "https://i.pravatar.cc/150?img=8", numberOfBedrooms: 1, numberOfBathrooms: 1, numberOfGuests: 2, numberOfBeds: 1, pricePerNight: 70, latitude: 29.7604, longitude: -95.3698, address: "250 Houston St", city: "Houston", state: "TX", title: "Quaint guesthouse in quiet neighborhood", rating: 4.2, numberOfReviews: 10, imageURLs: ["listing-14", "listing-9", "listing-2", "listing-3"], features: [], amenities: [.wifi, .tv], type: .house),
    ]
}
