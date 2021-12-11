//
//  ViewController.swift
//  Dog Photo Generator
//
//  Created by Darkwolf on 11/12/21.
//


import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let Button: UIButton = {
        let Button = UIButton()
        Button.backgroundColor = .orange
        Button.setTitle("Random Dog Photo", for: .normal)
        Button.setTitleColor(.black, for: .normal)
        return Button
    }()
    let colors: [UIColor] =
        [.systemGray,
         .darkGray,
         .systemGray3,
         .systemGray5,
         .black,
         .brown
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(imageView)
        imageView.frame = CGRect(x:0, y: 0 , width: 300, height: 300)
        imageView.center = view.center
        getRandomPhoto()
        Button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        view.addSubview(Button)
        Button.frame = CGRect(x: 30, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-60, height: 55)    }
        
        func getRandomPhoto() {
            let urlString = "https://placedog.net/640/480?random"
            let url = URL(string: urlString)!
            guard let data = try? Data(contentsOf: url) else {
                return
            }
            
            imageView.image = UIImage(data: data)
        }
                                        
    }

