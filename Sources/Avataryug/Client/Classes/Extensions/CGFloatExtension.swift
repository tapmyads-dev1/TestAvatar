//
//  CGFloatExtension.swift
//  SDKClientSwift
//
//  Created by Developer1 on 18/07/23.
//

import Foundation

extension CGFloat
{
    func Remap(from1: CGFloat, to1 : CGFloat, from2 : CGFloat, to2 :CGFloat) -> CGFloat
    {
        return (self - from1) / (to1 - from1) * (to2 - from2) + from2;
    }
}
