import Foundation

protocol Output {
    var qiitaList: [Qiita]? { get }
}

protocol PresentationLogic {
    func startLoadingQiita()
    func successFetchingQiita()
    func failedFetchingQiita()
}

class Presenter: PresentationLogic, Output {
    
    weak var viewController: ViewLogic?
    var model: Model?
    
    var qiitaList: [Qiita]?
    
    init(viewController: ViewController, model: Model = Model()) {
        self.viewController = viewController
        self.model = model
    }
    
    func startLoadingQiita() {
        guard let url = QiitaAPI.url else { return }
        model?.load(url: url, completion: { [weak self] (qiitaList) in
            self?.qiitaList = qiitaList
            self?.presentRandomQiita()
        }, failure: { [weak self] in
            self?.viewController?.showError()
        })
    }
    
    func presentRandomQiita() {
        guard let qiita = qiitaList?.randomElement() else { return }
        viewController?.displayQiita(qiita: qiita)
    }
    
    func successFetchingQiita() {
        
    }
    func failedFetchingQiita() {
        
    }
}
