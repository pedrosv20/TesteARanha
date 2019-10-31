import UIKit
import RealityKit

class Nivel4ViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet var arView: ARView!
    var entity : Entity!
    var anchor: AnchorEntity!
    
    var cellIds = ["aa", "bb", "cc", "dd"]
    let cellSizes = Array( repeatElement(CGSize(width:414, height:171), count: 4))
    
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

extension Nivel4ViewController: UICollectionViewDataSource {
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
        
    }
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
    }
}
extension Nivel4ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
}




