//
//  FeaturedCard.swift
//  tutty
//
//  Created by Yusuf Erkoç on 29.04.2024.
//

import SwiftUI

struct FeaturedCard: View {
    var landmark: Landmark
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark:landmark)
            }
    }
}

struct TextOverlay: View {
    var landmark:Landmark
    var body: some View {
        
        var gradient: LinearGradient {
             .linearGradient(
                 Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
                 startPoint: .bottom,
                 endPoint: .center)
         }
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment:.leading){
                Text(landmark.name)
                    .font(.headline)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeaturedCard(landmark: ModelData().features[0])
        .aspectRatio(3/2,contentMode: .fit)
}
