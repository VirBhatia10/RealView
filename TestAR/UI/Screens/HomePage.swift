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
    @State var bottomBarViewState: Bool = true
    var body: some View {
        
        ZStack {
            
            ARViewContainer(entity: $entity)
            
            VStack {
                Spacer()
                if bottomBarViewState == true {
                    objectPickerView(entity: $entity, bottomBarViewState: $bottomBarViewState)
                }
                else {
                    objectPlacerView(entity: $entity, bottomBarViewState: $bottomBarViewState)
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

struct objectPickerView : View {
    
    @Binding var entity: EntityVM
    @Binding var bottomBarViewState: Bool

    var body: some View {
        HStack {
            Spacer()
            
            Button {
                entity.modelChanger(modelCode: "chair")
                bottomBarViewState.toggle()
            } label: {
                Image("chairThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Button {
                entity.modelChanger(modelCode: "gramophone")
                bottomBarViewState.toggle()
            } label: {
                Image("gramophoneThumbnail")
                    .resizable()
                    .frame(width: 90, height: 90, alignment: .center)
                    .cornerRadius(45)
                    .padding()
            }
            
            Button {
                entity.modelChanger(modelCode: "plane")
                bottomBarViewState.toggle()
            } label: {
                Image("planeThumbnail")
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

struct objectPlacerView : View {
    @Binding var entity: EntityVM
    @Binding var bottomBarViewState: Bool

    var body: some View {
        HStack {
            Spacer()
            
            Button {
                entity.confirmObject()
                bottomBarViewState.toggle()
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
                bottomBarViewState.toggle()
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

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
#endif
