import Foundation

struct Qiita: Codable {
    let title: String
}

class Model {
    func load(url: URL, completion: @escaping ([Qiita]) -> (), failure: @escaping () -> ()) {
        QiitaAPI.load(url: url, completion: completion, failure: failure)
    }
}
