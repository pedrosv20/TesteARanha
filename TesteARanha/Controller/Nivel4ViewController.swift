import UIKit
import RealityKit
import ARKit

class Nivel4ViewController: UIViewController, UICollectionViewDelegate, ARCoachingOverlayViewDelegate {
    
    @IBOutlet var arView: ARView!
    var entity : Entity!
    var anchor: AnchorEntity!
    
    var cellIds = ["aa", "bb", "cc", "dd", "ee"]
    var cellSizes = Array( repeatElement(CGSize(width:414, height:171), count: 4))
    
    var coachQuantico = ARCoachingOverlayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setOverlay(automatically: true, forDetectionType: .horizontalPlane)
        //TODO: chamar set overlay quando der swipe pra terceira collection
    }
    
    func setOverlay(automatically: Bool, forDetectionType goal: ARCoachingOverlayView.Goal){
        print("entrou")
        //1. Link The coachQuantico To Our Current Session
        self.coachQuantico.session = self.arView.session
        self.coachQuantico.delegate = self
        
        self.arView.addSubview(self.coachQuantico)
        
        //2. Set It To Fill Our View
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item:  coachQuantico, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item:  coachQuantico, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item:  coachQuantico, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item:  coachQuantico, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        coachQuantico.translatesAutoresizingMaskIntoConstraints = false
        
        //3. Enable The Overlay To Activate Automatically Based On User Preference
        coachQuantico.setActive(true, animated: false)
        print("goal")
        //4. Set The Purpose Of The Overlay Based On The User Preference
        self.coachQuantico.goal = goal
        
        coachQuantico.activatesAutomatically = true
        
    }
    

    
    public func coachingOverlayViewWillActivate(_ coachingOverlayView: ARCoachingOverlayView) {
        print("ativou")
    }
    
    //2. Called When The ARCoachingOverlayView Is No Active And No Longer Displayer
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        anchor = AnchorEntity(plane: .horizontal)
        arView.scene.addAnchor(anchor)
        let url = Bundle.main.url(forResource: "spiderAnimated.usdz", withExtension: nil)
        entity = try? Entity.loadModel(contentsOf: url!)
        anchor.addChild(entity!)
        entity.stopAllAnimations()
        coachQuantico.activatesAutomatically = false
    }
    
    //3. Called When Tracking Conditions Are Poor Or The Seesion Needs Restarting
    
    public func coachingOverlayViewDidRequestSessionReset(_ coachingOverlayView: ARCoachingOverlayView) {
        
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
        return cellSizes.count
        
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


extension UIColor {
    open class var transparentLightBlue: UIColor {
        return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.50)
    }
}



