
//
//  AnswersVC.swift
//  tesss
//
//  Created by admin on 12/27/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class AnswersVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    let strings = ["what a weird Dude you are","Go to hell","what a weird v","what a weird Dude you are","Hi There how  ","Go to hell","really are you","Hi There how can i help you today is everything is okay you can ask me anything you want from here to the end of enitity","Go to hell","really are you want me to go to hell ","what a weird Dude you are"]

    var didSelectAnswer : ((String) -> ())?
    var setAnswerVHeight : ((CGFloat) -> ())?
    var estiamtedHeight : CGFloat = 20

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // to run something in 0.1 seconds
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.setAnswerVHeight?(self.calculateAnswerVHeightHandler())
            self.setAnswerVHeight?(  0 )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return strings.count
    }
    
    func calculateAnswerVHeightHandler() -> CGFloat {
        for x in strings {
            let size = CGSize(width: self.view.frame.width, height: 1000)
            let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: x).boundingRect(with: size, options:
                options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context:
                nil)
            estiamtedHeight += estimatedFrame.height + 30
        }
        return estiamtedHeight
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = CGSize(width: self.view.frame.width, height: 1000)
        let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: strings[indexPath.row]).boundingRect(with: size, options:
            options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context:
            nil)
        return CGSize(width: estimatedFrame.width + 20, height: estimatedFrame.height +  20)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswersCell", for: indexPath) as! AnswersCell
        cell.titleLbl.text = strings[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setAnswerVHeight?(  0 )
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
