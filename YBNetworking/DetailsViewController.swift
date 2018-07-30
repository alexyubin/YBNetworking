//
//  DetailsViewController.swift
//  YBNetworking
//
//  Created by 陈煜彬 on 2018/7/30.
//  Copyright © 2018年 陈煜彬. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var requestType : NetworkType!
    var textView : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setupUI()
        loadData()
    }
    
    func loadData() {

        switch requestType {
        case .simpleRequest:
            
            self.navigationItem.title = "不带error"
            
            // 不带error
            YBNetWorkRequest(.detailsApi, completion: { (string) -> (Void) in
                
                self.textView.text = string
                
            }) { (string) -> (Void) in
                print(string)
            }

        case .errorRequest:
            
            self.navigationItem.title = "带error"
            // 带error
            YBNetWorkRequest(.detailsApi, completion: { (string) -> (Void) in
                
                self.textView.text = string
                
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
        textView = UITextView.init(frame: CGRect(x: 15, y: 80, width: UIScreen.main.bounds.size.width - 30, height: UIScreen.main.bounds.size.height - 100))
        textView.backgroundColor = UIColor.init(red: 174.0/255.0, green: 214.0/255.0, blue:  241.0/255.0, alpha: 1.0)
        textView.layer.cornerRadius = 10;
        self.view.addSubview(textView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

