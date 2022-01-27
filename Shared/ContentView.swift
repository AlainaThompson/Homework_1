//
//  ContentView.swift
//  Shared
//
//  Created by Alaina Thompson on 1/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var sphereModel = Sphere()
    @ObservedObject private var boundingBoxModel = BoundingBox()
    @State var radiusString = "1.0"
    @State var sideLengthString = "2.0"
    
    var body: some View {
        
        VStack{
            Text("Radius")
                .padding(.top,25)
                .padding(.bottom, 0)
            TextField("Enter Radius", text: $radiusString, onCommit: {Task.init {await self.calculateSphere(); await self.calculateBoundingBox()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            
            
            Text("Box Side Length")
                .padding(.top,25)
                .padding(.bottom, 0)
            TextField("Enter Side Length", text: $sideLengthString, onCommit: {Task.init {await self.calculateBoundingBox()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            
            
            
            
            
            
            
            
            HStack {
                VStack{
            Text("Sphere Volume")
                .padding(.bottom, 0)
            TextField("", text: $sphereModel.sphereVolumeText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
                    
            Text("Bounding Box Volume")
                .padding(.bottom, 0)
            TextField("", text: $boundingBoxModel.boundingBoxVolumeText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                    
                    
        }
        VStack{
            Text("Sphere Volume")
                .padding(.bottom, 0)
            Text("\(sphereModel.sphereVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            
            Text("Bounding Box Volume")
                .padding(.bottom, 0)
            Text("\(boundingBoxModel.boundingBoxVolume, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
            
            
            
            
            
            }
            }
            HStack{
                VStack{
            Text("Sphere Surface Area")
                .padding(.bottom, 0)
            TextField("", text: ( $sphereModel.sphereSurfaceAreaText))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
                    
            Text("Bounding Box Surface Area")
                .padding(.bottom, 0)
            TextField("", text: ( $boundingBoxModel.boundingBoxSurfaceAreaText))
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
                    
                    
                    
                    
                    
                    
                }
                VStack{
                    Text("Sphere Surface Area")
                        .padding(.bottom, 0)
                    Text("\(sphereModel.sphereSurfaceArea, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                       
                    
                    Text("Bounding Box Surface Area")
                        .padding(.bottom, 0)
                    Text("\(boundingBoxModel.boundingBoxSurfaceArea, specifier: "%.2f")")
                        .padding(.horizontal)
                        .frame(width: 100)
                        .padding(.top, 0)
                        .padding(.bottom,30)
                    
                    
                    
                    
                    
                    
                    }

                
                
                
                
            }
            
            Button("Calculate", action: {Task.init { await self.calculateSphere(); await self.calculateBoundingBox()}})
                .padding(.bottom)
                .padding()
                .disabled(sphereModel.enableButton == false)
                .disabled(boundingBoxModel.boxEnableButton == false)
            
            
        }
        
    }
        
    func calculateSphere() async {
        
        sphereModel.setButtonEnable(state: false)
        
        let _ : Bool = await sphereModel.initWithRadius(r: Double(radiusString)!)
        
        

}
    
    
            
    func calculateBoundingBox() async {
                
        boundingBoxModel.setBoxButtonEnable(state: false)
                
        let _ : Bool = await boundingBoxModel.initWithBoundingBox(l: Double(sideLengthString)!, r: Double(radiusString)!)
                
    }
            
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }


    
