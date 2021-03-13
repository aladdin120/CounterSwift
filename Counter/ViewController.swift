
import UIKit

class ViewController: UIViewController {
    
    private var label = UILabel()
    private var tapButton = UIButton()
    private var resetButton  = UIButton()
    
    private var counter = 0 {
        didSet {
            label.text = counter.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Counter"
        view.backgroundColor = .orange
        
        view.addSubview(tapButton)
        view.addSubview(label)
        
        resetButton.setTitle("Reset", for: .normal)
        resetButton.addTarget(self, action: #selector(resetCounter), for: .touchUpInside)
        resetButton.setTitleColor(.purple, for: .normal)
        
        tapButton.backgroundColor = .purple
        tapButton.setTitle("TAP", for: .normal)
        tapButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = counter.description
        label.font = UIFont.systemFont(ofSize: 30, weight:  .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        tapButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
        tapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: resetButton)
        
        //label = UILabel(frame: CGRect(x: view.frame.midX, y: view.frame.midY, width: 40, height: 40))
    }
    
    @objc func tapAction() {
        counter += 1
    }
    
    @objc func resetCounter() {
        counter = 0
    }
}

