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

struct materialPickerView : View {
    
    @Binding var entity: EntityVM
    @Binding var bottomBarViewState: BottomNavState

    var body: some View {
        
        let colors: [IdentifiableColor] = [
            IdentifiableColor(color: .red),
            IdentifiableColor(color: .blue),
            IdentifiableColor(color: .green),
            IdentifiableColor(color: .yellow),
            IdentifiableColor(color: .orange),
            IdentifiableColor(color: .purple),
        ]
        
        ScrollView(.horizontal) {
            HStack {
                Spacer()
                
                ForEach(colors, id: \.self.id) { color in
                    Button {
                        entity.materialPicker(entityMaterial: SimpleMaterial(color: color.color, isMetallic: false))
                        bottomBarViewState = .createObject
                    } label: {
                        Circle()
                            .fill(.white)
                            .frame(width: 70)
                            .overlay(
                                Circle()
                                    .foregroundColor(Color(color.color))
                                    .frame(width: 60)
                            )
                    }
                }
                Spacer()
            }
            .padding(15)
        }
    }
}
