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
}

public class MaximumHistogram {
    public static func maxHistogram(_ graph:[Int]) -> Int {
        var maxArea : Int = 0
        var stack : Stack<Int> = Stack()
        var index = 0
        while index < graph.count {
            if(stack.isEmpty()) {
                stack.push(index)
                index += 1
            }
            else if let i = stack.peek(), graph[i] <= graph[index] {
                stack.push(index)
                 index += 1
            }
            else {
                var area = 0
                let top = stack.pop()!
                //if stack is empty means everything till i has to be
                //greater or equal to input[top] so get area by
                //input[top] * i;
                if (stack.isEmpty()) {
                    area = graph[top] * index
                }
                    //if stack is not empty then everythin from i-1 to input.peek() + 1
                    //has to be greater or equal to input[top]
                    //so area = input[top]*(i - stack.peek() - 1);
                else{
                    area = graph[top] * (index - stack.peek()! - 1);
                }
                if(area > maxArea){
                    maxArea = area;
                }
            }
        }
        
        while(!stack.isEmpty()) {
            var area = 0
            let top = stack.pop()!
            //if stack is empty means everything till i has to be
            //greater or equal to input[top] so get area by
            //input[top] * i;
            if(stack.isEmpty()){
                area = graph[top] * index;
            }
                //if stack is not empty then everything from i-1 to input.peek() + 1
                //has to be greater or equal to input[top]
                //so area = input[top]*(i - stack.peek() - 1);
            else {
                area = graph[top] * (index - stack.peek()! - 1);
            }
            if(area > maxArea){
                maxArea = area;
            }
        }
        
        
        
        return maxArea
    }
}
