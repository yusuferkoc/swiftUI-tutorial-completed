//
//  LandmarkDetail.swift
//  tutty
//
//  Created by Yusuf Erkoç on 30.03.2024.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData
      var landmark: Landmark


      var landmarkIndex: Int {
          modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
      }
    

    var body: some View {
        @Bindable var modelData = modelData

        ScrollView{
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            
            VStack(alignment:.leading){
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    .foregroundStyle(Color.green)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)

                }
                HStack{
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                
                Text(landmark.description)
            }
            .padding()
            Spacer()
        }
 
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    LandmarkDetail(landmark:ModelData().landmarks[0])
    
}
