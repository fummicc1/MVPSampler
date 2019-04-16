import Foundation

class QiitaAPI {
    
    static let url = URL(string: "https://qiita.com/api/v2/items")
    
    static func load(url: URL, completion: @escaping (Qiita) -> (), failure: @escaping () -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return failure()
            }
            guard let qiitaList = try? JSONDecoder().decode([Qiita].self, from: data),
                let qiita = qiitaList.randomElement() else {
                return failure()
            }
            completion(qiita)
            }.resume()
    }
}
