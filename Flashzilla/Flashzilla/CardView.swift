//
//  CardView.swift
//  Flashzilla
//
//  Created by Autthawigorn Yortpiboot on 20/6/2567 BE.
//

import SwiftUI

extension Shape {
    func fill(using offset: CGSize) -> some View {
        if offset.width == 0 {
            self.fill(.white)
        } else if offset.width < 0 {
            self.fill(.red)
        } else {
            self.fill(.green)
        }
    }
}

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    
    @State private var offset = CGSize.zero
    @State private var isShowingAnswer = false
    
    let card: Card
    var reinsert: ((Bool) -> ())? = nil
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor ? .white :
                            .white // White fade out to show red & green colors
                        .opacity(1 - Double(abs(offset.width/50)))
                )
                .background(
                    accessibilityDifferentiateWithoutColor ? nil :
                        RoundedRectangle(cornerRadius: 25)
                        .fill(using: offset)
                )
                .shadow(color: .black.opacity(0.1), radius: 10)
            
            VStack {
                if accessibilityVoiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                    
                    if isShowingAnswer {
                        Text(card.answer)
                            .font(.title)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(offset.width / 5.0))
        .offset(x:offset.width * 5)
        .opacity(2 - Double(abs(offset.width / 50))) //Cards fade out
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged{ gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            reinsert?(false)
                        } else {
                            reinsert?(true)
                            offset = .zero
                        }
                    } else {
                        offset = .zero
                    }
                }
        )
        .animation(.bouncy, value: offset)
        .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}

#Preview {
    CardView(card: .example)
}
