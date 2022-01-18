//
//  SnapShot+Async.swift
//  CampaignBrowserSnapShotTests
//
//  Created by Yawar Ali on 14/01/2022.
//  Copyright © 2022 Westwing GmbH. All rights reserved.
//

import Foundation
import SnapshotTesting
import XCTest

extension Snapshotting {
  static func waiting(
    for duration: TimeInterval,
    on strategy: Snapshotting
  ) -> Snapshotting {
    return strategy.pullback { value in
      let expectation = XCTestExpectation(description: "Wait")
      DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
        expectation.fulfill()
      }
      _ = XCTWaiter.wait(for: [expectation], timeout: duration + 1)
      return value
    }
  }
}
