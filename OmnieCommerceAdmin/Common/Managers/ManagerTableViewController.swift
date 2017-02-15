//
//  ManagerTableViewController.swift
//  OmnieCommerceAdmin
//
//  Created by msm72 on 15.02.17.
//  Copyright © 2017 Omniesoft. All rights reserved.
//

import UIKit

class ManagerTableViewController: UITableViewController {
    // MARK: - Properties
    var sections = 0
    
    var dataSource = Array<Array<Any>>() {
        didSet {
            self.sections = dataSource.count
        }
    }
    
    
    // MARK: - Class Functions
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MenuCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! MenuViewCell
        
        cell.didSetup(fromItem: (dataSource[indexPath.section] as! Array)[indexPath.row])
        
        return cell
    }
    
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35.0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 25.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView.init(frame: CGRect.init(origin: CGPoint.zero, size: CGSize.init(width: tableView.frame.width, height: 25.0)))
        footerView.backgroundColor = UIColor.clear
        
        if (section != dataSource[section].count - 1) {
            let lineView = UIView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 25.0 / 2), size: CGSize.init(width: tableView.frame.width, height: 1.0)))
            lineView.backgroundColor = UIColor.init(hexString: "#3b3b3b", withAlpha: 1.0)
            
            footerView.addSubview(lineView)
        }
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MenuViewCell
        let initNC = UIStoryboard(name: cell.storyboardName, bundle: nil).instantiateViewController(withIdentifier: cell.storyboardName + "NC") as! UINavigationController
        
        revealViewController().pushFrontViewController(initNC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
