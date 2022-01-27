//
//  BoundingBox.swift
//  Homework 1
//
//  Created by Alaina Thompson on 1/25/22.
//

import SwiftUI


class BoundingBox: NSObject,ObservableObject {
    
    
    @Published var boundingBoxVolume = 0.0
    @Published var boundingBoxSurfaceArea = 0.0
    @Published var boundingBoxVolumeText = ""
    @Published var boundingBoxSurfaceAreaText = ""
    @Published var radiusString = 0.0
    @Published var sideLengthString = 0.0
    @Published var radius = 0.0
    @Published var sideLength = 0.0
    
    @Published var boxEnableButton = true
    
    func initWithBoundingBox(l: Double, r: Double) async -> Bool {
      sideLength = l
      radius = r
      
        
        
            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
        
            
                taskGroup.addTask { let _ = await self.calculateBoundingBoxVolume()}
                taskGroup.addTask { let _ = await self.calculateBoundingBoxSurfaceArea()}
            
        }
        await setBoxButtonEnable(state: true)
        return true

    }
    
    func calculateBoundingBoxVolume() async -> Double {
            
        if sideLength >= 2*radius {
             
            let calculatedBoundingBoxVolume = pow(sideLength, 3.0) - (Double.pi * (4/3) * pow(radius, 3))
                 let newBoundingBoxVolumeText = String(format: "%7.5f", calculatedBoundingBoxVolume)
            
                 await updateBoundingBoxVolume(boundingBoxVolumeTextString: newBoundingBoxVolumeText)
                 await newBoundingBoxVolumeValue(boundingBoxVolumeValue: calculatedBoundingBoxVolume)
                 return calculatedBoundingBoxVolume

             }
        else {
               print("Bounding box is too small for sphere of this radius")
            
        }
        return sideLengthString
    }
    
    func calculateBoundingBoxSurfaceArea() async -> Double {
        
        let calculatedBoundingBoxSurfaceArea = pow(sideLength, 2.0)*6
        let newBoundingBoxSurfaceAreaText = String(format: "%7.5f", calculatedBoundingBoxSurfaceArea)
        
        await updateBoundingBoxSurfaceArea(boundingBoxSurfaceAreaTextString: newBoundingBoxSurfaceAreaText)
        await newBoundingBoxSurfaceAreaValue(boundingBoxSurfaceAreaValue: calculatedBoundingBoxSurfaceArea)
        return calculatedBoundingBoxSurfaceArea
    }
    
    
    
    @MainActor func setBoxButtonEnable(state: Bool){
           
           
           if state {
               
               Task.init {
                   await MainActor.run {
                       
                       
                       self.boxEnableButton = true
                   }
               }
               
               
                   
           }
           else{
               
               Task.init {
                   await MainActor.run {
                       
                       
                       self.boxEnableButton = false
                   }
               }
                   
           }
           
       }
       
      
       @MainActor func updateBoundingBoxVolume(boundingBoxVolumeTextString: String){
           
           boundingBoxVolumeText = boundingBoxVolumeTextString
           
       }
       
       @MainActor func newBoundingBoxVolumeValue(boundingBoxVolumeValue: Double){
           
           self.boundingBoxVolume = boundingBoxVolumeValue
           
       }
       
       @MainActor func newBoundingBoxSurfaceAreaValue(boundingBoxSurfaceAreaValue: Double){
           
           self.boundingBoxSurfaceArea = boundingBoxSurfaceAreaValue
           
       }
       
      
       @MainActor func updateBoundingBoxSurfaceArea(boundingBoxSurfaceAreaTextString:String){
           
           boundingBoxSurfaceAreaText = boundingBoxSurfaceAreaTextString
           
           
       }


    
    
    
}
