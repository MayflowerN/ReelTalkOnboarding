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
            Color(red: 0.13, green: 0.13, blue: 0.13)
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
                        .font(Font.custom("Avenir Next", size: 28))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 312, alignment: .top)
                    
                    Text("\(selectedMovies.count)/5 selected")
                        .font(Font.custom("Avenir Next", size: 15).weight(.medium))
                        .kerning(0.3)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                    
                    TextField("Search to add more", text: $searchMovie)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                        .frame(width: 326, height: 48, alignment: .leading)
                        .background(Color.white.opacity(0.92))
                        .cornerRadius(24)
                        .overlay(
                            HStack {
                                Image("Search Icon")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 16)
                                Spacer()
                            }
                        )
                    
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(movieArray, id: \.self) { movie in
                                if movie.lowercased().contains(searchMovie.lowercased()) || searchMovie.isEmpty {
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
                                                            .stroke(selectedMovies.contains(movie) ? Color(red: 1, green: 0.66, blue: 0.14) : Color.clear, lineWidth: 2))
                                            
                                            if selectedMovies.contains(movie) {
                                                Image("Circle") // Using system image for checkmark
                                                    .foregroundColor(Color(red: 1, green: 0.66, blue: 0.14))
                                                    .padding(5)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(10)
                        
                    }
                    Button (action: {
                        showTVShowsSelectionView = true
                    }) {
                        Text("Continue")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(10)
                            .frame(width: 300, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.66, blue: 0.14))
                            .cornerRadius(8)
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
