//
//  CampaignBrowserSnapShotTests.swift
//  CampaignBrowserSnapShotTests
//
//  Created by Yawar Ali on 14/01/2022.
//  Copyright © 2022 Westwing GmbH. All rights reserved.
//

import XCTest
@testable import CampaignBrowser
import SnapshotTesting

class LabelWithPaddingTests: XCTestCase {
    
    func testLabelWithLeftAndRightPadding() throws {
        
        let label = LabelWithPadding()
        label.text = "Test label title."
        
        assertSnapshot(matching: label, as: .image)
    }
    func testLabelTextGoesToTwoLines() {
        
        let label = LabelWithPadding()
        label.numberOfLines = 2
        label.text = "This is a very very long text in order to \n check title label with double lines and truncate the text after that."
        assertSnapshot(matching: label, as: .image)
        
    }
    func testLabelTextTruncateAfterTwoLines() throws {
        
        let label = LabelWithPadding()
        label.numberOfLines = 2
        label.text = "This is a very very long text in order to \n check title label with double lines\n and truncate the text after that."
        assertSnapshot(matching: label, as: .image)
        
    }
    func testdescriptionLabelTextWithMultipleLines() throws {
        
        let label = LabelWithPadding()
        label.numberOfLines = 0
        label.text = "This \nis \na very very\n long text in order to \n check description \nlabel with \ndouble lines\n and \n doest not truncate the\n text after that."
        assertSnapshot(matching: label, as: .image)
    }
}
