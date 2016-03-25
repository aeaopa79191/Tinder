//
//  CardsViewController.swift
//  Tinder
//
//  Created by KaKin Chiu on 3/24/16.
//  Copyright © 2016 KaKinChiu. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var direction: CGFloat = 1.0

    var imageOriginalCenter: CGPoint!
    
    @IBOutlet weak var customProfileImageView: DraggableImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        customProfileImageView.image = UIImage(named: "ryan")
        imageOriginalCenter = customProfileImageView.center
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let secondViewController = storyboard.instantiateViewControllerWithIdentifier("SecondVC") as! ProfileViewController
//        presentViewController(secondViewController, animated: true, completion: nil)
//        
//        let destinationVC = segue.destinationViewController as! ProfileViewController
//        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
//    }
    
    @IBAction func photoDrag(sender: UIPanGestureRecognizer) {
        let translation = sender.translationInView(view)
        let point = sender.locationInView(view)
        
        if sender.state == .Began {
            
            direction = point.y > 152 ? -0.2 : 0.2
            
        } else if sender.state == .Changed {
            
            customProfileImageView.center = CGPoint(x: imageOriginalCenter.x + translation.x, y: imageOriginalCenter.y)
            
            customProfileImageView.transform = CGAffineTransformMakeRotation((direction * translation.x * CGFloat(M_PI)) / 180.0)
        } else if sender.state == .Ended {
            if translation.x > 50 {
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.customProfileImageView.center = CGPoint(x: 600, y: self.imageOriginalCenter.y)
                })
            } else if translation.x < -50 {
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    self.customProfileImageView.center = CGPoint(x: -300, y: self.imageOriginalCenter.y)
                })
            } else {
                UIView.animateWithDuration(0.5, animations: { () -> Void in
//                    self.resetImage()
                })
            }
        }
    }
    }
    

    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


