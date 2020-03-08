//
//  UIView+RayExtension.swift
//  tabbarmiddleBtn
//
//  Created by ray on 2016/10/15.
//  Copyright © 2016年 Ray. All rights reserved.
//

import UIKit

//方便后面获取 和修改一些属性
extension UIView{
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    var size:CGSize{
        get {
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    var centerX:CGFloat{
        get{
            return self.center.x
        }
        set{
            self.center.x = newValue
        }
    }
    var centerY:CGFloat{
        get{
            return self.center.y
        }
        set{
            self.center.y = newValue
        }
    }
    
    var borderWidth:CGFloat{
        get{
            return self.layer.borderWidth
        }
        set{
            if newValue < 0 {
                return
            }
            self.layer.borderWidth = newValue
        }
    }
    
    var borderColor:UIColor{
        get{
            return self.borderColor
        }
        set{
            self.layer.borderColor = newValue.cgColor
        }
    }
    
    var cornerRadius:CGFloat{
        get{
            return self.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    
    
//    水平居中
    func alignHorizontal(){
        if let superView = self.superview{
            self.x = (superView.width - self.width) * 0.5
        }
    }
    
//    垂直居中
    func alignVertical(){
        if let superView = self.superview {
            self.y = (superView.height - self.height) * 0.5
        }
    }
    
//    下面代码没有用到 写出来了为了高度还原原oc版作者代码
//    判断是否显示在主窗口上
    func isShowOnWindow()->Bool{
        
        let keyWindow = UIApplication.shared.keyWindow
        if let curWindow = keyWindow {
            let newRect = curWindow.convert(self.frame, from: self.superview)
            let winBounds = curWindow.bounds
            let isIntersects = newRect.intersects(winBounds)
            if self.isHidden != true && self.alpha > 0.01 && self.window == keyWindow && isIntersects {
                return true
            }
        }
        return false
    }
    
    func parentController()->UIViewController?{
        let responder = self.next
        //className
        while(responder != nil){
            if responder!.isKind(of: UIViewController.self){
                return responder as? UIViewController
            }
        }
        return nil
    }
    
}
