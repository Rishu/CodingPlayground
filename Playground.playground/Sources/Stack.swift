import Foundation

public struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    public mutating func push(_ element: Element) {
        array.append(element)
    }
    
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public func peek() -> Element? {
        return array.last
    }
    
    public func isEmpty() -> Bool {
        return array.count == 0
    }
    
    public func size() -> Int {
        return array.count
    }
}
