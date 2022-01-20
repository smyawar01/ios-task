import UIKit
import RxSwift


/**
 The cell which displays a campaign.
 */
class CampaignCell: UICollectionViewCell {

    private let disposeBag = DisposeBag()

    @IBOutlet weak var containerView: UIStackView!
    @IBOutlet weak var maxWidthConstraint: NSLayoutConstraint!
    /** Used to display the campaign's title. */
    @IBOutlet private(set) weak var nameLabel: UILabel!

    /** Used to display the campaign's description. */
    @IBOutlet private(set) weak var descriptionLabel: UILabel!

    /** The image view which is used to display the campaign's mood image. */
    @IBOutlet private(set) weak var imageView: UIImageView!

    /** The mood image which is displayed as the background. */
    var moodImage: Observable<UIImage>? {
        didSet {
            moodImage?
                .observeOn(MainScheduler.instance)
                .subscribe(onNext: { [weak self] image in
                    self?.imageView.image = image
                    })
                .disposed(by: disposeBag)
        }
    }

    /** The campaign's name. */
    var name: String? {
        didSet {
            nameLabel?.text = name
        }
    }

    var descriptionText: String? {
        didSet {
            descriptionLabel?.text = descriptionText
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        assert(nameLabel != nil)
        assert(descriptionLabel != nil)
        assert(imageView != nil)
        
        //** Prevent Xcode from generating auto layout constraint for width and height for self sizing cell. */
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        //** Set main container width constraint to max screen width. */
        let screenWidth = UIScreen.main.bounds.size.width
        maxWidthConstraint.constant = screenWidth
        
        //Add custom spacing between title and description. */
        containerView.setCustomSpacing(8, after: nameLabel)
        
    }
}
