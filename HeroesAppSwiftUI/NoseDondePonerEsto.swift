//
//  NoseDondePonerEsto.swift
//  HeroesAppSwiftUI
//
//  Created by Fran Malo on 11/4/24.
//

import Foundation


func averageColor(of image: UIImage) -> UIColor? {
    guard let inputImage = CIImage(image: image) else { return nil }
    
    let extentVector = CIVector(x: inputImage.extent.origin.x, y: inputImage.extent.origin.y, z: inputImage.extent.size.width, w: inputImage.extent.size.height)
    guard let filter = CIFilter(name: "CIAreaAverage", parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
    
    guard let outputImage = filter.outputImage else { return nil }
    
    var bitmap = [UInt8](repeating: 0, count: 4)
    let context = CIContext(options: nil)
    context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: CIFormat.RGBA8, colorSpace: nil)
    
    let red = CGFloat(bitmap[0]) / 255.0
    let green = CGFloat(bitmap[1]) / 255.0
    let blue = CGFloat(bitmap[2]) / 255.0
    
    return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}
