//
//  SearchViewController.swift
//  YBNetworking
//
//  Created by 陈煜彬 on 2018/7/30.
//  Copyright © 2018年 陈煜彬. All rights reserved.
//

import UIKit
import HandyJSON

class SearchViewController: UIViewController {

    var tableView : UITableView!
    
    var dataArray: NSMutableArray = []
    
    var requestType : NetworkType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupUI()
        loadData()
    }
    
    func loadData() {
        // "q", 搜索关键词 / "count", 结果条数
        let parameters = ["q": "iOS开发",
                          "count" : "20"]
        
        switch requestType {
        case .simpleRequest:
            
            self.navigationItem.title = "不带error"
            
            // 不带error
            YBNetWorkRequest(.searchApi(parameters: parameters), completion: { (string) -> (Void) in
                
                let model = JSONDeserializer<SearchModel>.deserializeFrom(json: string)!
                
                self.dataArray.removeAllObjects()
                self.dataArray.addObjects(from: model.books)
                
                self.tableView.reloadData()
                
            }) { (string) -> (Void) in
                print(string)
            }
        case .errorRequest:
            
            self.navigationItem.title = "带error"
            // 带error
            YBNetWorkRequest(.searchApi(parameters: parameters), completion: { (string) -> (Void) in
                
                let model = JSONDeserializer<SearchModel>.deserializeFrom(json: string)!
                
                self.dataArray.removeAllObjects()
                self.dataArray.addObjects(from: model.books)
                
                self.tableView.reloadData()
                
            }, failed: { (string) -> (Void) in
                print(string)
            }) { () -> (Void) in
                print("网络出错")
            }
        default:
            break
        }
        
    }
    
    func setupUI() {
        
        self.view.backgroundColor = UIColor.white
        
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
extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
        let model = self.dataArray[indexPath.row] as! Book
        cell.textLabel?.text = model.title
        cell.detailTextLabel?.text = model.author_intro
        return cell
        
        
    }
    
}
