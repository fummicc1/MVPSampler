import UIKit

protocol ViewLogic: class {
    func displayQiita(qiita: Qiita)
    func showError()
}

class ViewController: UIViewController, ViewLogic {

    @IBOutlet private weak var qiitaLabel: UILabel!
    
    var presenter: (PresentationLogic & Output)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inject()
    }

    func inject() {
        presenter = Presenter(viewController: self)
    }
    
    func displayQiita(qiita: Qiita) {
        DispatchQueue.main.async { [weak self] in
            self?.qiitaLabel.text = qiita.title
        }
    }
    
    func showError() {
        let alert = UIAlertController(title: "エラー", message: "Qiita記事を取得できませんでした。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func pressedFetchButton() {
        if let qiitaList = presenter?.qiitaList, let qiita = qiitaList.randomElement() {
            displayQiita(qiita: qiitaList)
        } else {
            presenter?.startLoadingQiita()
        }
    }
}

