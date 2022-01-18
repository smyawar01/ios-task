//
//  CompaignListingViewControllerTests.swift
//  CampaignBrowserSnapShotTests
//
//  Created by Yawar Ali on 14/01/2022.
//  Copyright © 2022 Westwing GmbH. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import CampaignBrowser

class CompaignListingViewControllerTests: XCTestCase {
    
    var viewController: UIViewController!

    override func setUpWithError() throws {
      try super.setUpWithError()
       viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "campaignListingViewController") as? CampaignListingViewController
    }

    override func tearDownWithError() throws {
      try super.tearDownWithError()
      viewController = nil
    }

    func testCompaignListingControllerWithLoadingState() throws {
        
        assertSnapshot(matching: viewController, as: .waiting(for: 5, on: .image))
    }
    func testCompaignListingControllerWithDarkMode() throws {
        
      let traitDarkMode = UITraitCollection(
        userInterfaceStyle: UIUserInterfaceStyle.dark)
      assertSnapshot(
        matching: viewController,
        as: .image(on: .iPhoneX, traits: traitDarkMode))
    }
}
