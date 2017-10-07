//
//  PerformenceTester.swift
//  CollectionFunctionPerformance
//
//  Created by Yuki Yoshioka on 2017/10/07.
//  Copyright © 2017年 rikusouda. All rights reserved.
//

import Foundation
import UIKit

class PerformenceTester {
    let sourceArray = [Int](0..<10000000)
    weak var vc: UIViewController!
    
    init(viewController: UIViewController) {
        self.vc = viewController
    }
    
    private static func mapFunction(_ data: Int) -> Int {
        //return Int(String(data))!
        return data
    }
    
    func showResult(second: Double, dataCount: Int) {
        let message = String(format: "%.3f second\nDataCount: \(dataCount)", second)
        
        let alert = UIAlertController(title: "Time", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
}

extension PerformenceTester {
    func execSection0Action(row: Int) {
        switch row {
        case 0:
            arrayFilterMap()
        case 1:
            arrayMapFilter()
        case 2:
            arrayLazyFilterMap()
        case 3:
            arrayLazyMapFilter()
        case 4:
            arrayForToArray()
        default:
            break
        }
    }
    
    private func arrayFilterMap() {
        let startTime = Date()
        
        let newArray = sourceArray
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayMapFilter() {
        let startTime = Date()
        
        let newArray = sourceArray
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayLazyFilterMap() {
        let startTime = Date()
        
        let newArray = Array(sourceArray
            .lazy
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
        )
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayLazyMapFilter() {
        let startTime = Date()
        
        let newArray = Array(sourceArray
            .lazy
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
        )
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayForToArray() {
        let startTime = Date()
        
        var newArray = [Int]()
        for value in sourceArray {
            if value % 2 == 0 {
                newArray.append(PerformenceTester.mapFunction(value))
            }
        }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
}

extension PerformenceTester {
    func execSection1Action(row: Int) {
        switch row {
        case 0:
            arrayFilterMap3()
        case 1:
            arrayMap3Filter()
        case 2:
            arrayLazyFilterMap3()
        case 3:
            arrayLazyMap3Filter()
        case 4:
            arrayFor3ToArray()
        default:
            break
        }
    }
    
    private func arrayFilterMap3() {
        let startTime = Date()
        
        let newArray = sourceArray
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayMap3Filter() {
        let startTime = Date()
        
        let newArray = sourceArray
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayLazyFilterMap3() {
        let startTime = Date()
        
        let newArray = Array(sourceArray
            .lazy
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
        )
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayLazyMap3Filter() {
        let startTime = Date()
        
        let newArray = Array(sourceArray
            .lazy
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
        )
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    private func arrayFor3ToArray() {
        let startTime = Date()
        
        var newArray = [Int]()
        for value in sourceArray {
            if value % 2 == 0 {
                newArray.append(
                    PerformenceTester.mapFunction(
                        PerformenceTester.mapFunction(
                            PerformenceTester.mapFunction(value)
                        )
                    )
                )
            }
        }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
}


extension PerformenceTester {
    func execSection2Action(row: Int) {
        switch row {
        case 0:
            arrayFilterMapReduce()
        case 1:
            arrayMapFilterReduce()
        case 2:
            arrayLazyFilterMapReduce()
        case 3:
            arrayLazyMapFilterReduce()
        case 4:
            arrayForEach()
        case 5:
            arrayFor()
        default:
            break
        }
    }
    
    private func arrayFilterMapReduce() {
        let startTime = Date()
        
        let result = sourceArray
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayMapFilterReduce() {
        let startTime = Date()
        
        let result = sourceArray
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayLazyFilterMapReduce() {
        let startTime = Date()
        
        let result = sourceArray
            .lazy
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayLazyMapFilterReduce() {
        let startTime = Date()
        
        let result = sourceArray
            .lazy
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayForEach() {
        let startTime = Date()

        var result = 0
        sourceArray
            .forEach {
                if $0 % 2 == 0 {
                    result += PerformenceTester.mapFunction($0)
                }
            }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayFor() {
        let startTime = Date()
        
        var result = 0
        for value in sourceArray {
                if value % 2 == 0 {
                    result += PerformenceTester.mapFunction(value)
                }
        }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
}

extension PerformenceTester {
    func execSection3Action(row: Int) {
        switch row {
        case 0:
            arrayFilterMap3Reduce()
        case 1:
            arrayMap3FilterReduce()
        case 2:
            arrayLazyFilterMap3Reduce()
        case 3:
            arrayLazyMap3FilterReduce()
        case 4:
            arrayForEach3()
        case 5:
            arrayFor3()
        default:
            break
        }
    }
    
    private func arrayFilterMap3Reduce() {
        let startTime = Date()
        
        let result = sourceArray
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayMap3FilterReduce() {
        let startTime = Date()
        
        let result = sourceArray
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayLazyFilterMap3Reduce() {
        let startTime = Date()
        
        let result = sourceArray
            .lazy
            .filter { ($0 % 2) == 0 }
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayLazyMap3FilterReduce() {
        let startTime = Date()
        
        let result = sourceArray
            .lazy
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .map(PerformenceTester.mapFunction)
            .filter { ($0 % 2) == 0 }
            .reduce(0, { (result, val) -> Int in
                return result + val
            })
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayForEach3() {
        let startTime = Date()
        
        var result = 0
        sourceArray
            .forEach {
                if $0 % 2 == 0 {
                    result +=
                        PerformenceTester.mapFunction(
                            PerformenceTester.mapFunction(
                                PerformenceTester.mapFunction($0)
                        )
                    )
                }
        }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
    
    private func arrayFor3() {
        let startTime = Date()
        
        var result = 0
        for value in sourceArray {
            if value % 2 == 0 {
                result +=
                    PerformenceTester.mapFunction(
                        PerformenceTester.mapFunction(
                            PerformenceTester.mapFunction(value)
                        )
                    )
            }
        }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: result)
    }
}
