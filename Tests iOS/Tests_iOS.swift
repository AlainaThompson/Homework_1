//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Alaina Thompson on 1/25/22.
//

import XCTest

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
    
    
    func testSphereInitialization() async {
    
        
        let radius = 1.0
        
        let mySphere = Sphere()
        
        let _ = await mySphere.initWithRadius(r: radius)
        
        let sphereVolume = mySphere.sphereVolume
        
        XCTAssertEqual(sphereVolume, Double.pi*(4/3)*pow(r, 3.0), accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        let sphereSurfaceArea = mySphere.sphereSurfaceArea
        
        XCTAssertEqual(sphereSurfaceArea, 4.0*Double.pi*pow(r, 2.0), accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
    }
    
    func testSphereVolume() async {
      
        
        let mySphere = Sphere()
        
        let radius = 1.0
        
        let sphereVolume = await mySphere.calculateSphereVolume(r: radius)
        
        XCTAssertEqual(sphereVolume, Double.pi*(4/3)*pow(r, 3.0), accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
    }
    
    func testSphereSurfaceArea() async {
        
        let mySphere = Sphere()
        
        let radius = 1.0
        
        let sphereSurfaceArea = await mySphere.calculateSphereSurfaceArea(r: radius)
        
        
        XCTAssertEqual(sphereSurfaceArea, 4.0*Double.pi*pow(r, 2.0), accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
        
    }
    
    func testBoundingBoxInitialization() async {
        
        
        let myBoundingBox = BoundingBox()
        
        let sideLength = 2.0
        
        let _ = await myBoundingBox.initWithBoundingBox(l: sideLength, r: radius)
        
        let boundingBoxVolume = myBoundingBox.boundingBoxVolume
        
        XCTAssertEqual(boundingBoxVolume, (pow(l, 3.0) -Double.pi*(4/3)*pow(r, 3.0)) accuracy: 1.0E-7,"Was not equal to the resolution.")
        
        let boundingBoxSurfaceArea = myBoundingBox.boundingBoxSurfaceArea
        
        XCTAssertEqual(boundingBoxSurfaceArea, 6.0*pow(l, 3.0), accuracy: 1.0E-7, "Was not equal to the resolution." )
        
        
    }
    
    
    func testBoundingBoxVolume() async {
        
        let myBoundingBox = BoundingBox()
        
        let sideLength = 2.0
        
        let boundingBoxVolume = await myBoundingBox.calculateBoundingBoxVolume(l: sideLength, r: radius)
        
        XCTAssertEqual(boundingBoxVolume, (pow(l, 3.0) -Double.pi*(4/3)*pow(r, 3.0)), accuracy: 1.0E-7,"Was not equal to the resolution.")
        
        
    }
    
    
     func testBoundingBoxSurfaceArea() async {
            
        let myBoundingBox = BoundingBox()
                
         let sideLength = 2.0
    
                
        let boundingBoxSurfaceArea = await myBoundingBox.calculateBoundingBoxSurfaceArea(l: sideLength, r: radius)
                
         XCTAssertEqual(boundingBoxSurfaceArea, 6.0*pow(l, 3.0), accuracy: 1.0E-7, "Was not equal to the resolution." )
                
        }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
