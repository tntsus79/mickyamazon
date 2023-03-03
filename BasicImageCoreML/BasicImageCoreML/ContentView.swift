//
//  ContentView.swift
//  BasicImageCoreML
//

//  Below we are importing our core libraries which are needed to run the app. Vision and CoreML are necessary because they play off each other

import SwiftUI
import CoreML
import Vision

struct ContentView: View {
    //creates a variable to display the forecast information from ResNet50
    @State var classificationLabel = ""
    
    
    //we use createClassificationRequest to make a request to the CoreML library where instructions are encapsulated and waiting for image information to be sent
    func createClassificationRequest()-> VNCoreMLRequest {
        do {
            //set up our configuration for ML Models by creating an instance of the model
            let configuration = MLModelConfiguration()
            //This line creates an instance of the VNCoreMLModel class with the name model and includes the Resnet50 configuration in argument for the initializer so that our model reaches out and uses the library
            let model = try VNCoreMLModel(for: Resnet50(configuration: configuration).model)
            
            //here is how we make a request to our CoreML library, we let the var request be equal to our VNCoreMLRequest and then attach our model and the completionHandler tells ResNet50 to start analyzing the sent image.  In completionHandler, specify the processing to be performed after the processing of the rest is complete--and if we don't get what we want send an error
            let request = VNCoreMLRequest(model: model,completionHandler: {request, error in
                performClassification(request: request)
                
            })
            
            return request
            //we need a catch in case an error is generated
        } catch {
            fatalError("model can't be loaded")
            
        }
    }
    
    //in performClassification we receive a parameter of type VNRequest.  Then we create a constant value called results and make that equal to our request or else send it back
    
    func performClassification(request: VNRequest){
        guard let results = request.results else {
            return
        }
        //We set classification = to results and VNClassificationObservation is a class that handles the image classification infomration generated as a result of a request
        let classification = results as! [VNClassificationObservation]
        
        //then we assign the classification label with the returned information from Resnet50, when we use the [0] we are saying to use the information coming from the library with the highest probability
        classificationLabel = classification[69].identifier
    }
    
    func classifyImage (image: UIImage){//receives a parameter
        //sets ciImage = to image information being sent to me or if that information is corrput it generates and error
        guard let ciImage = CIImage(image: image) else {
            fatalError("Cannot convert to CIImage")
        }
        //set up a varialbe to send a request to VNImageRequest hander library
        let handler = VNImageRequestHandler(ciImage: ciImage)
        
        //tell the library that you have a request for classification
        let classificationRequest = createClassificationRequest()
        do {
            //perform the classificiation
            try handler.perform([classificationRequest])
            //or send and error
        } catch {
            fatalError("Image classification failed")
        }
    }
    
    
    //We want to display our content in a simple VStack so here wi load that
    var body: some View {
        VStack {
            
            //creates a Vstack view for the text & image
            Text(classificationLabel)
                .padding()
                .font(.title)
            
            Image ("pheasant")//this loads the dog image file
                .resizable()//this lets it be resizeable
                .frame(width:300, height: 200)//this sets initial size parameters
            
            
            
            Button(action: {
                //when the button is pressed the classifyImage method is called and passed the parameter of UIImage dog
                classifyImage(image: UIImage(named:"pheasant")!)
            }, label: {
                //sets the text in the button to prompt the user
                Text("What is this Image?")
                    .padding()
            })

            
            
            
            
            }
            
        }
    }
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
