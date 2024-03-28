//
//  FavoriteButton.swift
//  tutty
//
//  Created by Yusuf Erkoç on 19.04.2024.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet : Bool
    var body: some View {
        Button{
            isSet.toggle()
        } label: {
            Label("Toggle Favorite",systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
