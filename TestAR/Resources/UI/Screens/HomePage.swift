//
//  ContentView.swift
//  TestAR
//
//  Created by Avataar on 16/06/23.
//

import SwiftUI
import RealityKit
import FocusEntity

struct HomePage : View {
    @State var entity = EntityVM()
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
                    materialPickerView(entity: $entity, bottomBarViewState: $bottomBarViewState)
                }
                else {
                    createObjectView(entity: $entity, bottomBarViewState: $bottomBarViewState)
                }
            }
        }
    }
}


struct ARViewContainer: UIViewRepresentable {
    @Binding var entity: EntityVM
    
    func makeUIView(context: Context) -> ARView {

        return entity.customARView

    }

    func updateUIView(_ uiView: ARView, context: Context) {}
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
#endif
