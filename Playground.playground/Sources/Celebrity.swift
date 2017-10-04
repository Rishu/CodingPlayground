import Foundation


public class Celebrity {
    static let matrix = [[false, false, true, false],
                         [false, false, true, false],
                         [false, false, false, false],
                         [false, false, true, false]];
    
    static func knows(_ a:Int?, _ b:Int?) -> Bool {
        if let x = a {
            if let y = b {
                return matrix[x][y]
            }
            return false
        }
        return false
    }
    
    public static func find(_ people:Int) -> Int? {
        if people < 2 {
            return people
        }
        var stack : Stack<Int> = Stack()
        
        for index in 0 ..< people {
            stack.push(index)
        }
        
        var a = stack.pop()
        var b = stack.pop()
        
        while stack.size() > 1 {
            if knows(a,b) {
                a = stack.pop()
            }
            else {
                b = stack.pop()
            }
        }
        
        //Potential candidate whose still in the stack
        var c = stack.pop()
        
        if knows(c,b) {
            c = b
        }
        
        if knows(c,a) {
            c = a
        }
        
        //Now check with each member to check with any left out
        if let x = c {
        for index in 0 ..< people {
            if x != index, knows(x,index), !knows(index,x) {
                return nil
            }
        }
            return x + 1
        }
        return nil
        
       
    }
}
