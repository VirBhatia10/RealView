//
//  ModelPickerView.swift
//  ModelPickerView
//
//

import SwiftUI
import RealityKit

struct MaterialPickerView : View {
    @EnvironmentObject var entity: EntityViewModel
    @Binding var bottomBarViewState: BottomNavState

    var body: some View {
        let colors: [ColorModel] = [
            ColorModel(color: .red),
            ColorModel(color: .blue),
            ColorModel(color: .green),
            ColorModel(color: .yellow),
            ColorModel(color: .orange),
            ColorModel(color: .purple),
        ]
        
        ScrollView(.horizontal) {
            HStack {
                Spacer()
                
                ForEach(colors, id: \.id) { color in
                    Button(action: {
                        entity.materialPicker(entityMaterial: SimpleMaterial(color: color.color, isMetallic: false))
                        bottomBarViewState = .createObject
                    }, label: {
                        Circle()
                            .fill(.white)
                            .frame(width: 70)
                            .overlay(
                                Circle()
                                    .foregroundColor(Color(color.color))
                                    .frame(width: 60)
                            )
                    })
                    
                }
                
                Spacer()
            }
            .padding(15)
        }
    }
}
