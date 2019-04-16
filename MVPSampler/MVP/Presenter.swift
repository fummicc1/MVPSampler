import Foundation

protocol PresentationLogic {
    func startLoadingQiita()
    func successFetchingQiita()
    func failedFetchingQiita()
}

class Presenter: PresentationLogic {
    
    weak var viewController: ViewLogic?
    var model: Model?
    
    init(viewController: ViewController, model: Model = Model()) {
        self.viewController = viewController
        self.model = model
    }
    
    func startLoadingQiita() {
        guard let url = QiitaAPI.url else { return }
        model?.load(url: url, completion: { [weak self] (qiita) in
            self?.viewController?.displayQiita(qiita: qiita)
        }, failure: { [weak self] in
            self?.viewController?.showError()
        })
    }
    
    func successFetchingQiita() {
        
    }
    func failedFetchingQiita() {
        
    }
}
