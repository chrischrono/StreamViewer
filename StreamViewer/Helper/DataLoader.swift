//
//  DataLoader.swift
//  StreamViewer
//
//  Created by Christian on 26/05/19.
//  Copyright © 2019 Christian. All rights reserved.
//

import Foundation


struct DataLoader{
    static func loadDataFromFile(filename: String, extension: String) ->  Data? {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: filename, withExtension: `extension`) else {
            return nil
        }
        
        let data = try? Data(contentsOf: url)
        return data
    }
}
