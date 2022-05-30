//
//  FileUtilTests.swift
//  musicTests
//
//  Created by pc on 2022/5/28.
//

import XCTest

class FileUtilTests:XCTestCase{
    /// 测试文件大小格式化
    func testFormatFileSize() {
        //第一个参数等于第二个参数
        XCTAssertEqual(FileUtil.formatFileSize(1), "1.00Byte")
        
        //第一个参数等于第二个参数
        //单位换算的时候除以的是1024
        //1234/1024=1.205078125
        //可以看到格式化的时候四舍五入了
        XCTAssertEqual(FileUtil.formatFileSize(1234), "1.21K")
            
        //第一个参数不等于第二个参数
        XCTAssertNotEqual(FileUtil.formatFileSize(1234), "1.23K")
    }
}
