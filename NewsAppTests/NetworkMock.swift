//
//  NetworkMock.swift
//  NewsAppTests
//
//  Created by Mohamed Korany on 8/23/20.
//  Copyright © 2020 Mohamed Korany. All rights reserved.
//
/*
import Foundation
import XCTest
import Mockit
@testable import NewsApp
public class NetowrkMock : Networkable {
    var topHeadLinsCalled = false
    var completeClosure : newsCompletionHandler?
    public func fetchData<T>(target: NewsAPI, complitionHandler: @escaping (T?, APIError?) -> ()) where T : Decodable, T : Encodable {
        topHeadLinsCalled = true
        //completeClosure = complitionHandler
    }
}



class NetworkMockMockit : NewtorkManger , Mock{
    let callHandler: CallHandler
    
    
    init(testCase: XCTestCase) {
       callHandler = CallHandlerImpl(withTestCase: testCase)
     }
    
    func instanceType() -> NetworkMockMockit {
      return self
    }
    
    public override func fetchData<T>(target: NewsAPI, complitionHandler: @escaping (T?, APIError?) -> ()) where T : Decodable, T : Encodable {
        super.fetchData(target: target, complitionHandler: complitionHandler)
           _ = callHandler.accept(nil, ofFunction: #function, atFile: #file, inLine: #line, withArgs: target , complitionHandler)
       }
    
    
}
*/
