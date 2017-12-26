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
    
 
    let strings = ["Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me togo gogoogogo go to hell ","what a weird Dude you are","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    
    
}
