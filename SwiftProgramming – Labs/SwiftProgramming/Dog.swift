// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

class Animal {
    var isPet: Bool = false
}

class Dog: Animal
{
    var barkText = "Woof, woof!"
    var name: String = ""
}

extension Dog: CustomStringConvertible
{
    var description: String
    {
        return "name: \(name), is pet: "
            + (isPet ? "yes" : "no")
            + ", bark: \(barkText)"
    }
}

extension Dog
{
    var numberOfLegs: Int { return 4 }
    
    func bark() {
        print(barkText)
    }
}
