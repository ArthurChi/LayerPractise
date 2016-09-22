//
//  StartTableViewController.swift
//  LayerPractise
//
//  Created by cjfire on 16/9/22.
//  Copyright © 2016年 cjfire. All rights reserved.
//

import UIKit

class StartTableViewController: UITableViewController {

    let dataSource: Array<(String, UIViewController.Type)> = [("变色文字", ViewController.self), ("波浪", WaveViewController.self)]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "\(UITableViewCell.classForCoder())")
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCellWithIdentifier("\(UITableViewCell.classForCoder())", forIndexPath: indexPath)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        cell.textLabel?.text = dataSource[indexPath.row].0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = dataSource[indexPath.row].1.init()
        navigationController?.pushViewController(vc, animated: true)
    }
}
