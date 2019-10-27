import UIKit
import RealityKit

class Nivel4ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var anchor: Aranha.Cena!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        anchor = try! Aranha.loadCena()
        anchor.generateCollisionShapes(recursive: true)
        
        // Load the "Box" scene from the "Experience" Reality File
        arView.scene.anchors.append(anchor)
        
        // Add the box anchor to the scene
    
    }
    
    @IBAction func addSpider(_ sender: Any) {
        anchor.findEntity(named: "spider")?.isEnabled = false
        
    }
    
}


