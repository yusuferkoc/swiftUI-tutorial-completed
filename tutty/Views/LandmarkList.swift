//
//  LandmarkList.swift
//  tutty
//
//  Created by Yusuf Erkoç on 29.03.2024.
//

import SwiftUI

struct LandmarkList: View {
    
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    var body: some View {
        NavigationSplitView {
            List{  
                Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites only")
            }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                }
            }
        }
            .navigationTitle("Landmarks")


        } detail: {
            Text("select a landmark")
        }
        
        

    
    }
}

#Preview {
    LandmarkList()
}
