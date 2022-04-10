//
//  GFAvatarImageView.swift
//  GitHubFollowersClone
//
//  Created by Ibrahim Hamed on 31/03/2022.
//

import UIKit

class GFAvatarImageView: UIImageView {
    private let placeHolderImage = UIImage(named: "avatar-placeholder")
    private var cache = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func downloadImage(from string: String) {
        let cacheKey = NSString(string: string)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
            
        guard let url = URL(string: string) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            guard error == nil else { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            self.cache.setObject(image, forKey: cacheKey)
            DispatchQueue.main.async { self.image = image }
        }
        task.resume()
    }
}
