//
//  CompaignCellTests.swift
//  CampaignBrowserSnapShotTests
//
//  Created by Yawar Ali on 15/01/2022.
//  Copyright © 2022 Westwing GmbH. All rights reserved.
//

import XCTest
@testable import CampaignBrowser
import SnapshotTesting

class CampaignCellTests: XCTestCase {

    var viewController: UIViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        let collectionView = CampaignListingView(frame:CGRect(x),
//                                   collectionViewLayout:UICollectionViewFlowLayout())
//            
//        collectionView.register(CampaignCell.self, forCellWithReuseIdentifier: "campaignCell")
//        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "campaignCell", for: IndexPath(row: 0, section: 0)) as? CampaignCell
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "campaignListingViewController") as? CampaignListingViewController
        _ = viewController.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewController = nil
    }
    func testCampaignCell() throws {
//        assertSnapshot(matching: cell, as: .waiting(for: 5, on: .image))
    }
}
