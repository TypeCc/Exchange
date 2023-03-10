//
//  ExService.swift
//  MVVM exchange
//
//  Created by serif mete on 6.02.2023.
//

import Foundation
protocol IDownloadService {
    func downloadService(completion: @escaping (Post?) -> ())
}
//MARK: - Data Yükleme Servisi
final class DownloadService: IDownloadService {
    //MARK: - Completion'lı fonksiyon
    func downloadService(completion: @escaping (Post?) -> ()) {
        //MARK: - Url Kontrolü optinal dan çıkarmak için
        guard let url = URL(string:APIUrl.myURL()) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            //MARK: - Switch Case İle Kontrol Sağlamak için
            switch result {
            case .success(let data): // success data
                completion(self.handleWithData(data))
            case .failure(let error): // error part
                self.handleWithError(error)
            }
        }
    }
    //MARK: - Error u Ele Aldığımız Kısım
    private func handleWithError(_ error: Error) {
        print(error.localizedDescription)
    }
    //MARK: - Data'yı ele aldığımız işlediğimiz kısım ( decode )
    private func handleWithData(_ data: Data) -> Post? {
        do {
            let JsonDec = try JSONDecoder().decode(Post.self, from: data)
            return JsonDec
        } catch {
            print(error)
            return nil
        }
    }
}
