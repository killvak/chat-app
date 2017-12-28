//
//  ViewController.swift
//  tesss
//
//  Created by admin on 12/25/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var selectionViewHeight: NSLayoutConstraint!
    var loadedIdx : [Int] = []
    var estiamtedHeight : CGFloat = 0
    private let localRequest  = LocalServicesRequests()
    fileprivate var chatData : [ChatData]?
    fileprivate let syncQueue = DispatchQueue(label: "Cells")
    var selectedCodeIndex = 0 {
        didSet {
            dispatchQueue(selectedCodeIndex)
        }
    }
    var chatSms : [ChatSMs] = []
//    {
//        didSet {
//            for (i,x) in chatSms.enumerated() {
////                delay(bySeconds: 0.4 * Double(i) , closure: {
//                    self.chatArray.append(x.txt)
////                })
//            }
//        }
//    }
   fileprivate var chatoptions: [ChatOptions] = []
    fileprivate var chatArray: [String] = []
    fileprivate var didSelectAnswer: Bool = false

    weak var delegateClass : AnswersVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    collectionView.delegate = self
        collectionView.dataSource = self
        
        
        localRequest.parseChatLocalData { [weak self ](data) in
            guard let dataa = data  else {
                return
            }
            self?.chatData = dataa
            self?.delegateClass?.chatData = dataa
            for (i,x) in dataa[0].chatSms!.enumerated(){
//                let delay = 0.6 * Double(i)
//                delay(bySeconds: delay, closure: {
//                     self?.chatArray.append(x.txt)
//                })
                
//                self?.delay(bySeconds: delay, closure: {
                    self?.chatArray.append(x.txt)
//                    self?.collectionView.reloadItems(at: [IndexPath(row: i  , section: 0)])
//                    self?.collectionView.reloadData()
//                })
            
            }
//             for item in dataa {
////                self?.chatSms = item.chatSms!
////                self?.chatoptions = item.chatoptions!
// //                for opt in item.chatoptions! {
////                    let intt = opt.code
////                    print(opt.txt)
////                    if intt != -1 {
//////                        self?.qAnda[opt.txt] = dataa[intt].chatSms
////                    }
////                }
//            }
 
         }
    }


    

    func setAnswerVHeight(_ value : CGFloat) {
        guard value != 0 else {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                
                self.selectionViewHeight.constant += 10
                self.view.layoutIfNeeded()
            }) { (true) in
                UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    
                    self.selectionViewHeight.constant = value
                    self.view.layoutIfNeeded()
                }) { (true) in
//                    self.scrollToLastItem()

                }
            }
            return
        }
//        estiamtedHeight = value

        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            
            self.selectionViewHeight.constant = value
            self.view.layoutIfNeeded()
        }) { (true) in
          }
        
        
    }
    func scrollToLastItem() {
        let item = self.collectionView(self.collectionView!, numberOfItemsInSection: 0) - 1
        let lastItemIndex = IndexPath(item: item, section: 0)
        collectionView?.scrollToItem(at: lastItemIndex, at: UICollectionViewScrollPosition.top, animated: true)
      
        
    }
}



