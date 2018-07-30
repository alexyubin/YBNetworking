# YBNetworking

## Swift : Moya + Alamofire 网络框架demo, 结合 Handyjson 简单, 简洁, 实用.
## 可根据自己的需求对每一条请求进行对应的设置


## demo
![image](https://raw.githubusercontent.com/alexyubin/YBNetworking/master/demo.gif)


## How to use

```swift

   YBNetWorkRequest(.searchApi(parameters: parameters), completion: { (string) -> (Void) in
   
       // do someing
       
       // 结合 Handyjson 使用
       // let model = JSONDeserializer<SearchModel>.deserializeFrom(json: string)!
       
   }) { (string) -> (Void) in
   
       // call back failed
       
        print(string)
   }
   
```
## Or

```swift  

    YBNetWorkRequest(.searchApi(parameters: parameters), completion: { (string) -> (Void) in
                
       // do someing
       
       // 结合 Handyjson 使用
       // let model = JSONDeserializer<SearchModel>.deserializeFrom(json: string)!
                
    }, failed: { (string) -> (Void) in
        
        // call back failed
       
        print(string)
        
    }) { () -> (Void) in
       
       // call back error
       
    }
    
```


