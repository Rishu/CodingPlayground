//: Playground - noun: a place where people can play

import UIKit
import Foundation


// cel
//let result = Celebrity.find(4)


// maze
let items = ["6 5",
             "1 1 S",
             "3 1 \\",
             "3 3 \\",
             "1 3 /",
             "5 3 /"]


let maze = try! Maze(parameters: items)
maze.description()
let result = maze.findSolution()
print(result.result)
print(result.position ?? "")



