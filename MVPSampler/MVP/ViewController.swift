import UIKit

class ViewController: UIViewController {

    var presenter: PresentationLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inject()
    }

    func inject() {
        presenter = Presenter(viewController: self)
    }
    
    @IBAction func pressedFetchButton() {
    }
    
}

