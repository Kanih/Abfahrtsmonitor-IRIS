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
		self.updateWebView()
    }
	
	func updateWebView() {
		let row = stationen.selectedRowInComponent(0)
		let kurzel = self.stationskurzel[row]
		let url = "http://iris.noncd.db.de/wbt/js/index.html?title=0&impressum=0&typ=ab&zeilen=17&bhf=\(kurzel)"
		
		let requestURL = NSURL(string: url)
		let request = NSURLRequest(URL: requestURL!)
		webView.loadRequest(request)
		self.stationen.delegate = self
		self.stationen.dataSource = self
	}
	
    var stationskurzel = ["rhk", "rm", "rh"]
	
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
	
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		updateWebView()
	}

}