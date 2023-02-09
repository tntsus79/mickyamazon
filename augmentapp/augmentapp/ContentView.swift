//
//  ContentView.swift
//  augmentapp
//
//  Created by Myles Holley on 2/9/23.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
   
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func makeUIView(context: Context) -> ARView {
        
             // Do something with entity...
         
        let arView = ARView(frame: .zero)
        context.coordinator.arView = arView
       
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        context.coordinator.boxscene = boxAnchor
        boxAnchor.actions.hits.onAction = handleTapOnEntity(_:)
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    func handleTapOnEntity(_ entity: Entity?) {
        guard let entity = entity else { return }
        // Do something with entity...
    }

    func updateUIView(_ uiView: ARView, context: Context) {}
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}
class Coordinator: NSObject
{
    weak var arView: ARView?
    weak var boxscene: Experience.Box?
    override init(){
        super.init()
        update()
    }
    func update(){
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            print("Timer fired!")
            
            self.boxscene!.notifications.ballbounce.post()
        }
    }}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
