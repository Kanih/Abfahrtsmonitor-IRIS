//
//  ViewController.swift
//  Abfahrtsmonitor IRIS
//
//  Created by Nicolai Kaschta on 22.05.16.
//  Copyright © 2016 Nicolai Kaschta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //var stationskurzel = ["rhk", "rm", "rh"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        self.stationen.delegate = self
        self.stationen.dataSource = self
        
    }
    
    var kurzel:String = ""
    var stationskurzel = ["rhk", "rm", "rh"]
    var kurzel = stationskurzel[pickerView.selectedRowInComponent(0)]
    var url = "http://iris.noncd.db.de/wbt/js/index.html?title=0&impressum=0&typ=ab&zeilen=17&bhf=\(kurzel)"
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var stationen: UIPickerView!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // Column count: use one column.
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        
        // Row count: rows equals array length.
        return stationskurzel.count
    }
    
    func pickerView(pickerView: UIPickerView,
                    titleForRow row: Int,
                                forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        return stationskurzel[row]
    }

}