extension ViewController : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell  : BaseCell?
        if didSelectAnswer  {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ChatCell
        }else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! ChatUserCell
            didSelectAnswer = false
        }
        cell!.configCell(chatArray[indexPath.row], cellID: nil)
        return cell!
    }
    
 
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: self.view.frame.width, height: 1000)
        let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: chatArray[indexPath.row]).boundingRect(with: size, options: options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context: nil)
        
        return CGSize(width: self.view.frame.width, height: estimatedFrame.height +  50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (!loadedIdx.contains(indexPath.row)) , let cell = cell as? BaseCell {
//            guard let cellContent = cell as? ChatCell  else{
                animateQuetionCell(cell,indexPath)
        }
//                return
//            }
 ////            let cellContent = cell
//            let rotationAngleDegrees : Double = -30
//            let rotationAngleRadians = rotationAngleDegrees * (Double.pi/180)
//            let offsetPositioning = CGPoint(x: collectionView.bounds.size.width, y: -20)
//            var transform = CATransform3DIdentity
//            transform = CATransform3DRotate(transform, CGFloat(rotationAngleRadians), -50, 0, 1)
//            transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50)
//
//            cellContent.layer.transform = transform
//            cellContent.layer.opacity = 0.2
//
//            let delay = 0.06 * Double(indexPath.row)
//            UIView.animate(withDuration: 0.8, delay:delay , usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
//                cellContent.layer.transform = CATransform3DIdentity
//                cellContent.layer.opacity = 1
//            }) { (Bool) -> Void in
//                self.scrollToLastItem()
//            }
//
//            loadedIdx.append(indexPath.row)
//        }
        
    }
    
    func animateQuetionCell(_ cell : BaseCell,_ indexPath : IndexPath) {
             let cellContent = cell
        
        let originTxt = cell.cellLabel
        cell.configCell("...", cellID: nil)
        UIView.animate(withDuration: 0.1, delay:0.9 , usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
            let rotationAngleDegrees : Double = -30
            let rotationAngleRadians = rotationAngleDegrees * (Double.pi/180)
            let offsetPositioning = CGPoint(x: self.collectionView.bounds.size.width, y: -20)
            var transform = CATransform3DIdentity
            transform = CATransform3DRotate(transform, CGFloat(rotationAngleRadians), -50, 0, 1)
            transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50)
            
            cellContent.layer.transform = transform
            cellContent.layer.opacity = 0.2
        }){ (true) in
            cell.configCell(originTxt ?? "", cellID: nil)
            let delay = 0.06 * Double(indexPath.row)
            UIView.animate(withDuration: 0.8, delay:delay , usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
                cellContent.layer.transform = CATransform3DIdentity
                cellContent.layer.opacity = 1
            }) { (Bool) -> Void in
                self.scrollToLastItem()
            }
        }
        
            
            loadedIdx.append(indexPath.row)
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        setAnswerVHeight(estiamtedHeight)
//        scrollToLastItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
    
        if segue.identifier == "ToAnswerVC" , let vc = segue.destination as? AnswersVC{
            
            vc.didSelectAnswer = didSelectAnswer(_:)
            vc.setAnswerVHeight = setAnswerVHeight(_:)
            self.delegateClass =  vc
            vc.delegateClass = self
        }
        
    }
    
    
    func didSelectAnswer(_ senderData : String) -> () {
        print(senderData)
        
        
    }
    
    func dispatchQueue(_ index : Int) {
        print("that's index : /*/*/*/*/ \(index)")

        let selectedData = chatData![index]
       let estiaHeight =  calculateAnswerVHeightHandler(chatData![index].chatoptions!)
        
        estiamtedHeight = 0
        for (i,x) in selectedData.chatSms!.enumerated() {
            
            let delay = 0.09 * Double(i)

            syncQueue.asyncAfter(deadline: .now() + delay, execute: {
                
                self.chatArray.append(x.txt)
                if i == selectedData.chatSms!.count - 1  {
                    self.syncQueue.asyncAfter(deadline: .now() + Double( 1.2), execute: {
                        DispatchQueue.main.async {
                            self.delegateClass?.chatoptions = selectedData.chatoptions!
                            print("that;s the estimated Height  : \(estiaHeight)")
                            self.setAnswerVHeight(estiaHeight)
//                            self.collectionView.isHidden = false
//                            self.collectionView.reloadData()
                        }
                    })

                    
                }
            })
        }
    }
    
    func calculateAnswerVHeightHandler(_ data : [ChatOptions]) -> CGFloat {
        for x in data {
            let size = CGSize(width: self.view.frame.width, height: 1000)
            let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: x.txt).boundingRect(with: size, options:
                options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context:
                nil)
            estiamtedHeight += estimatedFrame.height + 30
        }
        return estiamtedHeight
     }
        
//        syncQueue.asyncAfter(deadline: .now() + Double( 1 +  index), execute: {
//            print("that's index : /*/*/*/*/ \(index)")
//
//            //})
//            //            syncQueue.sync {
//            //                listCount += 1
//            //
//            //            UIView.animate(withDuration: 0.0, delay: 4.4 * index , animations: {
//            DispatchQueue.main.async {
//
//
////                self.list.append(item.txt)
////                let rowPlus1  = IndexPath(row:  self.list.count - 1 , section: 0)
////                //                DispatchQueue.main.async {
////                self.tableView.beginUpdates()
////                self.tableView.insertRows(at: [rowPlus1], with: .automatic)
////                self.tableView.endUpdates()
////                self.tableView.scrollToRow(at: rowPlus1, at: .bottom, animated: false)
//                //                 }
//                //            }, completion: {(true) in
////                if ( value.count - 1 == i ) {
////                    //                    DispatchQueue.main.async {
////                    self.syncQueue.asyncAfter(deadline: .now() + Double( 2.2), execute: {
////                        DispatchQueue.main.async {
//////                            self.collectionView.isHidden = false
//////                            self.collectionView.reloadData()
////                        }
////                    })
////                }
//            }
//
//            //                }
//            //            })
//        })
//    }
    public func delay(bySeconds seconds: Double, dispatchLevel: DispatchLevel = .main, closure: @escaping () -> Void) {
        let dispatchTime = DispatchTime.now() + seconds
        dispatchLevel.dispatchQueue.asyncAfter(deadline: dispatchTime, execute: closure)
    }
    
    public enum DispatchLevel {
        case main, userInteractive, userInitiated, utility, background
        var dispatchQueue: DispatchQueue {
            switch self {
            case .main:                 return DispatchQueue.main
            case .userInteractive:      return DispatchQueue.global(qos: .userInteractive)
            case .userInitiated:        return DispatchQueue.global(qos: .userInitiated)
            case .utility:              return DispatchQueue.global(qos: .utility)
            case .background:           return DispatchQueue.global(qos: .background)
            }
        }
    }
}





