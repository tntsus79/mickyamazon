import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        // Create an ARView
        let arView = ARView(frame: .zero)
        
        // Load the TableScene
        let tableScene: Experience.TableScene = try! Experience.loadTableScene()
        
        // Add the Table to the scene
        arView.scene.anchors.append(tableScene)
        
        tableScene.actions.endSequence.onAction = context.coordinator.ShowTable(_:)
        
        // Return the ARView
        return arView
    }

    
    func updateUIView(_ uiView: ARView, context: Context) {
        // Update the ARView if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        weak var view: ARView?
        weak var scene: Experience.TableScene?
        
        func ShowTable(_ entity: Entity?) {
            print("notification received")
            scene?.notifications.showTable.post()
            print("green table revealed")
        }
        }
    }


struct ARSceneView: View {
    var body: some View {
        ARViewContainer()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Find the table and tap it!")
                .padding()
            ARSceneView()
                .frame(height: 400)
        }
    }
}

