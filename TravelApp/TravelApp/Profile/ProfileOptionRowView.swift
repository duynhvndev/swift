//
//  ProfileOptionRowView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 8/11/24.
//

import SwiftUI

struct ProfileOptionRowView: View {
    let imageName: String
    let title: String

    var body: some View {
        HStack {
            Image(systemName: imageName)
//                .font(.title2)
//                .foregroundStyle(.black)

            Text(title)
                .font(.subheadline)
//                .fontWeight(.semibold)
//                .foregroundStyle(.black)

            Spacer()

            Image(systemName: "chevron.right")
//                .font(.title2)
//                .foregroundStyle(.black)
        }
//        .padding(.horizontal)
//        .padding(.vertical, 8)
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 10))
//        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)

        Divider()
    }
}

#Preview {
    ProfileOptionRowView(imageName: "gear", title: "Settings")
}
