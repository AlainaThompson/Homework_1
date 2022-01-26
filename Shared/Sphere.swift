//
//  Sphere.swift
//  Homework 1
//
//  Created by Alaina Thompson on 1/25/22.
//

import SwiftUI

class Sphere: NSObject,ObservableObject {

    var radius = 0.0
    @Published var sphereVolume = 0.0
    @Published var sphereSurfaceArea = 0.0
    @Published var sphereVolumeText = ""
    @Published var sphereSurfaceAreaText = ""
    @Published var radiusString = "1.0"
    @Published var enableButton = true
    
    
    
    
    func initWithRadius(r: Double) async -> Bool {
        
        radius = r
            
            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
        
            
                taskGroup.addTask { let _ = await self.calculateSphereVolume(r: self.radius)}
                taskGroup.addTask { let _ = await self.calculateSphereSurfaceArea(r: self.radius)}
            
        }
            
            await setButtonEnable(state: true)
                                                 
       
        

        return true
        
    }
    
    
    
    
    
    
    func calculateSphereVolume(r: Double) async -> Double {
            
            //Volume = pi * (4/3) * pow(r, 3)
            
            let calculatedSphereVolume = Double.pi * (4/3) * pow(r, 3)
            let newSphereVolumeText = String(format: "%7.5f", calculatedSphereVolume)
            
            await updateSphereVolume(sphereVolumeTextString: newSphereVolumeText)
            await newSphereVolumeValue(sphereVolumeValue: calculatedSphereVolume)
            
            return calculatedSphereVolume
            
            
        }
    
    
    
    
    
    
    
    func calculateSphereSurfaceArea(r: Double) async -> Double {
           
           //surfaceArea = pi * 4 * pow(r, 2)
           
           
           let calculatedSphereSurfaceArea = pow(r, 2)*4*Double.pi
           let newSphereSurfaceAreaText = String(format: "%7.5f", calculatedSphereSurfaceArea)
           
           await updateSphereSurfaceArea(sphereSurfaceAreaTextString: newSphereSurfaceAreaText)
           await newSphereSurfaceAreaValue(sphereSurfaceAreaValue: calculatedSphereSurfaceArea)
           
           return calculatedSphereSurfaceArea
           
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
       
      
       @MainActor func updateSphereVolume(sphereVolumeTextString: String){
           
           sphereVolumeText = sphereVolumeTextString
           
       }
       
       @MainActor func newSphereVolumeValue(sphereVolumeValue: Double){
           
           self.sphereVolume = sphereVolumeValue
           
       }
       
       @MainActor func newSphereSurfaceAreaValue(sphereSurfaceAreaValue: Double){
           
           self.sphereSurfaceArea = sphereSurfaceAreaValue
           
       }
       
      
       @MainActor func updateSphereSurfaceArea(sphereSurfaceAreaTextString:String){
           
           sphereSurfaceAreaText = sphereSurfaceAreaTextString
           
           
       }

    
    
    
    
}
