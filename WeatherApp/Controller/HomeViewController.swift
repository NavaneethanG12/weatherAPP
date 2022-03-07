//
//  ViewController.swift
//  WeatherApp
//
//  Created by navaneeth-pt4855 on 06/03/22.
//

import UIKit

class HomeViewController: UIViewController, UISearchBarDelegate, WeatherFetcherDelegate {
    
    let searchBar = UISearchBar()
    
    var apiString = "https://api.openweathermap.org/data/2.5/weather?appid=c2b18744ee2127c198dafb93fc962029&units=metric&q="
    
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 1
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        return view
    }()
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Chennai"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let weatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "23 C"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Cloudy"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        
        configureUi()
        layoutViews()
        searchBar.delegate = self
        
    }

    func configureUi(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Weather"
        searchBar.sizeToFit()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
//        tabBarController?.tabBar.barTintColor = UIColor.white
//        tabBarController?.tabBar.tintColor = UIColor.white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
    }
    
    func layoutViews(){
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(cityLabel)
        stackView.addArrangedSubview(weatherLabel)
        stackView.addArrangedSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
    }
    
    @objc func handleSearch(){
        
        navigationItem.titleView = searchBar
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        navigationItem.rightBarButtonItem = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let cityName = searchBar.text{
            var urlString = apiString
            urlString.append(cityName.lowercased())
            print(apiString)
            fetchWeather(with: urlString)
        }
        
    }

    func didUpdateWeather(data: WeatherData) {
        DispatchQueue.main.async { [weak self] in
            self?.cityLabel.text = data.name
            self?.weatherLabel.text = "\(data.main.temp) C"
            self?.statusLabel.text = data.weather[0].description
        }
        
        
    }
    
    func fetchWeather(with urlString: String){
        print(urlString)
        let fetcher = WeatherFetcher(urlString: urlString)
        fetcher.delegate = self
        fetcher.parseData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleSearch))
    }
}

