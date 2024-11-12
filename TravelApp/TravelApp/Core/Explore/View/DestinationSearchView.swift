//
//  DestinationSearchView.swift
//  TravelApp
//
//  Created by Duy Nguyen Hoang on 8/11/24.
//

import SwiftUI

enum DestinationSearchOptions {
    case location
    case dates
    case guests
    case none
}

struct DestinationSearchView: View {
    // vietnamese explain for @Binding
    // @Binding giúp chúng ta có thể truyền giá trị từ cha view xuống con view và ngược lại từ con view lên cha view
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel

    // vietnamese explain for @State
    // @State giúp chúng ta có thể quản lý trạng thái của view mà không cần phải tạo ra một class để lưu trữ trạng thái đó (ví dụ: show/hide view, show/hide alert, show/hide action sheet, ...)

    @State private var selectedOption: DestinationSearchOptions = .location

    @State private var selectedDates = [Date(), Date()]

    @State private var selectedGuests = 1

    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        show.toggle()
                        viewModel.updateListingsForLocation(true)
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }

                Spacer()

                if !viewModel.searchLocation.isEmpty {
                    Button {
                        // clear all fields
                        viewModel.searchLocation = ""
                        selectedDates = [Date(), Date()]
                        selectedGuests = 1
                        viewModel.updateListingsForLocation(true)
                    } label: {
                        Text("Clear")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .font(.subheadline)
                    }
                }
            }
            .padding()

            VStack(alignment: .leading, spacing: 16) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title)
                        .fontWeight(.semibold)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundStyle(.gray)
                            .imageScale(.small)

                        TextField("Search destinations", text: $viewModel.searchLocation)
                            .foregroundColor(.gray)
                            .font(.subheadline)
                            .onSubmit {
                                // update listings for the selected location
                                viewModel.updateListingsForLocation()

                                // toggle the view
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray, lineWidth: 1)
                            .foregroundColor(Color(.systemGray4))
                    )
                } else {
                    CollapsedPickerView(title: "Where", description: "Add location")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 60)
            .onTapGesture {
                withAnimation(.snappy) {
                    if selectedOption == .none || selectedOption != .location {
                        selectedOption = .location
                    } else {
                        selectedOption = .none
                    }
                }
            }
            .padding(.bottom)

            // date selection view

            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When's your trip?")
                        .font(.title2)
                        .fontWeight(.semibold)

                    VStack {
                        DatePicker("From", selection: $selectedDates[0], displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding(.horizontal)
                        Divider()
                        DatePicker("To", selection: $selectedDates[1], displayedComponents: .date)
                            .datePickerStyle(.compact)
                            .padding(.horizontal)
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                } else {
                    CollapsedPickerView(title: "When", description: "Add dates")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 168 : 60)
            .onTapGesture {
                withAnimation(.snappy) {
                    if selectedOption == .none || selectedOption != .dates {
                        selectedOption = .dates
                    } else {
                        selectedOption = .none
                    }
                }
            }
            .padding(.bottom)

            // num guests view
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("Who's coming?")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Stepper {
                        Text("\(selectedGuests) Adult(s)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    } onIncrement: {
                        selectedGuests += 1
                    } onDecrement: {
                        // prevent decrement below 1
                        if selectedGuests > 1 {
                            selectedGuests -= 1
                        }
                    }

                } else {
                    CollapsedPickerView(title: "Who", description: "Add guests")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 60)
            .onTapGesture {
                withAnimation(.snappy) {
                    if selectedOption == .none || selectedOption != .guests {
                        selectedOption = .guests
                    } else {
                        selectedOption = .none
                    }
                }
            }
            .padding(.bottom)
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

        Spacer()
    }
}

#Preview {
    DestinationSearchView(show: Binding<Bool>.constant(false),
                          viewModel: ExploreViewModel(service: ExploreService()))
}

struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 6)
    }
}

// expand and constract picker view
struct CollapsedPickerView: View {
    let title: String
    let description: String

    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundStyle(.gray)

                Spacer()

                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
    }
}
