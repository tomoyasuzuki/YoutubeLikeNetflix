//
//  ResponseError.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/03.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//

enum ResponseError: Error {
    case unexpectedResponse
    case unexpectedStatusCode
}