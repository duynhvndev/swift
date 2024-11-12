//
//  ListingItemView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 4/11/24.
//

import SwiftUI

struct ListingItemView: View {
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // image
            
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            // listing detail
            // items are put in a horizontal (theo chiều ngang)
            HStack(alignment: .top) {
                // detail
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("12 miles away")
                        .foregroundColor(.gray)
                    
                    Text("Nov 3 - 10")
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Text("\(listing.pricePerNight)$")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("night")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                    }
                }
                
                Spacer()
                
                // rating
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill")
                        
                    Text("\(listing.formattedRating)")
                        .font(.subheadline)
                }
                .foregroundColor(.black)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
