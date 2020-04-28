// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//


class Animal {
    static let foo = "Foo"
    class var eyeColors: [String] { return ["Brown", "Blue", "Hazel"] }
    
    var isPet: Bool = false
}

class Dog: Animal
{
    class override var eyeColors: [String] { return ["Brown", "Blue", "Hazel", "Green"] }

    private var _numberOfLegs = 4
    var barkText = "Woof, woof!"
    var name = ""
    var age: Int
//    var coatColor = UIColor.brown
    
    // Designated initializer
    init(name: String = "", barkText: String = "Woof, Woof!", age: Int = 0) {
        self.name = name
        self.barkText = barkText
        self.age = age
        super.init()
    }
    
    func showEyeColors() {
        print(Dog.eyeColors)
    }
    
    class func showEyeColors() {
        print(eyeColors)
    }
    
//    // Designated initializer
//    init(age: Int) {
//        self.age = age
//        super.init()
//    }
}

extension Dog: CustomStringConvertible
{
    var description: String {
        return "name: \(name), is pet: "
            + (isPet ? "yes" : "no")
            + ", bark: \(barkText)"
    }
}

extension Dog
{
    var numberOfLegs: Int {
        get { return _numberOfLegs }
        set { _numberOfLegs = newValue }
    }
    
    func bark() {
        print(barkText)
    }
}
