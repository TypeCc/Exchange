//
//  ExViewModel.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//

import Foundation

protocol IExViewModel: AnyObject {
    func fetchItems()
    func changeLoading()
    
    var downloadService:IDownloadService { get }
    var unitTranslation: [Btc] { get set }
    var exViewOutput: HomeScreenInterface? { get set }
    
    func setDelegate(output: HomeScreenInterface)
}


final class ExViewModel: IExViewModel {
    var downloadService: IDownloadService
    
    init() {
        downloadService = DownloadService()
    }
    
   
    var unitTranslation: [Btc] = []
    
    var exViewOutput: HomeScreenInterface?
    func setDelegate(output: HomeScreenInterface) {
        exViewOutput = output
    }
    
    
    
    private var isLoading = false
    
    func fetchItems() {
        changeLoading()
        downloadService.downloadService { [weak self] result in
            self?.changeLoading()
            guard let self = self else { return }
            guard let result = result else { return }
            self.unitTranslation.append((result.usd)!)
            self.unitTranslation.append((result.eur)!)
            self.unitTranslation.append((result.btc)!)
            self.unitTranslation.append((result.eth)!)
            self.unitTranslation.append((result.c)!)
            self.unitTranslation.append((result.xu100)!)
            self.unitTranslation.append((result.ga)!)
            self.unitTranslation.append((result.gag)!)
            self.unitTranslation.append((result.gbp)!)
            self.exViewOutput?.reloadData(values: self.unitTranslation)
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        exViewOutput?.changeLoading(isLoad: isLoading)
    }
    
   
}

