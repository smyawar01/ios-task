//
//  PaddingLabel+Fixture.swift
//  CampaignBrowser
//
//  Created by Yawar Ali on 19/01/2022.
//  Copyright © 2022 Westwing GmbH. All rights reserved.
//

import Foundation
@testable import CampaignBrowser
import UIKit

extension CampaignListingView.Campaign {
    
    static func fixture(for className: AnyClass) -> CampaignListingView.Campaign {
        
        //** Just to satisfy the requirement and image will be served from test bundle assets */
        let imageUrl = URL(string: "https://cdn-ww.westwing.com/image/upload/f_jpg,t_default.campaign_large_43/v1504017209/club/de/campaign/DEIDEA3/original")!
        
        return .init(name: "Kreative Wandideen",
                     description: "Wir machen uns viele Gedanken, wenn es ums die Wahl der Möbel oder die passende Deko geht. Doch auch eine persönlich gestaltete Wand kann ein eindrucksvolles Wohn-Statement sein. Denn es gibt viele Möglichkeiten, sich auszutoben. Von praktischen Bilderleisten, die schnelle Veränderungen erlauben, über Memoboards bis zu leuchtenden Schriftzügen – diese kreativen Ideen machen Lust aufs Gestalten.",
                     moodImage: StubImageService(className: className).getImage(url: imageUrl))
    }
}
