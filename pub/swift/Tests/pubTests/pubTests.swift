import XCTest
@testable import pub

final class pubTests: XCTestCase {
  func testGlass() {
    XCTAssertNotNil(Glass(capacity: 20))
  }

  func testGlassCannotHaveZeroCapacity() {
    XCTAssertNil(Glass(capacity: 0))
  }

  func testGlassCannotHaveNegativeCapacity() {
    XCTAssertNil(Glass(capacity: -1))
  }

  func testGlassIsInitiallyFull() {
    let capacity = 20
    let glass = Glass(capacity: capacity)!
    XCTAssertEqual(glass.floz, capacity)
  }
  
  func testCanDrinkFromAGlass() {
    let glass = Glass(capacity: 20)!
    XCTAssertNotNil(glass.drink())
  }

  func testDrinkingDecreasesFlozByOne() {
    let glass = Glass(capacity: 20)!
    let newGlass = glass.drink()
    XCTAssertEqual(glass.floz, newGlass.floz + 1)
  }

  func testQuaffingDecreasesFlozByFour() {
    let glass = Glass(capacity: 20)!
    let newGlass = glass.quaff()
    XCTAssertEqual(glass.floz, newGlass.floz + 4)
  }

  func testDrinkingFromEmptyGlassDoesNothing() {
    let glass = Glass(capacity: 1)!
    let emptyGlass = glass.drink()
    XCTAssertEqual(emptyGlass.drink().floz, emptyGlass.floz)
  }

  func testQuaffingFromEmptyGlassDoesNothing() {
    let glass = Glass(capacity: 1)!
    let emptyGlass = glass.drink()
    XCTAssertEqual(emptyGlass.quaff().floz, emptyGlass.floz)
  }

  func testCannotQuaffMoreThanIsInTheGlass() {
    for floz in 1...3 {
      let glass = Glass(capacity: floz)!
      let emptyGlass = glass.quaff()
      XCTAssertEqual(emptyGlass.floz, 0)
    }
  }

  func testDowningEmptiesGlass() {
    for floz in 1...100 {
      let glass = Glass(capacity: floz)!
      let emptyGlass = glass.down()
      XCTAssertEqual(emptyGlass.floz, 0)
    }
  }

  func testCannotFillNonEmptyGlass() {
    let glass = Glass(capacity: 20)!
    XCTAssertNil(glass.fill())
  }

  func testFilledGlassIsFilledToCapacity() {
    for floz in 1...100 {
      let glass = Glass(capacity: floz)!
      let emptyGlass = glass.down()
      let filledGlass = emptyGlass.fill()!
      XCTAssertEqual(filledGlass.floz, filledGlass.capacity)
    }
  }

  func testPintHas20floz() {
    XCTAssertEqual(pint().capacity, 20)
  }

  func testHalfPintHas10floz() {
    XCTAssertEqual(halfpint().capacity, 10)
  }

  func testJugHas60floz() {
    XCTAssertEqual(jug().capacity, 60)
  }

  static var allTests = [
    ("testGlass", testGlass),
    ("testGlassCannotHaveZeroCapacity", testGlassCannotHaveZeroCapacity),
    ("testGlassCannotHaveNegativeCapacity", testGlassCannotHaveZeroCapacity),
    ("testGlassIsInitiallyFull", testGlassIsInitiallyFull),
    ("testCanDrinkFromAGlass", testCanDrinkFromAGlass),
    ("testDrinkingDecreasesFlozByOne", testDrinkingDecreasesFlozByOne),
    ("testQuaffingDecreasesFlozByFour", testQuaffingDecreasesFlozByFour),
    ("testDrinkingFromEmptyGlassDoesNothing", testDrinkingFromEmptyGlassDoesNothing),
    ("testCannotQuaffMoreThanIsInTheGlass", testCannotQuaffMoreThanIsInTheGlass),
    ("testQuaffingFromEmptyGlassDoesNothing", testQuaffingFromEmptyGlassDoesNothing),
    ("testDowningEmptiesGlass", testDowningEmptiesGlass),
    ("testCannotFillNonEmptyGlass", testCannotFillNonEmptyGlass),
    ("testFilledGlassIsFilledToCapacity", testFilledGlassIsFilledToCapacity),
    ("testPintHas20floz", testPintHas20floz),
    ("testHalfPintHas10floz", testHalfPintHas10floz),
    ("testJugHas60floz", testJugHas60floz),
  ]
}
