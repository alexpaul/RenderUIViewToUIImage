//
//  ViewController.swift
//  RenderUIViewToUIImage
//
//  Created by Alex Paul on 7/28/21.
//

import UIKit

final class ViewController: UIViewController {

    private let submitButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        button.setTitle("Save Image", for: .normal)
        button.setTitleColor(.orange, for: .normal)
        button.addTarget(self, action: #selector(presentImageVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.center = view.center
        view.addSubview(submitButton)
    }

    @objc func presentImageVC() {
        present(ImageViewController(), animated: true)
    }
}


final class ImageViewController: UIViewController {
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "time-trial")
        iv.frame = view.bounds
        iv.contentMode = .scaleAspectFill
        return iv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        createImage()
    }

    func createImage() {
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { context in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }

        // save image to camera roll
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

