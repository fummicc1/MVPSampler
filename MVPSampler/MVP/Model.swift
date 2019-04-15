import Foundation

struct Qiita: Codable {
    let title: String
}

class Model {
    
    static let url = URL(string: "https://qiita.com/api/v2/items")
    
    func load(url: URL, completion: @escaping ([Qiita]) -> (), failure: @escaping () -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return failure()
            }
            guard let qiitaLists = try? JSONDecoder().decode([Qiita].self, from: data) else {
                return failure()
            }
            completion(qiitaLists)
            }.resume()
    }
    
}
