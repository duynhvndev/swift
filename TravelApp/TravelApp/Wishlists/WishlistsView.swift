//
//  WishlistsView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 8/11/24.
//

import SwiftUI

struct WishlistsView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Log in to view your wishlists")
                        .font(.headline)

                    Text("You can create, view or edit wishlists once you've logged in.")
                        .font(.footnote)

                    Button {
                        // action
                    } label: {
                        Text("Log in")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 48)
                            .background(.pink)
                            .cornerRadius(10)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding()
                .navigationTitle("Wishlists")
            }
        }
    }
}

#Preview {
    WishlistsView()
}
