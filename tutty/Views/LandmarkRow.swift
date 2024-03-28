//
//  LandmarkRow.swift
//  tutty
//
//  Created by Yusuf Erkoç on 29.03.2024.
//

import SwiftUI

struct LandmarkRow: View {
    let landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(
                    width: 50,
                    height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Group") {
    Group {
        LandmarkRow(landmark: ModelData().landmarks[0])
        LandmarkRow(landmark: ModelData().landmarks[1])

    }
}
