//
//  File.swift
//  iosCharts_Starscream_test
//
//  Created by masato on 10/12/2018.
//  Copyright © 2018 masato. All rights reserved.
//

import Foundation


class getCVCBTC {

    var instrumentName: String
    var intervalLabel: String


    init(intervalLabel: String, instrunemtName: String) {
        self.instrumentName = instrunemtName
        self.intervalLabel = intervalLabel
    }


    let instrumentIntDict: [String:Int]  = [
        "ETH/BTC"  : 1,
        "BCH/BTC"  : 2,
        "LTC/BTC"  : 3,
        "DASH/BTC" : 4,
        "ETC/BTC"  : 5,
        "REP/BTC"  : 6,
        "GNT/BTC"  : 7,
        "XMR/BTC"  : 8,
        "BCH/ETH"  : 9,
        "ETC/ETH"  : 10,
        "REP/ETH"  : 11,
        "GNT/ETH"  : 12,
        "LTC/XMR"  : 21,
        "DASH/XMR" : 22,
        "CVC/BTC"  : 23
    ]



    let intervalTimeDict: [String:Int] = [
        "1 minute" : 60,
        "5 minute" : 300,
        "15 minute": 900,
        "30 minute": 1800,
        "1 hour"   : 3600,
        "6 hour"   : 21600,
        "12 hour"  : 21600,
        "1 day"    : 86400,
        "1 week"   : 86400,
        "1 month"  : 86400
    ]



    func jsonToString(dict:Dictionary<String, Any>) -> String
    {
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
            let jsonStr = String(bytes: jsonData, encoding: .utf8)!

            return jsonStr

        } catch let error {
            return (error as! String)
        }
    }


    func getBTCETH_1m ()->String {
        let insideDict:[String:Any] =
            [
                "OMSId":1,
                "InstrumentId": instrumentIntDict[instrumentName],
                "Interval":intervalTimeDict[intervalLabel],
                "IncludeLastCount":100
        ]

        let insideDictToString = jsonToString(dict: insideDict)


        let jsonDict:[String:Any] =
            [
                "m": 0,
                "i": 20,
                "n":"SubscribeTicker",
                "o": insideDictToString
        ]

        let stringJson = jsonToString(dict: jsonDict)

        return stringJson

    }

}

