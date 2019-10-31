import UIKit
import RealityKit

class Nivel4ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var entity : Entity!
    var anchor: AnchorEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()


        anchor = AnchorEntity(plane: .horizontal)

        arView.scene.addAnchor(anchor)

        
        
        let url = Bundle.main.url(forResource: "spiderAnimated.usdz", withExtension: nil)
        entity = try? Entity.loadModel(contentsOf: url!)
        anchor.addChild(entity!)
        entity.stopAllAnimations()

        
    }

    
    @IBAction func addSpider(_ sender: Any) {
        entity.stopAllAnimations()
        
        entity.playAnimation(entity.availableAnimations[1].repeat(count:.max))

    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        entity.stopAllAnimations()
        
    }
}
//    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
//        guard let touchInView = sender?.location(in: arView) else {
//            return
//        }
//
//        guard let hitEntity = arView.entity(at: touchInView) else {
//            // no entity was hit
//            return
//        }
//        print(hitEntity.name)
//
//    }
//}
//
//// randomScale is an example that gives feedback
//extension Entity {
//    func randomScale() {
//        var newTransform = self.transform
//        newTransform.scale = .init(
//            repeating: Float.random(in: 0.05...0.1)
//        )
//        self.transform = newTransform
//    }
//}




