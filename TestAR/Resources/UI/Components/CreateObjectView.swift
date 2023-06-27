//
//  CreateObjectView.swift
//  TestAR
//
//  Created by Avataar on 27/06/23.
//

import Foundation
import SwiftUI
import RealityKit
import FocusEntity


struct createObjectView : View {
    @Binding var entity: EntityVM
    @Binding var bottomBarViewState: BottomNavState

    var body: some View {
        HStack {
            Spacer()
            
            Button {
                entity.createObject()
                bottomBarViewState = .modelPicker
            } label: {
                Circle()
                    .fill(.green)
                    .frame(width: 75, alignment: .center)
                    .overlay(
                        Image(systemName: "checkmark").imageScale(.large).foregroundColor(.white)
                    )
                    .padding()
            }
            
            Spacer()
            
            Button {
                entity.focusEntity.destroy()
                bottomBarViewState = .modelPicker
            } label: {
                Circle()
                    .fill(.red)
                    .frame(width: 75, alignment: .center)
                    .overlay(
                        Image(systemName: "multiply").imageScale(.large).foregroundColor(.white))
            }
            .padding()
            
            Spacer()
        }
        .padding(15)
    }
}
