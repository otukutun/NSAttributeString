//
//  ViewController.swift
//  NSAttributeString
//
//  Created by otukutun on 12/16/16.
//  Copyright © 2016 otukutun. All rights reserved.
//

// REF:http://qiita.com/you_matz/items/bbf0e6632cc56823948a
// REF: http://yoshiminu.tumblr.com/post/94352468923/objective-cnsattributedstring%E3%81%A7%E3%83%AA%E3%83%B3%E3%82%AF%E6%96%87%E5%AD%97%E3%82%92%E4%BD%9C%E3%82%8B
// REF:http://blog.kishikawakatsumi.com/entry/20130605/1370370925

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let attrText = NSMutableAttributedString(string: "装飾される文字列 リンクっぽくしたい")
        
        // 文字色
        attrText.addAttributes([NSForegroundColorAttributeName: UIColor.blue], range: NSMakeRange(1, 4))
        
        
        attrText.addAttributes([NSLinkAttributeName:  NSURL(string: "https://github.com/otukutun")!], range: NSMakeRange(5, 9))
        
        // 背景色
        //attrText.addAttributes([NSBackgroundColorAttributeName: GSSettings.unreadNotificationColor()], range: NSMakeRange(1, 4))
        
        // フォント(Bold、サイズはUILabelの標準サイズ)
        attrText.addAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)], range: NSMakeRange(0, 1))

        
        self.sampleLabel.attributedText = attrText
        
        
        //UILabelのTouchイベント追加
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.openSafariView(sendor:)))
        self.sampleLabel.addGestureRecognizer(gesture)
        
        
        
        let textViewAttrString = NSMutableAttributedString(string: "こんにちは　詳しくはこちら")
        
        textViewAttrString.addAttributes([NSForegroundColorAttributeName: UIColor.blue], range: NSMakeRange(1, 4))
        
        self.sampleTextView.attributedText = textViewAttrString
        
        //UITextViewのTouchイベント追加
        let textViewGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.openSafariViewWithUITextView(sendor:)))
        self.sampleTextView.addGestureRecognizer(textViewGesture)
        
    }
    
    func openSafariView(sendor: UIGestureRecognizer) {
        print("hoge")

        print("Can not specify which position you touched.")
    }
    
    func openSafariViewWithUITextView(sendor: UIGestureRecognizer) {
        
        print("hoge")
        
        //
        let touchedLocation:CGPoint = sendor.location(in: self.sampleTextView)
        let textPosition:UITextPosition = self.sampleTextView.closestPosition(to: touchedLocation)!
        
        let selectedPosition:NSInteger = self.sampleTextView.offset(from: self.sampleTextView.beginningOfDocument, to: textPosition)
        
        
        let linkRange:NSRange = NSMakeRange(10, 3)
        
        if NSLocationInRange(selectedPosition, linkRange) {
            print("touched")
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var sampleTextView: UITextView!

    @IBOutlet weak var sampleLabel: UILabel!

}

