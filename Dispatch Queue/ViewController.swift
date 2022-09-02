//
//  ViewController.swift
//  Dispatch Queue
//
//  Created by kishore-pt5557 on 02/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let serial = DispatchQueue(label: "Serial")

        let dw = DispatchWorkItem(block: {
            print("A")
            print("B")
            print("C")
        })
        
        dw.notify(queue: .main, execute: {
            print("Work item finished")
        })
        
        dw.perform() // Executes synchronously on main thread

        serial.async(execute: dw)

        serial.sync(execute: dw)
        
        print(serial)
        serial.async {
            print(1)
            print(2)
            print(3)
        }
        print(serial)
        serial.sync {
            print(4)
            print(5)
            print(6)
            
        }
        print(serial)
        serial.async {
            print(7)
            print(8)
            print(9)
        }
        print(serial)
        serial.sync {
            print(10)
            print(11)
            print(12)
        }
        print(serial)

        let concurrent = DispatchQueue(label: "Concurrent", attributes: .concurrent)

        concurrent.sync(execute: dw)

        concurrent.async(execute: dw)
        
        concurrent.async {
            print(13)
            print(14)
            print(15)
        }

        print(concurrent)

        concurrent.async {
            print(16)
            print(17)
            print(18)
        }
        print(concurrent)
        concurrent.async {
            print(19)
            print(20)
            print(21)
        }
        print(concurrent)
        
        concurrent.async {
            print(22)
            print(23)
            print(24)
        }
        print(concurrent)

    }


}

