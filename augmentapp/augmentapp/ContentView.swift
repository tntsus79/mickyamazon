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
         let boxAnchor = Experience.Box()
        context.coordinator.boxscene = boxAnchor
        
        let entity2 = boxAnchor.box! as! (Entity & HasPhysics)
        
        entity2.physicsBody = .none
        
        let entity3 = boxAnchor.ball! as! (Entity & HasPhysics)
        
        entity3.physicsBody = .none
        
        var hit:CustomStringConvertible = boxAnchor.notifications.ballbounce as! CustomStringConvertible
        /storage of numbers/
        var hitcount = 0
       let hitstring = String(hit)
        let hitbool = 
        if(hit == true){
            
        }
       
        while hitcount != 20{
            
        }
        
     
        
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
