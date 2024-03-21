//
//  DetailViewController.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import UIKit

class DetailViewController: UIViewController {
//    MARK: - IBOutlets
    @IBOutlet private weak var detailImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var headlineLabel: UILabel!
    @IBOutlet private weak var discriptionLabel: UILabel!
    @IBOutlet private weak var proteinsLabel: UILabel!

//    MARK: - Properties
    private var viewModel: DetailViewModelProtocol?
    
//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configData(data: getViewModel().getData())
    }
    
//    MARK: - Functions
    func setupUI() {
        title = "Detail"
        detailImageView.clipsToBounds = true
        detailImageView.layer.shadowColor = UIColor.gray.cgColor
        detailImageView.layer.shadowOpacity = 1
        detailImageView.layer.shadowOffset = CGSize(width: 20, height: 4)
        detailImageView.layer.shadowRadius = 2
        detailImageView.contentMode = .scaleAspectFit

    }
    
    func setup(viewModel: DetailViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func getViewModel() -> DetailViewModelProtocol{
        guard let viewModel = viewModel else { return DetailViewModel() }
        return viewModel
    }
    
    func configData(data: Recipe?) {
        guard let data = data else { return }
        nameLabel.text = data.name
        headlineLabel.text = data.headline
        discriptionLabel.text = data.description
        proteinsLabel.text = "Proteins: " + (data.proteins ?? "0 g")
        let url = URL(string: data.image ?? "")
        detailImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "questionmark.app"))
    }

}

