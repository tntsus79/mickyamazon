//
//  swiftview.swift
//  augmentapp
//
//  Created by Myles Holley on 3/2/23.
//


import RealityKit
import ARKit

class CustomARView: ARView{
    var DefultConfig: ARWorldTrackingConfiguration{
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        let config = ARWorldTrackingConfiguration()
        config.detectionImages = referenceImages
        return config
    }
    
    required init(frame frameRect:CGRect){
        super.init(frame: frameRect)
    }
    
    @MainActor required dynamic init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        session.run(DefultConfig)
    }
}
    

