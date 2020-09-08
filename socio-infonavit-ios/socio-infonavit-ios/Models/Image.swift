//
//  Image.swift
//  socio-infonavit-ios
//
//  Created by Ricardo Granja on 08/09/20.
//  Copyright © 2020 Ricardo Granja. All rights reserved.
//

import Foundation
import UIKit

class Image {
    static func downloadImage(url : String, completion : @escaping (_ content: UIImage, _ error: Error?) -> Void) {
        guard let imageUrlString = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageUrlString) { (data, response, error) in
            if let Error = error {
                completion(UIImage(), Error)
            }
            else if let data = data {
                if let image = UIImage(data: data) {
                    completion(image, nil)
                }
            }
        }.resume()
    }
}
