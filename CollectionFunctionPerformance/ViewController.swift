//
//  ViewController.swift
//  CollectionFunctionPerformance
//
//  Created by Yuki Yoshioka on 2017/10/06.
//  Copyright © 2017年 rikusouda. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let sourceArray = [Int](0..<500000)
    static let sleepTime: UInt32 = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            arrayFilterMap()
        case 1:
            arrayMapFilter()
        case 2:
            arrayLazyFilterMap()
        case 3:
            arrayLazyMapFilter()
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViewController {
    static func mapFunction(data: Int) -> Int {
        Thread.sleep(forTimeInterval: 0.000001)
        return data * 2
    }
    
    func arrayFilterMap() {
        let startTime = Date()
        
        let newArray = sourceArray
            .filter { ($0 % 2) == 0 }
            .map(ViewController.mapFunction)
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    func arrayMapFilter() {
        let startTime = Date()
        
        let newArray = sourceArray
            .map(ViewController.mapFunction)
            .filter { ($0 % 4) == 0 }
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    func arrayLazyFilterMap() {
        let startTime = Date()
        
        let newArray = Array(sourceArray
            .lazy
            .filter { ($0 % 2) == 0 }
            .map(ViewController.mapFunction)
        )
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    func arrayLazyMapFilter() {
        let startTime = Date()
        
        let newArray = Array(sourceArray
            .lazy
            .map(ViewController.mapFunction)
            .filter { ($0 % 4) == 0 }
        )
        
        let elapsed = Date().timeIntervalSince(startTime) as Double
        self.showResult(second: elapsed, dataCount: newArray.count)
    }
    
    
    func showResult(second: Double, dataCount: Int) {
        let message = String(format: "%.3f second\nDataCount: \(dataCount)", second)
        
        let alert = UIAlertController(title: "Time", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
