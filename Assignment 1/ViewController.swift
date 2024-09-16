//
//  ViewController.swift
//  Assignment 1
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var displayImageName: String?

    lazy var imageModel: ImageModel = {
        return ImageModel.sharedInstance()
    }()

    private var imageView: UIImageView?

    @IBOutlet weak var scrollView: UIScrollView!

    var currentImageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the correct index based on displayImageName
        if let displayImageName = displayImageName {
            if let index = (0..<imageModel.numberOfImages()).first(where: { imageModel.getImageName(for: $0) == displayImageName }) {
                currentImageIndex = index
                updateImageView()
            }
        }
    }

    // Function to update the image view with the current image index
    func updateImageView() {
        guard let displayImageName = displayImageName else {
            print("Error: displayImageName is nil.")
            return
        }

        // Fetch the image directly without optional binding
        let image = imageModel.getImageWithName(displayImageName)

        // Remove the old imageView if it exists
        self.imageView?.removeFromSuperview()

        // Initialize a new imageView with the image
        self.imageView = UIImageView(image: image)

        // Ensure imageView is properly initialized
        if let imageView = self.imageView {
            self.scrollView.addSubview(imageView)
            self.scrollView.contentSize = image.size
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
