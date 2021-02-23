//
//  ImageCell.swift
//  Netgear
//
//  Created by Avisa Poshtkouhi on 2/19/21.
//

import UIKit


class ImageCell: UICollectionViewCell {
    
    var pageImage: [NetImage]? {
        didSet {
            guard let pageImage = pageImage else { return }
            for image in pageImage {
                self.descriptionTextView.text = image.name
                bearImageView.loadImageUsingUrlString(urlString: image.url)
            }
            
        }
    }
    
    private let bearImageView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "image1")
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.text = "Golden Gate"
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 9.0/16.0).isActive = true
        
        topImageContainerView.addSubview(bearImageView)
        
        bearImageView.topAnchor.constraint(equalTo: topImageContainerView.topAnchor).isActive = true
        bearImageView.leadingAnchor.constraint(equalTo: topImageContainerView.leadingAnchor).isActive = true
        bearImageView.trailingAnchor.constraint(equalTo: topImageContainerView.trailingAnchor).isActive = true
        bearImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: bearImageView.widthAnchor, multiplier: 9.0/16.0).isActive = true
        
        
        addSubview(descriptionTextView)
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(image: NetImage) {
        self.descriptionTextView.text = image.name
        bearImageView.loadImageUsingUrlString(urlString: image.url)
    }
}
