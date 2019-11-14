//
//  ExString.swift
//  YoutubeLikeNetflix
//
//  Created by 鈴木友也 on 2019/11/08.
//  Copyright © 2019 tomoya.suzuki. All rights reserved.
//
import Foundation

extension String {
    func isPTMS() -> Bool {
        return self.contains("PT") && self.contains("M") && self.contains("S")
    }
    
    /*
    
     ex) PT15M51S
     1. mLoc = 4, sLoc = 8 ←なぜか7ではない
     2. mDummy = str[0..<4]
     3. m = 15
     4. sDummy = str[4...6]
     5. s = 51
     
     */
    func toMS () -> String {
        let str = self
        // M, Sの位置を取得
        let mLoc = str.range(of: "M")?.lowerBound
        let sLoc = str.endIndex
        
        var mDummy = str[str.startIndex..<mLoc!]
        mDummy.removeFirst() // Pを削除
        mDummy.removeFirst() // Tを削除
        
        let m = String(mDummy)
        
        
        var sDummy = str[mLoc!..<sLoc]
        sDummy.removeFirst() // Mを削除
        sDummy.removeLast() // Sを削除
        
        var s = String(sDummy)
        
        if s.count == 1 {
            s = "0" + s
        }
        
        return m + ":" + s
    }
    
    func addMidPoint() -> String {
        return self + "・"
    }
    
    func formatDateString() -> String {
        let array = self.split(separator: "-")
        
        let y = array[0]
        let m = array[1]
        let d = array[2].prefix(2)
        
        return y + "年" + m + "月" + d + "日"
    }
    
    func formatIntString() -> String {
//        if let range = self.range(of: ",") {
//            str.replaceSubrange(range, with: "")
//        }
        
        guard let int = Int(self), self.count > 5 else { return self}
        
        return String(int / 10000) + "万"
    }
}
