//
//  ImageService.swift
//  WantedPreOnboarding
//
//  Created by 김규철 on 2023/03/05.
//

import Foundation
import UIKit

public class ImageService {
    public static let shared = ImageService()
    
    private init() { }
    
    func loadImage(from url: URL, success: @escaping((_ image:UIImage)->()), failure: @escaping ((_ msg:String)->())) {
    
        URLSession.shared.dataTask(with: url) { (data, urlrespinse, error) in
            guard let data = data, error == nil else {
                failure("Image error")
                return
            }
            
            DispatchQueue.main.async() {
                if let img = UIImage(data: data) {
                    success(img)
                }
            }
        }.resume()
    }
}
