
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
    var chatData: [ChatData] = [] {
        didSet {
            chatoptions = chatData[0].chatoptions!
            collectionView.reloadData()
        }
    }
    var chatoptions: [ChatOptions] = [] {
        didSet {
//            self.setAnswerVHeight?(self.calculateAnswerVHeightHandler())
        }
    }

    weak var delegateClass : ViewController?
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
//            self.setAnswerVHeight?(  0 )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatoptions.count
    }
    
    func calculateAnswerVHeightHandler() -> CGFloat {
        for x in chatoptions {
            let size = CGSize(width: self.view.frame.width, height: 1000)
            let options =  NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: x.txt).boundingRect(with: size, options:
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
        let estimatedFrame = NSString(string: chatoptions[indexPath.row].txt).boundingRect(with: size, options:
            options, attributes: [ NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)], context:
            nil)
        return CGSize(width: estimatedFrame.width + 20, height: estimatedFrame.height +  20)

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnswersCell", for: indexPath) as! AnswersCell
        cell.titleLbl.text = chatoptions[indexPath.row].txt
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setAnswerVHeight?(  0 )
        let code = chatoptions[indexPath.row].code
        delegateClass?.selectedCodeIndex = code == -1 ? 0 : chatoptions[indexPath.row].code

//        guard code != -1 else { return }
//        delegateClass?.chatSms = chatData[code].chatSms!
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
//            self.chatoptions = self.chatData[code].chatoptions!
//            self.collectionView.reloadData()
//        }

        
        
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
