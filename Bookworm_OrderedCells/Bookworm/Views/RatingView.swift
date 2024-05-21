//
//  RatingView.swift
//  Bookworm
//
//  Created by Autthawigorn Yortpiboot on 18/5/2567 BE.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int
    //@Binding is used for structs, but @Bindable is used for observable classes.
    
    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { starIndex in
                Button {
                    rating = starIndex   // Update the rating to the star that was pressed
                } label: {
                    image(for: starIndex)
                        .foregroundStyle(starIndex > rating ? offColor : onColor)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    func image(for starIndex: Int) -> Image {
        if starIndex > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    RatingView(rating: .constant(4))
}
