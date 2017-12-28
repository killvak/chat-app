//
//  ServicesRequests.swift
//  ProjectA
//
//  Created by admin on 10/23/17.
//  Copyright © 2017 X. All rights reserved.
//

import Foundation
import SwiftyJSON


class LocalServicesRequests {
    
    
   
    func parseChatLocalData(completed : @escaping ([ChatData]?)->()) {
        
        if let path =  Bundle.main.path(forResource: "Chat Json Bot - English", ofType: "json")  {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonObj =  try JSON(data: data)
                //                print("jsonData:\(jsonObj)")
                var chatData = [ChatData]()
                
                for (_ , jsonObjj) in jsonObj  {
                    let chatDataa =  ChatData()
                    var chatSMs = [ChatSMs]()
                for (_ , json) in jsonObjj["messages"] {
                     chatSMs.append( ChatSMs(json))
                 }
                    let chatoptionsJson = jsonObjj["options"]
                    var chatOptions = [ChatOptions]()
                    for (_ ,services) in chatoptionsJson {
                        chatOptions.append(ChatOptions(services))
                    }
                    chatDataa.chatSms = chatSMs
                    chatDataa.chatoptions = chatOptions
                    chatData.append(chatDataa)
                }
 
                completed(chatData)
                
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                completed(nil)
            }
        } else {
            print("Invalid filename/path.")
            completed(nil)
        }
        
        
    }
    
   
}

    
    
 class ChatData {
    
    var chatSms : [ChatSMs]?
    var chatoptions: [ChatOptions]?
}

class ChatSMs {
    
    private var ـtext  : String?
    private var _image  : String?
    
    var txt : String { return ـtext ?? "" }
    var img : String { return _image ?? "" }
    
    
    
    init(_ jsonData : JSON) {
        self.ـtext = jsonData["text"].stringValue
        self._image = jsonData["image"].stringValue
    }
}

class ChatOptions {
  
    private var ـtext  : String?
    private var _code  : Int?
 
    var txt : String { return ـtext ?? "" }
    var code : Int { return _code ?? 0 }

    
    
    init(_ jsonData : JSON) {
        self.ـtext = jsonData["message"].stringValue
        self._code = jsonData["code"].intValue
     }
  }


