// Copyright (C) 2020 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this project's licensing information.

import XCTest

class CollectionsLabTests: XCTestCase {

    func testArray() {
        XCTAssertTrue(1 == 1)
        
        let foo: (x: Int, y: String) = (1, "Whee!")
        let bar = (first: 2, second: "Wow!")
        
        print(foo)
        print(foo.1)
        print(foo.y)
        
        print(bar.second)
    }
}
