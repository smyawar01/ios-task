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
    
    var viewController: CampaignListingViewController!

    override func setUpWithError() throws {
      try super.setUpWithError()
       viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "campaignListingViewController") as? CampaignListingViewController
    }

    override func tearDownWithError() throws {
      try super.tearDownWithError()
      viewController = nil
    }

    func testCompaignListingControllerWithLoadingState() throws {
        
        assertSnapshot(matching: viewController, as: .image)
    }
    func testCompaignListingControllerWithLoadedState() throws {
        
        _ = viewController.view
        let campaigns = [CampaignListingView.Campaign.fixture(for: CompaignListingViewControllerTests.self)]
        viewController.typedView.display(campaigns: campaigns)
        let expection = XCTestExpectation(description: "wait")
        let duration = 5.0
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            
            expection.fulfill()
        }
        _ = XCTWaiter.wait(for: [expection], timeout: duration + 1)
        assertSnapshot(matching: viewController, as: .image)
    }
    func testCompaignListingControllerWithDarkMode() throws {
        
      let traitDarkMode = UITraitCollection(
        userInterfaceStyle: UIUserInterfaceStyle.dark)
      assertSnapshot(
        matching: viewController,
        as: .image(on: .iPhoneX, traits: traitDarkMode))
    }
}
