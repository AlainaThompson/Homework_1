//
//  Cube.swift
//  Homework 1
//
//  Created by Alaina Thompson on 1/25/22.
//

import SwiftUI

class Cube: NSObject,ObservableObject {

    var sideLength = 0.0
    @Published var cubevVolume = 0.0
    @Published var cubeSurfaceArea = 0.0
    @Published var sideLengthString = "2.0"
    @Published var enableButton = true
    
    
    
    
    func initWithCube(l: Double) async -> Bool {
        
        sideLength = l
            
            let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
        
            
                taskGroup.addTask { let _ = await self.calculateCubeVolume(l: self.sideLength)}
                taskGroup.addTask { let _ = await self.calculateCubeSurfaceArea(l: self.sideLength)}
            
        }
            
                                                 
       

        return true
        
    }
    
    
    
    
    
    
    func calculateCubeVolume(l: Double) async -> Double {
            
            //Volume = pow(l, 3.0)
            
        let calculatedCubeVolume = pow(l, 3.0)
            
            
            return calculatedCubeVolume
            
            
        }
    
    
    
    
    
    
    
    func calculateCubeSurfaceArea(l: Double) async -> Double {
           
           //surfaceArea = 6*pow(l, 2.0)
           
        let calculatedCubeSurfaceArea = pow(l, 2.0)*6
        
           
           return calculatedCubeSurfaceArea
           
       }
    

    
    
}
