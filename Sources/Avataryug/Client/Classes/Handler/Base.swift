//
//  Base.swift
//  AvatarPluginiOSCore
//
//  Created by Developer1 on 21/02/23.
//

import Foundation

/// <summary>
/// The abstracted base class is designed to simplify API calling by providing a reusable foundation that can be utilized in various programming contexts.
/// </summary>
protocol Base
{
    func CallApi(completionHandler:@escaping(Result<AnyObject,Error>) -> Void)
}
