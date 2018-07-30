# YBNetworking

## 一个属性 给UILabel添加长按复制


## demo
![image](https://raw.githubusercontent.com/alexyubin/YBNetworking/master/demo.gif)


## How to use

```swift

simp

   YBNetWorkRequest(.detailsApi, completion: { (string) -> (Void) in
   
       // do someing
       
   }) { (string) -> (Void) in
   
       // call back failed
       
        print(string)
   }
```
## Or

```swift  
    YBNetWorkRequest(.detailsApi, completion: { (string) -> (Void) in
                
       // do someing
                
    }, failed: { (string) -> (Void) in
        
        // call back failed
       
        print(string)
        
    }) { () -> (Void) in
       
       // call back error
       
    }
```


