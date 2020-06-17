import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Indie_App_Pack_DisplayTests.allTests),
    ]
}
#endif
