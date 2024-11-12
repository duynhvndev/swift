//
//  SearchAndFilterBar.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 5/11/24.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    
    var body: some View {
        HStack {
            // search bar
            HStack {
                Image(systemName: "magnifyingglass")
                
                // 'alignment' is the alignment of the text
                // vietnamese: 'alignment' là sự căn chỉnh của text theo chiều ngang
                // các kiểu alignment: .leading, .center, .trailing
                VStack(alignment: .leading, spacing: 2) {
                    Text(location.isEmpty ? "Where to?" : location)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(location.isEmpty ? "Anywhere - Any Week - Any guests" : "Any Week - Any guests")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                }
            }
            
            // this spacer will push the search bar to the left
            Spacer()
            
            Button {
                // action
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                .foregroundStyle(Color(.systemGray4))
                .shadow(color: Color.black.opacity(0.4), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: Binding<String>.constant(""))
}
