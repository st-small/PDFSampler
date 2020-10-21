//
//  SampleWatermark.swift
//  PDFSampler
//
//  Created by Stanly Shiyanovskiy on 16.10.2020.
//

import PDFKit
import UIKit

public final class SampleWatermark: PDFPage {

    public override func draw(with box: PDFDisplayBox, to context: CGContext) {
        super.draw(with: box, to: context)

        let string: NSString = "SAMPLE CHAPTER"
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 32)]
        let stringSize = string.size(withAttributes: attributes)

        UIGraphicsPushContext(context)
        context.saveGState()

        let pageBounds = bounds(for: box)
        context.translateBy(x: (pageBounds.size.width - stringSize.width) / 2, y: pageBounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        string.draw(at: CGPoint(x: 0, y: 55), withAttributes: attributes)
        context.restoreGState()
        UIGraphicsPopContext()
    }
}
