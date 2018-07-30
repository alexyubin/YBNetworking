//
//  DemoViewController.swift
//  YBNetworking
//
//  Created by 陈煜彬 on 2018/7/11.
//  Copyright © 2018年 陈煜彬. All rights reserved.
//

import UIKit
import HandyJSON


enum NetworkType {
    
    // 带error
    case errorRequest
    // 不带error, 简单请求
    case simpleRequest
}

class DemoViewController: UIViewController {

    var titleArray : [String] = ["不带参数, 简单请求", "带参数, 简单请求", "不带参数, 带error请求", "带参数, 带error请求"]
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupUI()

    }

    
    func setupUI() {
        
        self.navigationItem.title = "Demo"
        
        tableView = UITableView.init(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 64), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// MARK: - TableViewDelegate, DataSource
extension DemoViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.titleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            let details = DetailsViewController()
            details.requestType = .simpleRequest
            self.navigationController?.pushViewController(details, animated: true)
        case 1:
            let search = SearchViewController()
            search.requestType = .simpleRequest
            self.navigationController?.pushViewController(search, animated: true)
        case 2:
            let details = DetailsViewController()
            details.requestType = .errorRequest
            self.navigationController?.pushViewController(details, animated: true)
        case 3:
            let search = SearchViewController()
            search.requestType = .errorRequest
            self.navigationController?.pushViewController(search, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "DemoCell"
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        cell.textLabel?.text = self.titleArray[indexPath.row]
        return cell
        
        
    }
    
}


