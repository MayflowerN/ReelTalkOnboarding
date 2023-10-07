//
//  GenreSelectionView.swift
//  ReelTalkOnboarding
//
//  Created by Ellie on 10/4/23.
//

import SwiftUI

struct GenreSelectionView: View {

    @State private var showMoviesSelectionView: Bool = false
    
    @State var chipArray: [ChipModel] = [
        ChipModel(isSelected: false, titleKey: "Action"),
        ChipModel(isSelected: false, titleKey: "Adventure"),
        ChipModel(isSelected: false, titleKey: "Animation"),
        ChipModel(isSelected: false, titleKey: "Biography"),
        ChipModel(isSelected: false, titleKey: "Comedy"),
        ChipModel(isSelected: false, titleKey: "Crime"),
        ChipModel(isSelected: false, titleKey: "Documentary"),
        ChipModel(isSelected: false, titleKey: "Drama"),
        ChipModel(isSelected: false, titleKey: "Family"),
        ChipModel(isSelected: false, titleKey: "Fantasy"),
        ChipModel(isSelected: false, titleKey: "History"),
        ChipModel(isSelected: false, titleKey: "Horror"),
        ChipModel(isSelected: false, titleKey: "Mystery"),
        ChipModel(isSelected: false, titleKey: "Reality"),
        ChipModel(isSelected: false, titleKey: "Romance"),
        ChipModel(isSelected: false, titleKey: "Sci-Fi"),
        ChipModel(isSelected: false, titleKey: "Sport"),
        ChipModel(isSelected: false, titleKey: "Thriller"),
        ChipModel(isSelected: false, titleKey: "War"),
        ChipModel(isSelected: false, titleKey: "Western")
    ]
    
    
    var selectedMovies: Int {
        chipArray.filter({ $0.isSelected }).count
    }
    
    var body: some View {
        ZStack {
            Color(hex: 0x212121)
                .edgesIgnoringSafeArea(.all)
            if showMoviesSelectionView {
                MoviesSelectionView()
            } else {
                
                
                
                VStack(spacing: 20) {
                    // Three Horizontal Progress Bars
                    HStack {
                        ForEach(0..<3) { index in
                            Rectangle()
                                .fill(selectedMovies > index ? Color.orange : Color.gray)
                                .foregroundColor(.clear)
                                .frame(width: 80, height: 4)
                                .background(.white.opacity(0.38))
                                .padding(.top, 15)
                            
                        }
                    }
                    
                    // Text instruction
                    // Mobile/H3
                    Text("Select your top 3 genres for movies and TV")
                        .font(.custom(.medium, size: 22))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(hex: 0xFFFFFFEB))
                        .frame(width: 312, alignment: .top)
                        .padding(.top, 25)
                    
                    Text("\(selectedMovies)/3 selected")
                        .font(.custom(.regular, size: 15))
                    
                        .kerning(0.3)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color(hex: 0xFFFFFF))
                        .padding(.bottom,15)
                    
                    GeometryReader { geo in
                        var width = CGFloat.zero
                        var height = CGFloat.zero
                        ZStack(alignment: .topLeading, content: {
                            ForEach(chipArray) { data in
                                Group {
                                    HStack(spacing: 4) {
                                        Text(data.titleKey)
                                            .font(.custom(.regular, size: 17))
                                            .lineLimit(1)
                                    }
                                    .padding(.vertical, 4)
                                    .padding(.horizontal, 25)
                                    .frame(height: 33)
                                    .foregroundColor(data.isSelected ? Color(hex: 0x222222) : .white)
                                    .background(data.isSelected ? .white : Color(hex: 0x222222))
                                    .cornerRadius(20)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white, lineWidth: 1)
                                        
                                    ).onTapGesture {
                                        toggleSelection(for: data)
                                    }
                                }
                                .padding(.all, 5)
                                .alignmentGuide(.leading) { dimension in
                                    if (abs(width - dimension.width) > geo.size.width) {
                                        width = 0
                                        height -= dimension.height
                                    }
                                    let result = width
                                    if data.id == chipArray.last!.id {
                                        width = 0
                                    } else {
                                        width -= dimension.width
                                    }
                                    return result
                                }
                                .alignmentGuide(.top) { dimension in
                                    let result = height
                                    if data.id == chipArray.last!.id {
                                        height = 0
                                    }
                                    return result
                                }
                            }
                        })
                    }
                    // Continue Button
                    SquareButton(title: "Continue") {
                        showMoviesSelectionView = true
                 
                    }
                }
                .padding()
            }
        }
        .onReceive($chipArray.publisher, perform: { value  in
            
        })
    }
    
    private func toggleSelection(for item: ChipModel) {
        if let index = chipArray.firstIndex(where: { $0.id == item.id }) {
            // If this genre is already selected, always allow de-selection
            if chipArray[index].isSelected {
                chipArray[index].isSelected.toggle()
            } else {
               
                if selectedMovies < 3 {
                    chipArray[index].isSelected.toggle()
               
                    
                }
            }
        }
    }
}


struct GenreSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GenreSelectionView()
    }
}

