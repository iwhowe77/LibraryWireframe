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
    @IBOutlet weak var resourceTitleView: UIView!
    @IBOutlet weak var resourceView: UIView!
    
    
    var cellData: [TableViewItem]
    
    required init?(coder aDecoder: NSCoder)
    {
        let cellTitles = [
            ["Research",
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
                "World Book"],
            ["Social Science",
                "ABC-CLIO (multi-databases)",
                "American Government",
                "American History",
                "CountryReports",
                "Daily Life Through History",
                "Geography (U.S.)",
                "Geography (World)",
                "World History: Ancient",
                "World History: Modern"],
            ["eBooks & eAudio",
                "OverDrive",
                "Gale Virtual Reference",
                "Gale Virtual Reference (PHS)",
                "Flipster - BGHS",
                "Flipster - EGHS",
                "Flipster - JHHS",
                "Flipster - PHS",
                "Flipster - RMHS",
                "Flipster - WHS"],
            ["Autos & Careers",
                "All Data Pro (Auto)",
                "Career Cruising"]]

        let cellLinks = [["http://www.d214.org/academics/district-library-resources/#Research",
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
            "http://ezproxy.d214.org:2048/login?url=http://www.worldbookonline.com/?subacct=N2771"],
            ["http://www.d214.org/academics/district-library-resources/#social",
                "http://ezproxy.d214.org:2048/login?url=http://www.databases.abc-clio.com",
                "http://ezproxy.d214.org:2048/login?url=http://americangovernment.abc-clio.com/",
                "http://ezproxy.d214.org:2048/login?url=http://americanhistory.abc-clio.com/",
                "http://ezproxy.d214.org:2048/login?url=http://www.countryreports.org/",
                "http://ezproxy.d214.org:2048/login?url=http://dailylife.abc-clio.com/",
                "http://ezproxy.d214.org:2048/login?url=http://usgeography.abc-clio.com/",
                "http://ezproxy.d214.org:2048/login?url=http://worldgeography.abc-clio.com/",
                "http://ezproxy.d214.org:2048/login?url=http://ancienthistory.abc-clio.com/",
                "http://ezproxy.d214.org:2048/login?url=http://worldhistory.abc-clio.com/"],
            ["http://www.d214.org/academics/district-library-resources/#eBooks",
                "http://ezproxy.d214.org:2048/login?url=http://d214.lib.overdrive.com/",
                "http://infotrac.galegroup.com/itweb/dist214?db=GVRL",
                "http://galepages.com/prospecths",
                "http://search.ebscohost.com/login.aspx?authtype=ip,uid&custID=s9461948&profile=eon",
                "http://search.ebscohost.com/login.aspx?authtype=ip,uid&group=main&custid=s9461831",
                "http://search.ebscohost.com/login.aspx?authtype=ip,uid&profile=eon&custid=s9461855",
                "http://search.ebscohost.com/login.aspx?authtype=ip,uid&custid=s9461881&profile=eon",
                "http://search.ebscohost.com/login.aspx?authtype=ip,uid&custid=s9461905&profile=eon",
                "http://search.ebscohost.com/login.aspx?authtype=ip,uid&custid=s9461926&profile=eon"],
            ["http://www.d214.org/academics/district-library-resources/#Auto",
                "http://ezproxy.d214.org:2048/login?url=http://library.alldatapro.com",
                "http://ezproxy.d214.org:2048/login?url=http://www.careercruising.com/home/GroupLogin.aspx"]]
        
        cellData = [TableViewItem]()
        for i in 0 ..< cellTitles.count {
            for j in 0 ..< cellTitles[i].count {
                if j == 0 {
                    let newItem = TableViewItem(LabelName: cellTitles[i][j], Link: cellLinks[i][j], IsHeader: true)
                    cellData.append(newItem)
                }
                else {
                    let newItem = TableViewItem(LabelName: cellTitles[i][j], Link: cellLinks[i][j])
                    cellData.append(newItem)
                }
            }
        }
        
        
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newWebViewFrame = CGRect(x: 0, y: self.webView.frame.origin.y, width: self.view.frame.width, height: self.webView.frame.height)
        webView.frame = newWebViewFrame
        
        let url = NSURL (string: "http://www.d214.org/academics/district-library-resources/")
        let requestObj = NSURLRequest(URL: url!)
        webView.loadRequest(requestObj)
        
        
    }
    
    //Variables
    let cellIdentifier = "cellIdentifier"
    var selectedIndex = NSIndexPath()
    var username = ""
    var password = ""
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCellItem", forIndexPath: indexPath)
        let label = cell.textLabel
        label!.text = cellData[indexPath.row].labelName
        if cellData[indexPath.row].isHeaderCell {
            cell.backgroundColor = UIColor.paleGreenColor()
        }
        else {
            label!.font = UIFont(name: (label!.font?.fontName)!, size: 12)
        }
        return cell
    }
    
    // MARK:  UITableViewDelegate Methods
    //Triggers when cell view is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(selectedIndex, animated: true)
        selectedIndex = indexPath
        
        toggleResourceTab(UIBarButtonItem())
        
        let row = indexPath.row
        print(cellData[row].labelName)
        
        let websiteURL = NSURL(string: cellData[row].link)
        let urlRequest = NSURLRequest(URL: websiteURL!)
        webView.loadRequest(urlRequest)
    }
    
    @IBAction func toggleResourceTab(sender: UIBarButtonItem) {
        
        UIView.animateWithDuration(0.5, animations: {
            if self.resourceView.frame.origin.x == 0 {
                self.resourceView.frame.origin.x = (-1 * self.resourceView.frame.width)
                let newWebViewFrame = CGRect(x: 0, y: self.webView.frame.origin.y, width: self.view.frame.width, height: self.webView.frame.height)
                self.webView.frame = newWebViewFrame
            }
            else {
                self.resourceView.frame.origin.x = 0
//                let newWebViewFrame = CGRect(x: self.resourceView.frame.width, y: self.webView.frame.origin.y, width: (self.view.frame.width - self.resourceView.frame.width), height: self.webView.frame.height)
//                self.webView.frame = newWebViewFrame
            }
            }, completion: nil)
    }
}



//http://stackoverflow.com/questions/26329771/autofill-username-and-password-uiwebview-swift








    
    


