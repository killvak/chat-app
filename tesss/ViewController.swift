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
    let strings = ["Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me togo gogoogogo go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me togo gogoogogo go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me togo gogoogogo go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me togo gogoogogo go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me togo gogoogogo go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    collectionView.delegate = self
        collectionView.dataSource = self 
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
        estiamtedHeight = value

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
        return strings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row % 2 == 0 else {
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! ChatUserCell
            cell.chatlbl.text = strings[indexPath.row]
            let size = CGSize(width: self.view.frame.width, height: 1000)
            let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: strings[indexPath.row]).boundingRect(with: size, options: options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context: nil)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ChatCell
        cell.chatlbl.text = strings[indexPath.row]
        let size = CGSize(width: self.view.frame.width, height: 1000)
        let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: strings[indexPath.row]).boundingRect(with: size, options: options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context: nil)
         return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: self.view.frame.width, height: 1000)
        let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: strings[indexPath.row]).boundingRect(with: size, options: options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context: nil)
        
        return CGSize(width: self.view.frame.width, height: estimatedFrame.height +  50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (!loadedIdx.contains(indexPath.row)) {
            guard let cellContent = cell as? ChatCell  else{
                animateQuetionCell(cell as! ChatUserCell,indexPath)
                return
            }
//            let cellContent = cell
            let rotationAngleDegrees : Double = -30
            let rotationAngleRadians = rotationAngleDegrees * (Double.pi/180)
            let offsetPositioning = CGPoint(x: collectionView.bounds.size.width, y: -20)
            var transform = CATransform3DIdentity
            transform = CATransform3DRotate(transform, CGFloat(rotationAngleRadians), -50, 0, 1)
            transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50)
            
            cellContent.layer.transform = transform
            cellContent.layer.opacity = 0.2
            
            let delay = 0.06 * Double(indexPath.row)
            UIView.animate(withDuration: 0.8, delay:delay , usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
                cellContent.layer.transform = CATransform3DIdentity
                cellContent.layer.opacity = 1
            }) { (Bool) -> Void in
                
            }
            
            loadedIdx.append(indexPath.row)
        }
        
    }
    
    func animateQuetionCell(_ cell : ChatUserCell,_ indexPath : IndexPath) {
             let cellContent = cell
        let originTxt = cell.chatlbl.text
        cell.chatlbl.text = "..."
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
            cell.chatlbl.text = originTxt
            let delay = 0.06 * Double(indexPath.row)
            UIView.animate(withDuration: 0.8, delay:delay , usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { () -> Void in
                cellContent.layer.transform = CATransform3DIdentity
                cellContent.layer.opacity = 1
            }) { (Bool) -> Void in
                
            }
        }
        
            
            loadedIdx.append(indexPath.row)
 
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setAnswerVHeight(estiamtedHeight)
//        scrollToLastItem()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
    
        if segue.identifier == "ToAnswerVC" , let vc = segue.destination as? AnswersVC{
            
            vc.didSelectAnswer = didSelectAnswer(_:)
            vc.setAnswerVHeight = setAnswerVHeight(_:)
        }
        
    }
    
    
    func didSelectAnswer(_ senderData : String) -> () {
        print(senderData)
        
    }
    
    
    
}
