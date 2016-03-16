//
//  WebViewController.swift
//  LibraryWireframe
//
//  Created by Bill Howe on 2/5/16.
//  Copyright © 2016 Ian Howe. All rights reserved.
//

import Foundation
import UIKit

class WebViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    //Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var webView: UIWebView!
    
    var cellData: [TableViewItem]
    
    required init?(coder aDecoder: NSCoder)
    {
        cellData = [TableViewItem]()
        for var i = 0; i < cellTitles.count; i++ {
            let newItem = TableViewItem(LabelName: cellTitles[i], Link: cellLinks[i])
            cellData.append(newItem)
        }
        super.init(coder: aDecoder)
        
    }
    
    
    //Variables
    let cellIdentifier = "cellIdentifier"
    let cellTitles = ["Research",
        "GALE PowerSearch",
        "Biography in Context",
        "Global Issues in Context",
        "InfoTrac",
        "LitFinder",
        "Opposing Viewpoints in Context",
        "Science in Context",
        "Student Resource in Context",
        "Consumer Reports",
        "CQ Researcher",
        "EBSCO",
        "MAS-ULTRA (in school use)",
        "Health Source",
        "SIRS",
        "Teen Health & Wellness",
        "World Book"]
    //TODO: Make 2D Array for different sections? allows for easier identification of headers
    
    let cellLinks = ["",
    "http://go.galegroup.com/ps/i.do?v=2.1&u=dist214&pg=BasicSearch&it=static&sw=w&p=GPS",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=BIC1",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=GIC",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=STOM",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=LITFS",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=OVIC",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=SCIC",
    "http://ezproxy.d214.org:2048/login?url=http://infotrac.galegroup.com/itweb/dist214?db=SUIC",
    "http://ezproxy.d214.org:2048/login?url=http://search.ebscohost.com/login.aspx?authtype=ip,uid&profile=crcro",
    "http://ezproxy.d214.org:2048/login?url=http://library.cqpress.com/cqres/lpext.dll?f=templates&fn=titlepage.htm",
    "http://ezproxy.d214.org:2048/login?url=http://search.ebscohost.com/login.aspx?authtype=ip,uid&profile=ehost",
    "http://search.ebscohost.com/login.aspx?authtype=ip,uid&profile=ehost&defaultdb=ulh",
    "http://ezproxy.d214.org:2048/login?url=http://search.ebscohost.com/login.aspx?authtype=ip,uid&profile=ehost&defaultdb=hxh",
    "http://ezproxy.d214.org:2048/login?url=http://sks.sirs.com/",
    "http://ezproxy.d214.org:2048/login?url=http://www.teenhealthandwellness.com/",
    "http://ezproxy.d214.org:2048/login?url=http://www.worldbookonline.com/?subacct=N2771"]
    
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCellItem", forIndexPath: indexPath)
        let label = cell.viewWithTag(777) as! UILabel
        let item = cellData[indexPath.row]
        label.text = item.labelNamed
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    //Triggers when cell view is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(cellTitles[row])
        
        //TODO: Implement webview info
        let websiteURL = NSURL(fileURLWithPath: cellLinks[row])
        let urlRequest = NSURLRequest(URL: websiteURL)
        webView.loadRequest(urlRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: "http://www.d214.org/academics/district-library-resources/")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
        
        
    }
    
}

