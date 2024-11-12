//
//  ListingDetailView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 5/11/24.
//

import MapKit
import SwiftUI

struct ListingDetailView: View {
    // vietnamese explain for @Environment dismiss
    // @Environment dismiss giúp chúng ta
    // có thể dismiss màn hình hiện tại
    // từ màn hình con
    // usecases:
    // - khi user click vào nút back
    // - khi user click vào nút close
    @Environment(\.dismiss) var dismiss
    
    let listing: Listing
    
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
                .frame(alignment: .leading)
                .padding(.top, 32)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(listing.title)")
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "star.fill")
                        
                        Text("\(listing.formattedRating)")
                        
                        Text("-")
                        
                        Text("(\(listing.numberOfReviews) reviews)")
                            .underline()
                            .fontWeight(.semibold)
                        
                        Text("\(listing.city), \(listing.state)")
                    }
                    .foregroundColor(.black)
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            // host info view
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Entire \(listing.type) hosted by \(listing.ownerName)")
                        .font(.headline)
                    
                    HStack(spacing: 2) {
                        Text("\(listing.numberOfGuests) guests -")
                        Text("\(listing.numberOfBedrooms) bedrooms -")
                        Text("\(listing.numberOfBeds) beds -")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image("listing-15")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            Divider()
            
            // listing features
            
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) { feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text("\(feature.title)")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("\(feature.subTitle)")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        // Spacer is used to push the text to the right
                        Spacer()
                    }
                }
            }
            // if we are using Spacer, we don't need to use frame
            //            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            Divider()
            
            // bed room view
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll sleep")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(0 ..< listing.numberOfBedrooms, id: \.self) { index in
                            VStack(alignment: .leading, spacing: 4) {
                                Image(systemName: "bed.double")
                                
                                Text("Bedroom \(index + 1)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                    }
                }
                .scrollTargetBehavior(.paging)
            }
            .padding()
            
            Divider()
            
            // offer view
            
            VStack(alignment: .leading, spacing: 16) {
                Text("What this place offers")
                    .font(.headline)
                
                ForEach(listing.amenities) { offer in
                    HStack(spacing: 12) {
                        Image(systemName: offer.imageName)
                        
                        Text("\(offer.title)")
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            Divider()
            
            // map view
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Where you'll be")
                    .font(.headline)
                
                Map(position: $cameraPosition)
                    .frame(height: 200)
                    .cornerRadius(12)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar) // hide the tabar
        .ignoresSafeArea()
        .navigationBarHidden(true) // Hide navigation bar entirely
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Total before taxes")
                            .font(.footnote)
                        Text("Oct 15 - 18")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        // book now
                    } label: {
                        Text("Reserve")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(Color.pink)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[2])
}
