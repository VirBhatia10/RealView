//
//  ModelPickerVIew.swift
//  TestAR
//
//  Created by Avataar on 27/06/23.
//

import Foundation
import SwiftUI
import RealityKit
import FocusEntity

struct ModelPickerView : View {
    
    @Binding var entity: EntityVM
    @Binding var bottomBarViewState: BottomNavState

    var body: some View {
        HStack {
            Spacer()
            
            Button {
                entity.modelPicker(modelName: "chair_swan", entityName: "RedChairSeat")
                bottomBarViewState = .materialPicker
            } label: {
                Image("chairThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Button {
                entity.modelPicker(modelName: "gramophone", entityName: "GramophoneBoxBody")
                bottomBarViewState = .materialPicker
            } label: {
                Image("gramophoneThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Button {
                entity.modelPicker(modelName: "wateringcan", entityName: "WateringCanBody")
                bottomBarViewState = .materialPicker
            } label: {
                Image("wateringcanThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Spacer()
        }
        .padding(15)
    }
}
