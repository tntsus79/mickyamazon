//
//  ContentView.swift
//  basicfacear
//
//  Created by Myles Holley on 3/9/23.
//

import SwiftUI
import RealityKit
import ARKit
struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.session.run(ARFaceTrackingConfiguration())
        // Load the "Box" scene from the "Experience" Reality File
        let faceAnchor = try! Nexttry.loadScene()
        let sphereEntity = ModelEntity(mesh: .generateSphere(radius: 0.1), materials: [SimpleMaterial(color: .white, isMetallic: false)])
  
        
       let sphereAnchor = AnchorEntity(.face)
        
        sphereAnchor.addChild(sphereEntity)
        
        arView.scene.anchors.append(sphereAnchor)
        
        
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
