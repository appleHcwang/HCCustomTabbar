//
//  UIImage+RayExtension.swift
//  tabbarmiddleBtn
//
//  Created by ray on 2016/10/15.
//  Copyright © 2016年 Ray. All rights reserved.
//

import UIKit

extension UIImage{
    
//    将颜色转图片
    class func imageWithColor(color: UIColor) -> UIImage {
        
//        绘制矩形
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
//        开启图形上下文
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
//        获得图形上下文
        let context:CGContext = UIGraphicsGetCurrentContext()!
//        使用color演示填充上下文
        context.setFillColor(color.cgColor)
//        渲染上下文
        context.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
//        关闭图形上下文
        UIGraphicsEndImageContext()
        
        return ((image)!)
}

}
