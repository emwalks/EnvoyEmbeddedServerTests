//
//  EnvoyEmbeddedServerTestsTests.swift
//  EnvoyEmbeddedServerTestsTests
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 28/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import XCTest
@testable import EnvoyEmbeddedServerTests
import Embassy
import EnvoyAmbassador

class EnvoyEmbeddedServerTestsTests: XCTestCase {
    
    func testDownloadFruitData() {
        
        // Create an expectation for a background download task.
        let expectation = XCTestExpectation(description: "Download fruit Data")
        
        // Create a URL for a web page to be downloaded.
        let url = URL(string: "http://[::1]:8000/fruitData")!
        
        // Create a background task to download the web page.
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            // Make sure we downloaded some data.
            XCTAssertNotNil(data, "No data was downloaded.")
            
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
            
        }
        
        // Start the download task.
        dataTask.resume()
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
}
