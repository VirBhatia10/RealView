//
//  ModelPickerVIew.swift
//  ModelPickerView
//
//

import SwiftUI
import RealityKit

struct ModelPickerView : View {
    @EnvironmentObject var entity: EntityViewModel
    @Binding var bottomBarViewState: BottomNavState

    var body: some View {
        HStack {
            Spacer()
            
            Button {
                entity.modelPicker(modelName: "ChairSwan", entityName: "RedChairSeat")
                bottomBarViewState = .materialPicker
                print("modelpicker button pressed")
            } label: {
                Image("ChairThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Button {
                entity.modelPicker(modelName: "Gramophone", entityName: "GramophoneBoxBody")
                bottomBarViewState = .materialPicker
            } label: {
                Image("GramophoneThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Button {
                entity.modelPicker(modelName: "WateringCan", entityName: "WateringCanBody")
                bottomBarViewState = .materialPicker
            } label: {
                Image("WateringCanThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
//            Button {
//                entity.modelPicker(modelName: "Arrow", entityName: "Arrow")
//                bottomBarViewState = .materialPicker
//                print("modelpicker button pressed")
//            } label: {
//                Image("ArrowThumbnail")
//                    .resizable()
//                    .frame(width: 90, height: 90, alignment: .center)
//                    .cornerRadius(45)
//                    .padding()
//            }
            
            Spacer()
        }
        .padding(15)
    }
}
