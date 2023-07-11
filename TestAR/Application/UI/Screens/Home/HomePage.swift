//
//  HomePage.swift
//  HomePage
//
//

import SwiftUI

struct HomePage : View {
    @StateObject var entity = EntityViewModel()
    @State var bottomBarViewState: BottomNavState = .modelPicker
    
    var body: some View {
        ZStack {
            ARViewContainer(entity: entity)
            
            VStack {
                
                Spacer()
                
                if bottomBarViewState == .modelPicker {
                    ModelPickerView(bottomBarViewState: $bottomBarViewState)
                        .environmentObject(entity)
                }
                else if bottomBarViewState == .materialPicker {
                    MaterialPickerView(bottomBarViewState: $bottomBarViewState)
                        .environmentObject(entity)
                }
                else {
                    CreateObjectView(bottomBarViewState: $bottomBarViewState)
                        .environmentObject(entity)
                }
            }
        }
        .ignoresSafeArea()
    }
}
