//
//  Sphere.swift
//  Homework 1
//
//  Created by Alaina Thompson on 1/25/22.
//

import SwiftUI

class Sphere: NSObject,ObservableObject {

    var radius = 0.0
    @Published var volume = 0.0
    @Published var surfaceArea = 0.0
    @Published var volumeText = ""
    @Published var surfaceAreaText = ""
    @Published var radiusString = "1.0"
    @Published var enableButton = true
    
    
    
    
    func initWithRadius(r: Double) async -> Bool {
        
        radius = r
            
            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
        
            
                taskGroup.addTask { let _ = await self.calculateVolume(r: self.radius)}
                taskGroup.addTask { let _ = await self.calculateSurfaceArea(r: self.radius)}
            
        }
            
            await setButtonEnable(state: true)
                                                 
       
        

        return true
        
    }
    
    
    
    
    
    
    func calculateVolume(r: Double) async -> Double {
            
            //Volume = pi * (4/3) * pow(r, 3)
            
            let calculatedVolume = Double.pi * (4/3) * pow(r, 3)
            let newVolumeText = String(format: "%7.5f", calculatedVolume)
            
            await updateVolume(volumeTextString: newVolumeText)
            await newVolumeValue(volumeValue: calculatedVolume)
            
            return calculatedVolume
            
            
        }
    
    
    
    
    
    
    
    func calculateSurfaceArea(r: Double) async -> Double {
           
           //surfaceArea = pi * 4 * pow(r, 2)
           
           
           let calculatedSurfaceArea = pow(r, 2)*4*Double.pi
           let newSurfaceAreaText = String(format: "%7.5f", calculatedSurfaceArea)
           
           await updateSurfaceArea(surfaceAreaTextString: newSurfaceAreaText)
           await newSurfaceAreaValue(surfaceAreaValue: calculatedSurfaceArea)
           
           return calculatedSurfaceArea
           
       }
    
    
    
    
    
    
    @MainActor func setButtonEnable(state: Bool){
           
           
           if state {
               
               Task.init {
                   await MainActor.run {
                       
                       
                       self.enableButton = true
                   }
               }
               
               
                   
           }
           else{
               
               Task.init {
                   await MainActor.run {
                       
                       
                       self.enableButton = false
                   }
               }
                   
           }
           
       }
       
      
       @MainActor func updateVolume(volumeTextString: String){
           
           volumeText = volumeTextString
           
       }
       
       @MainActor func newVolumeValue(volumeValue: Double){
           
           self.volume = volumeValue
           
       }
       
       @MainActor func newSurfaceAreaValue(surfaceAreaValue: Double){
           
           self.surfaceArea = surfaceAreaValue
           
       }
       
      
       @MainActor func updateSurfaceArea(surfaceAreaTextString:String){
           
           surfaceAreaText = surfaceAreaTextString
           
           
       }
    
    
    
    
    
    
    
    
    
    
}
