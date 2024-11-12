//
//  ListingImageCarouselView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 5/11/24.
//

import SwiftUI

struct ListingImageCarouselView: View {
    let listing: Listing

    var body: some View {
        TabView {
            ForEach(listing.imageURLs, id: \.self) { item in
                Image(item)
                    .resizable()
                    .scaledToFill()
            }
        }
//        .frame(height: 320)
        // vietnamese: ''clipShape'' là hình dạng của view
//        .clipShape(RoundedRectangle(cornerRadius: 10))
        .tabViewStyle(PageTabViewStyle())
    }
}

#Preview {
    ListingImageCarouselView(listing: DeveloperPreview.shared.listings[0])
}
