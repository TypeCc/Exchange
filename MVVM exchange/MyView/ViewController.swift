//
//  ViewController.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//

import UIKit

protocol HomeScreenInterface: AnyObject{
    func reloadData(values: [Btc])
    func setUpİndicator()
    func desing()
    func setUpTableView()
    func changeLoading(isLoad: Bool)
    func configure()
}

final class ViewController: UIViewController {

    private let service = DownloadService()
    private var safeArea: UILayoutGuide!
    private var myTableView:UITableView = UITableView()
    private lazy var Array: [Btc] = []
    private let nameArray = ["USD : DOLAR","EUR : EURO","BTC : BİTCOİN","ETH : ETHERUM","C : C HİSSE","XU100 : BİTS100","GA : ALTIN","GAG : GÜMÜŞ","GBP : POUND"]
    private let photo: [String] = ["usd","eur","btc","eth","c","xu","al","gm","po"]
    private var indicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    private let viewModel: IExViewModel = ExViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.frame = view.bounds
        viewModel.setDelegate(output: self)
        configure()
        viewModel.fetchItems()
    }


}


extension ViewController: HomeScreenInterface{
    
    func configure() {
        desing()
        setUpİndicator()
        setUpTableView()
    }
    
    func setUpİndicator() {
        self.indicator.center = CGPoint(x: 0, y: 180)
        self.indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.indicator.hidesWhenStopped = true
        view.addSubview(indicator)
        
        
    }
    
    
    func reloadData(values: [Btc]) {
        Array = values
        myTableView.reloadOnMainThread()
    }
    
    
    func desing() {
        myTableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.Identifier.custom.rawValue)
        myTableView.rowHeight = 150
        myTableView.tableFooterView = UIView()
        myTableView.delegate = self
        myTableView.dataSource = self
        DispatchQueue.main.async {
            self.view.backgroundColor = .white
            self.indicator.color = .red
        }
        indicator.startAnimating()
    }
    
    func setUpTableView() {
        self.view.addSubview(myTableView)
        safeArea = view.layoutMarginsGuide
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        myTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        myTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    func changeLoading(isLoad: Bool) {
        DispatchQueue.main.async {
            isLoad ? self.indicator.startAnimating() : self.indicator.stopAnimating()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.Identifier.custom.rawValue) as? MyTableViewCell else {return UITableViewCell()}
        tableView.allowsSelection = false
        cell.desciription.text = self.nameArray[indexPath.row]
        cell.setupCell(image: photo[indexPath.row])
        cell.savemodel(model: Array[indexPath.row])
        return cell
    }
    
    
}
