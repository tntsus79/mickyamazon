//
//  ContentView.swift
//  augmentapp
//
//  Created by Myles Holley on 2/9/23.
//

import SwiftUI
import RealityKit
struct SimpleGameResult {
    let id = UUID()
    let score: Int

}
struct ContentView : View {
   //binding variable
    @State var desiredscore = ""
    
    let results = [
        SimpleGameResult(score: 8)
    
    ]
   
    var body: some View {
        ARViewContainer(desiredscore: $desiredscore).edgesIgnoringSafeArea(.all)
        
         
        
       
            
           
        //creation of views in loop
        VStack(alignment: .leading,spacing: 10) {
        ForEach(results, id: \.id) { result in
                       Text("Result: \(result.score)")
                                                
                    
                   }//reading text from textfield
                          TextField("enter your desired score",text: $desiredscore)
                   Text("Your desired score is \(desiredscore)")               }
               }
}

struct ARViewContainer: UIViewRepresentable {
   
    
    @Binding var desiredscore: String
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func makeUIView(context: Context) -> ARView {
     
        
             // Do something with entity...
         
        let arView = ARView(frame: .zero)
        context.coordinator.arView = arView
       
        // Load the "Box" scene from the "Experience" Reality File
        
        let boxAnchor = try! Experience.loadBox()
        
        context.coordinator.boxscene = boxAnchor
        //const variable

        boxAnchor.actions.ballbounce.onAction = handleTapOnEntity(_:)
  
        
       
       
      
        
        
       
  
       
        
        //function as parameter
        boxAnchor.actions.succcollide.onAction  = handleTapOnEntity(_:)
       
      
        
        
        
        

     
      
        
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    func handleTapOnEntity(_ entity: Entity?) {
        guard let entity = entity else { return }
        // Do something with entity...
        let rolls = rolldice2(sides:6,count:4)
        //storage of numbers/
        var hitcount = 0
        hitcount += 1
        var bing = ""
        var boatbruh = ""
        var cellb = " hit"
        enum responses{
           case curentlyplaying, done
        }
        
        var tong = responses.curentlyplaying
         
        
        //switch statement
        switch tong {
        case .curentlyplaying: print("currently playing")
        case .done: print("done with game")
        default:
           print("nice")
        }
        if(bing == "1"){
         boatbruh = "good"
        }else if(bing == "2"){
            boatbruh = "bad"
        }
        if(bing == "1"){
            
        }
        //joining of strings
        var cellbboat = boatbruh + cellb    }
    
    func randomdirect(vectorx: Int, vectorz: Int, vectory: Int )->Int{
       
        //return multiple values from function
        var vectors = [Int(), Int(), Int()]
        var vectorsx = Int.random(in: -2...6)
        var vectorsy =
        Int.random(in: -2...6)
        var vectorsz = Int.random(in: -2...6)
        vectors.append(vectorsx)
        vectors.append(vectorsy)
        vectors.append(vectorsz)
        return vectorsx
        return vectorsy
        return vectorz
      
    }
    //customize parameter label
    func rolldice2(sides: Int, count:Int)->[Int]{
        var rolls = [Int]()
        for _ in 1...count{
            let roll = Int.random(in:1...sides)
            rolls.append(roll)
           
        }
         rolls = rolldice2(sides:6,count:4)
        return rolls
        
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




