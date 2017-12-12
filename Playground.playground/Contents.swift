//: Playground - noun: a place where people can play

import UIKit
import Foundation


// cel
//let result = Celebrity.find(4)




if let result = ["Kaushal":"Deo"].javaUTF8() {
    print(String(data: result, encoding: .utf8))
    if let data = result.javaUTF8() {
    print(String(data: data, encoding: .utf8))
    do {
        let value = try JSONSerialization.jsonObject(with: data, options: [.allowFragments])
        print(value)
    }
    catch let error {
        print(error)
    }
    }
}
