//
//  HomePage.swift
//  HomePage
//
//

import SwiftUI

struct HomePage : View {
    @State var entity = EntityViewModel()
    @State var bottomBarViewState: BottomNavState = .modelPicker
    
    var body: some View {
        ZStack {
            ARViewContainer(entity: $entity)
            
            VStack {
                Spacer()
                if bottomBarViewState == .modelPicker {
                    ModelPickerView(entity: $entity, bottomBarViewState: $bottomBarViewState)
                }
                else if bottomBarViewState == .materialPicker {
                    MaterialPickerView(entity: $entity, bottomBarViewState: $bottomBarViewState)
                }
                else {
                    CreateObjectView(entity: $entity, bottomBarViewState: $bottomBarViewState)
                }
            }
        }
    }
}
