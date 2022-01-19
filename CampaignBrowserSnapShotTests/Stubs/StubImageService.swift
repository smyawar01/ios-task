//
//  StubImageService.swift
//  CampaignBrowser
//
//  Created by Yawar Ali on 19/01/2022.
//  Copyright © 2022 Westwing GmbH. All rights reserved.
//

import Foundation
@testable import CampaignBrowser
import UIKit
import RxSwift
import RxCocoa

enum ImageError: Error {
    
    case noImage(String)
}

struct StubImageService: ImageProvider {
    
    let className: AnyClass
    func getImage(url: URL) -> Observable<UIImage> {
        
        let bundle = Bundle(for: className)
        let image = UIImage(named: "moodImage",
                            in: bundle,
                            compatibleWith: nil)
        if let unwrappedImage = image {
            
            return Observable<UIImage>.just(unwrappedImage)
        }
        let error = ImageError.noImage("No Preview Image Available.")
        return Observable<UIImage>.error(error)
    }
}
