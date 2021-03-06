//
//  CastableTests.swift
//  CastableTests
//
//  Created by jayios on 2016. 6. 23..
//  Copyright © 2016년 ngenii. All rights reserved.
//

import XCTest
@testable import Castable

class CastableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var a:[Float] = [Float]()
        for _ in 0..<10 {
            a.append(Float(arc4random_uniform(255)))
        }
        let b = a[0..<a.count]
        
        print("a.count:\(a.count) == \(b.count):b.count")
        XCTAssert(a.count == b.count)
        
        let ptrA = a.pointer
        let ptrB: UnsafeMutablePointer<Void> = b.pointer.cast()
        let ptrC: UnsafePointer<Float> = ptrB.cast()
        
        for i in 0..<a.count {
            print("ptrA:\(ptrA[i]) == \(ptrC[i]):ptrC")
            XCTAssert(ptrA[i] == ptrC[i])
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
