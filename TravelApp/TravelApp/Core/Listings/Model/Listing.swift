//
//  Listing.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 9/11/24.
//

import Foundation

struct Listing: Identifiable, Codable, Hashable {
    var id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    var pricePerNight: Int
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Double
    var numberOfReviews: Int
    var imageURLs: [String] = [] // getting from assets with format: 'listing-<number>'

    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    let type: ListingType
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case selfCheckin
    case superHost

    var imageName: String {
        switch self {
        case .selfCheckin: return "door.left.hand.open"
        case .superHost: return "medal"
        }
    }

    var title: String {
        switch self {
        case .selfCheckin: return "Self check-in"
        case .superHost: return "Super host"
        }
    }

    var subTitle: String {
        switch self {
        case .selfCheckin: return "Check yourself in with the lockbox"
        case .superHost: return "Experienced hosts with great reviews"
        }
    }

    var id: Int { return self.rawValue }
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    // swift is automatically assigning the raw value as integer starting from 0
    case wifi
    case kitchen
    case airConditioning
    case heating
    case tv
    case washingMachine
    case dryer
    case parking
    case elevator
    case gym
    case pool
    case hotTub
    case beachFront
    case waterfront
    case skiInSkiOut
    case laundry
    case alarmSystem
    case office
    case balcony

    var title: String {
        switch self {
        case .wifi: return "Wi-Fi"
        case .kitchen: return "Kitchen"
        case .airConditioning: return "Air conditioning"
        case .heating: return "Heating"
        case .tv: return "TV"
        case .washingMachine: return "Washing machine"
        case .dryer: return "Dryer"
        case .parking: return "Parking"
        case .elevator: return "Elevator"
        case .gym: return "Gym"
        case .pool: return "Pool"
        case .hotTub: return "Hot tub"
        case .beachFront: return "Beachfront"
        case .waterfront: return "Waterfront"
        case .skiInSkiOut: return "Ski-in/ski-out"
        case .laundry: return "Laundry"
        case .alarmSystem: return "Alarm system"
        case .office: return "Office"
        case .balcony: return "Balcony"
        }
    }

    var imageName: String {
        switch self {
        case .wifi: return "wifi" // SF Symbol: WiFi icon
        case .kitchen: return "fork.knife" // SF Symbol: Represents kitchen
        case .airConditioning: return "fan" // SF Symbol: Represents air conditioning
        case .heating: return "thermometer.sun" // SF Symbol: Represents heating
        case .tv: return "tv" // SF Symbol: TV icon
        case .washingMachine: return "washer" // SF Symbol: Washing machine
        case .dryer: return "wind" // SF Symbol: No specific dryer symbol; wind is closest
        case .parking: return "car" // SF Symbol: Represents parking
        case .elevator: return "arrow.up.arrow.down" // SF Symbol: Represents an elevator
        case .gym: return "figure.walk" // SF Symbol: Represents fitness or gym
        case .pool: return "drop" // SF Symbol: Represents water
        case .hotTub: return "thermometer" // SF Symbol: Represents hot tub (temperature)
        case .beachFront: return "sun.and.horizon" // SF Symbol: Represents a beachfront
        case .waterfront: return "waveform.path.ecg" // SF Symbol: Represents water (stylized)
        case .skiInSkiOut: return "snowflake" // SF Symbol: Represents skiing/snow
        case .laundry: return "tshirt" // SF Symbol: Represents clothing (laundry context)
        case .alarmSystem: return "bell" // SF Symbol: Represents an alarm
        case .office: return "desktopcomputer" // SF Symbol: Represents office/desktop setup
        case .balcony: return "rectangle.compress.vertical" // SF Symbol: Suggests balcony (space concept)
        }
    }

    var id: Int { return self.rawValue }
}

enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa

    var description: String {
        switch self {
        case .apartment: return "Apartment"
        case .house: return "House"
        case .townHouse: return "Town House"
        case .villa: return "Villa"
        }
    }

    var id: Int { return self.rawValue }
}

extension Listing {
    var formattedRating: String {
        return String(format: "%.2f", self.rating)
    }
}
