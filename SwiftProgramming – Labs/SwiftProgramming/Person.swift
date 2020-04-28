// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//


// MARK: - Likeable protocol
protocol Likeable
{
    var numberOfLikes: Int { get }
    
    func like()
    func unlike()
}

extension Likeable {
    var isCool: Bool {
        return numberOfLikes > 10
    }
}

// MARK: - Friendable protocol
protocol Friendable
{
    var friendID: Int { get }
    var friends: [Friendable] { get }
    
    func friend(_ newFriend: Friendable)
    func unfriend(_ oldFriend: Friendable)
}

// MARK: - Person class
class Person
{
    var isCool: Bool { return true }
    
    // MARK: - Person properties
    var firstName: String
    var lastName: String
    
    // MARK: - Likeable properties
    var numberOfLikes = 0
    
    // MARK: - Friendable properties
    var friendID = 0
    var friends = [Friendable]()
    
    // MARK: - Initializers
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}

// MARK: - CustomDebugStringConvertible conformance
extension Person: CustomDebugStringConvertible
{
    var debugDescription: String {
        return "\(firstName) \(lastName), +\(numberOfLikes)"
    }
}

// MARK: - Likeable methods
extension Person: Likeable
{
    func like() {
        numberOfLikes += 1
    }
    
    func unlike() {
        if (numberOfLikes > 0) {
            numberOfLikes -= 1
        }
    }
}

// MARK: - Friendable methods
extension Person: Friendable
{
    func friend(_ newFriend: Friendable) {
        friends.append(newFriend)
    }
    
    func unfriend(_ oldFriend: Friendable) {
        friends = friends.filter { currFriend in
            return currFriend.friendID != oldFriend.friendID
        }
    }
    
    func unfriend2(_ oldFriend: Friendable) {
        let index = friends.firstIndex { oldFriend.friendID == $0.friendID }
        
        if index == nil { return }
        friends.remove(at: index!)
    }
}
















