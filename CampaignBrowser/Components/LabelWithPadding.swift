import UIKit


/**
 A custom label that has some padding between its frame and its displayed text. Configurable in Interface Builder.
 */
@IBDesignable
class LabelWithPadding: UILabel {

    /** The padding (in points). Will be added to all edges. */
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var rightPadding: CGFloat = 0
    @IBInspectable var topPadding: CGFloat = 0
    @IBInspectable var bottomPadding: CGFloat = 0

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: UIEdgeInsets(top: topPadding,
                                                       left: leftPadding,
                                                       bottom: bottomPadding,
                                                       right: rightPadding)))
    }

    override var intrinsicContentSize: CGSize {
        let originalSize = super.intrinsicContentSize
        return CGSize(width: originalSize.width + leftPadding + rightPadding,
                      height: originalSize.height + topPadding + bottomPadding)
    }
}
