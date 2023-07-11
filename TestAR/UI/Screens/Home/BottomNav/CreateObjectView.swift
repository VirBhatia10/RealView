//
//  CreateObjectView.swift
//  CreateObjectView
//
//

import SwiftUI
import RealityKit
import FocusEntity


struct CreateObjectView : View {
    @EnvironmentObject var entity: EntityViewModel
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
                entity.destroyFocusEntity()
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
