//
//  ViewController.swift
//  CollectionFunctionPerformance
//
//  Created by Yuki Yoshioka on 2017/10/06.
//  Copyright © 2017年 rikusouda. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var tester: PerformenceTester!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tester = PerformenceTester(viewController: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            tester.execSection0Action(row: indexPath.row)
        case 1:
            tester.execSection1Action(row: indexPath.row)
        case 2:
            tester.execSection2Action(row: indexPath.row)
        case 3:
            tester.execSection3Action(row: indexPath.row)
        default:
            break
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


