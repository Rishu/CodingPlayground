//: Playground - noun: a place where people can plays


class LinkedList {
    var next : LinkedList? = nil
    var value : Any
    
    init(newValue:Any) {
        self.value = newValue
    }
}

func convert(_ linkList: [Any]) -> LinkedList? {
    if linkList.count == 0 {
        return nil
    }
    
    var head : LinkedList = LinkedList(newValue: linkList[0])
    for index in 1 ..< linkList.count {
        let newNode = LinkedList(newValue: linkList[index])
        newNode.next = head
        head = newNode
    }
    print(head.next?.value)
    return head
}

convert(["victor", "veronica", "ryan", "dave", "maria", "farah", "farah", "ryan", "veronica"])

