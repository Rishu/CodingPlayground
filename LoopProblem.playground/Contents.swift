import Foundation

//: Playground - noun: a place where people can play

class LinkedList : Equatable {
    var next : LinkedList? = nil
    var value : Any
    
    init(newValue:Any) {
        self.value = newValue
    }
    
    func append(newValue: Any) {
        //Create a new Object
        let temp = LinkedList(newValue: newValue)
        
        guard var lastNode = self.next else {
            self.next = temp
            return
        }
        
        while lastNode.next != nil {
            lastNode = lastNode.next!
        }
        
        lastNode.next = temp
    }
    
    func push(newValue: Any) ->LinkedList {
        let temp = LinkedList(newValue: newValue)
        temp.next = self
        
        return temp;
    }
    
    // MARK: Equatable
    static func == (lhs: LinkedList, rhs: LinkedList) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
}

@discardableResult func convert(_ linkList: [Any]) -> LinkedList? {
    if linkList.count == 0 {
        return nil
    }
    var list = LinkedList(newValue: linkList[0])
    for index in 1 ..< linkList.count {
        let temp = LinkedList(newValue: linkList[index])
        temp.next = list
        list = temp
    }
    
     guard var lastNode = list.next else {
         return list
     }

     while lastNode.next != nil {
         lastNode = lastNode.next!
     }

     lastNode.next = list
    
    return list
}



func hasLoop(_ link: LinkedList) -> Bool {
    var slow_ptr = link.next
    var fast_ptr = link.next?.next
    
    while fast_ptr != nil {
        if let slow = slow_ptr, let fast = fast_ptr, slow == fast {
            return true
        }
        
        slow_ptr = slow_ptr?.next
        fast_ptr = fast_ptr?.next?.next
    }
    
    return false
}


if let list = convert(["victor", "veronica", "ryan", "dave", "maria", "farah", "farah", "ryan", "veronica"]) {
    
    print(hasLoop(list))
}

