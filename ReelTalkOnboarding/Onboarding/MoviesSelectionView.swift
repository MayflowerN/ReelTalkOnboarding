//
//  MoviesSelectionView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

struct MoviesSelectionView: View {
    @State private var showTVShowsSelectionView: Bool = false
    @State private var selectedMovies: [String] = []
    @State private var searchMovie: String = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    let movieArray: [String] = ["Movie1", "Movie2", "Movie3", "Movie4", "Movie5", "Movie6", "Movie7"]
    
    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            
            if showTVShowsSelectionView {
                TVShowsSelectionView()
            } else {
                VStack(spacing: 20) {
                    HStack {
                        ForEach(0..<5) { index in
                            Rectangle()
                                .fill(selectedMovies.count > index ? Color.orange : Color.gray)
                                .frame(width: 60, height: 4)
                                .padding(.top, 25)
                        }
                    }
                    
                    Text("Select your top 5 movies")
                        .font(.custom(.demiBold, size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 312, alignment: .top)
                    
                    Text("\(selectedMovies.count)/5 selected")
                        .font(.custom(.regular, size: 15))
                        .kerning(0.3)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: 0xFFFFFF))
                    
                    TextField("Search to add more", text: $searchMovie)
                        .padding(.horizontal, 40)
                        .font(.custom(.regular, size: 17))
                        .foregroundColor(Color(hex: 0x6D6D6D))
                        .padding(.vertical, 10)
                        .frame(width: 326, height: 48, alignment: .leading)
                        .background(
                                RoundedRectangle(cornerRadius: 24)
                                    .fill(Color(hex: 0xFFFFFF))
                            )
                        .cornerRadius(24)
                        .overlay(
                            HStack {
                                Image("Search Icon")
                                    .foregroundColor(Color(hex: 0x6D6D6D))
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 16)
                                Spacer()
                            }
                        )
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(movieArray, id: \.self) { movie in
                                if movie.lowercased().contains(searchMovie.lowercased()) || searchMovie.isEmpty {
                                    VStack(spacing: 5) { // Wrapped the button and text in a VStack
                                        Button(action: {
                                            if selectedMovies.contains(movie) {
                                                selectedMovies.removeAll(where: { $0 == movie })
                                            } else if selectedMovies.count < 5 {
                                                selectedMovies.append(movie)
                                            }
                                        }) {
                                            ZStack(alignment: .topTrailing) {
                                                Image(movie)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 155, height: 229.47509765625)
                                                    .clipped()
                                                    .overlay(RoundedRectangle(cornerRadius: 5) // Added orange overlay
                                                        .stroke(selectedMovies.contains(movie) ? Color(hex: 0xFFA724) : Color.clear, lineWidth: 2))
                                                
                                                if selectedMovies.contains(movie) {
                                                    Image("Circle") // Using system image for checkmark
                                                        .foregroundColor(Color(hex: 0xFFA824))
                                                        .padding(5)
                                                }
                                            }
                                        }
                                        // This is the added movie name component
                                        Text(movie)
                                            .font(.custom(.regular, size: 13))
                                            .kerning(0.26)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(Color(hex: 0xFFFFFFEB))
                                            .frame(width: 154, alignment: .center)
                                    }
                                }
                            }
                        }
                        .padding(10)

                    }
                    SquareButton(title: "Continue") {
                        showTVShowsSelectionView = true
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
        }
    }
}

struct MoviesSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSelectionView()
    }
}
