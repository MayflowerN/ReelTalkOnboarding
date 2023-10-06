//
//  GenreSelectionView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

struct GenreSelectionView: View {
   //let columns = [GridItem(.adaptive(minimum: 117)), GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 117))]
    let genres = ["Action", "Adventure", "Animation", "Biography", "Comedy", "Crime", "Documentary", "Drama", "Family", "Fantasy", "History", "Horror", "Mystery", "Reality", "Romance", "Sci-Fi", "Sport", "Thriller", "War", "Western"]
    @State private var selectedGenres: [String] = []
    @State private var showMoviesSelectionView: Bool = false
    
    func chunkedGenres(size: Int) -> [[String]] {
        stride(from: 0, to: genres.count, by: size).map {
            Array(genres[$0..<min($0 + size, genres.count)])
        }
    }

    var body: some View {
        ZStack {
            Color(red: 0.13, green: 0.13, blue: 0.13)
                .edgesIgnoringSafeArea(.all)
            if showMoviesSelectionView {
                MoviesSelectionView()
            } else {
                VStack(spacing: 20) {
                    // Three Horizontal Progress Bars
                    HStack {
                        ForEach(0..<3) { index in
                            Rectangle()
                                .fill(selectedGenres.count > index ? Color.orange : Color.gray)
                                .foregroundColor(.clear)
                                .frame(width: 80, height: 4)
                                .background(.white.opacity(0.38))
                                .padding(.top, 15)
                            
                        }
                    }
                    
                    // Text instruction
                    // Mobile/H3
                    Text("Select your top 3 genres for movies and TV")
                        .font(Font.custom("Avenir Next", size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white.opacity(0.92))
                        .frame(width: 312, alignment: .top)
                        .padding(.top, 25)
                    
                    Text("\(selectedGenres.count)/3 selected")
                        .font(
                            Font.custom("Avenir Next", size: 15)
                                .weight(.medium)
                        )
                        .kerning(0.3)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        .padding(.bottom,15)
                    
                    // Genres in pill-shaped buttons
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.fixed(139), spacing: 5),
                            GridItem(.fixed(115), spacing: 5),
                            GridItem(.fixed(115), spacing: 5)
                        ]) {
                            ForEach(genres, id: \.self) { genre in
                                if selectedGenres.contains(genre) {
                                    Text(genre)
                                        .font(Font.custom("Avenir Next", size: 17))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13)) // Text color for selected genre
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background(Color.white.opacity(0.92))
                                        .cornerRadius(30)
                                    
                                        .onTapGesture {
                                            selectedGenres.removeAll { $0 == genre }
                                        }
                                } else {
                                    Text(genre)
                                        .font(Font.custom("Avenir Next", size: 17))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.white.opacity(0.92))
                                        .padding(.horizontal, 16)
                                        .padding(.vertical, 6)
                                        .background(Color.clear)
                                        .cornerRadius(30)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .inset(by: 0.5)
                                                .stroke(Color.white.opacity(0.92), lineWidth: 1)
                                        )
                                        .onTapGesture {
                                            if selectedGenres.count < 3 {
                                                selectedGenres.append(genre)
                                            }
                                        }
                                }
                            }
                        }
                        .padding(.top, 10)
                    }

                    
                    
                    
                   
                    
                    // Continue Button
                    Button (action: {
                        showMoviesSelectionView = true
                        
                    }) {
                        // Mobile/Headline
                        Text("Continue")
                            .font(Font.custom("Avenir Next", size: 17))
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(red: 0.13, green: 0.13, blue: 0.13))
                            .padding(10)
                            .frame(width: 300, height: 48, alignment: .center)
                            .background(Color(red: 1, green: 0.66, blue: 0.14))
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
        }
    }
}

struct GenreSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionView()
    }
}
