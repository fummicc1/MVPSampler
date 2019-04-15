import Foundation

protocol PresentationLogic {
    func startLoadingQiita()
    func successFetchingQiita()
    func failedFetchingQiita()
}

class Presenter: PresentationLogic {
    
    weak var viewController: ViewController?
    var model: Model?
    
    
    
    init(viewController: ViewController, model: Model = Model()) {
        self.viewController = viewController
        self.model = model
    }
    
    func startLoadingQiita() {
        
    }
    
    func successFetchingQiita() {
        
    }
    func failedFetchingQiita() {
        
    }
}
