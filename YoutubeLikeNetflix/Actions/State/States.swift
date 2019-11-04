//
//  ActionProtocol.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/02.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import YoutubeKit

protocol StateProtocol {}

extension VideoList: StateProtocol {}

typealias CategoryIds = [String]
