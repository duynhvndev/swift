//
//  ExploreView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 4/11/24.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject private var viewModel = ExploreViewModel(service: ExploreService())

    var body: some View {
        NavigationStack {
            if showDestinationSearchView {
                // binding 'show' to showDestinationSearchView
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            } else {
                ScrollView {
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }

                    // spacing is the space between each item in the VStack
                    // VStack is a vertical (chiều dọc)
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                // this height should be set with dynamic value that suitable with diffirent screen sizes
                                ListingItemView(listing: listing)
                                    .frame(height: 420)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
