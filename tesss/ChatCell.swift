//
//  ChatCell.swift
//  tesss
//
//  Created by admin on 12/26/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ChatCell: BaseCell {
    
    @IBOutlet weak var containerView: UIViewX!
    @IBOutlet weak var chatlbl: UILabel!
 
    override var cellLabel: String? {
        set {
            //            super.cellLabel = newValue
        }
        get {
            return chatlbl.text
        }
    }
    
    override var cellId: Int? {
        set {
            super.cellId = newValue
        }
        get {
            return super.cellId
        }
    }
    
    
    override func configCell(_ value: String, cellID : Int?) {
        
        self.chatlbl.text = value
        self.cellId = cellID
    }
    
}


class ChatUserCell: BaseCell {
    @IBOutlet weak var containerView: UIViewX!
    @IBOutlet weak var chatlbl: UILabel!
   
    override var cellLabel: String? {
        set {
//            super.cellLabel = newValue
        }
        get {
            return chatlbl.text
        }
    }
    override var cellId: Int? {
        set {
            super.cellId = newValue
        }
        get {
            return super.cellId
        }
    }
    
    override func configCell(_ value: String, cellID : Int?) {

        self.chatlbl.text = value
        self.cellId = cellID
    }
}



class BaseCell : UICollectionViewCell {
    
    var cellLabel : String?
    var cellId : Int?
     func configCell(_ value: String, cellID : Int?) {

        
    }


}
