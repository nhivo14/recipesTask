//
//  HomeViewController.swift
//  TakeHomeAssignment
//
//  Created by NhiVHY on 20/3/24.
//

import UIKit

class HomeViewController: UIViewController {
//    MARK: IBOutlets
    @IBOutlet private weak var recipesTableview: UITableView!
//    MARK: - Properties
    private let viewModel = HomeViewModel()
    
//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchRecipes()
    }
    
//    MARK: - Functions
    func setupUI() {
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        recipesTableview.delegate = self
        recipesTableview.dataSource = self
        recipesTableview.register(UINib.init(nibName: "RecipeTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "RecipeTableViewCell")
        recipesTableview.separatorStyle = .none
        
    }
    
    
    func fetchRecipes() {
        viewModel.fetchRecipes { [weak self] in
            DispatchQueue.main.async {
                self?.recipesTableview.reloadData()
            }
        }
    }

}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        cell.configData(data: viewModel.recipes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewModel = DetailViewModel()
        detailViewModel.setData(data: viewModel.recipes[indexPath.row])
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.setup(viewModel: detailViewModel)
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension HomeViewController {
    
}
