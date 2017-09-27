//: Playground - noun: a place where people can play

import UIKit

struct Vote {
    var name: String = ""
    var count : Int = 0
    
    mutating func update(_ string:String, max: Int) {
        if self.count < max  {
            count = max
            name = string
        }
        else if self.count == max, name < string {
            name = string
        }
    }
}

@discardableResult func getWiner(votes:[String]) -> String {
    var vote_struct = Vote()
    var vote_map : Dictionary<String, Int> = [:]
    for vote in votes {
        var count = 1
        if let temp = vote_map[vote] {
            count = temp + 1
        }
        vote_map[vote] = count
        vote_struct.update(vote, max: count)
    }
    return vote_struct.name
}

getWiner(votes: ["victor","veronica","ryan","dave","maria", "farah","farah","ryan","veronica"])
