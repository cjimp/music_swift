//
//  StringExtendTests.swift
//  musicTests
//
//  Created by pc on 2022/5/27.
//

import XCTest

class StringExtendTests: XCTestCase {
    //测试手机号格式
    func testIsPhone() {
        //这里使用断言来判断结果一定为true.  swift中
        assert("13141111111".isPhone())
        //错误的一个判断.    判断框架中
        XCTAssertFalse("test".isPhone())
    }
}
