//
//  DraggableImageView.swift
//  Tinder
//
//  Created by KaKin Chiu on 3/24/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
    // Drawing code
    }
    */
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        // custom initialization logic
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

}
