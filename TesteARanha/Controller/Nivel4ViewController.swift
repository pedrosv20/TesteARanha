import UIKit
import RealityKit
import ARKit

class Nivel4ViewController: UIViewController, UICollectionViewDelegate, ARCoachingOverlayViewDelegate {
    
    
    //    @IBOutlet weak var fidelitySegmented: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var arView: ARView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var entity : Entity!
    var anchor: AnchorEntity!
    
    var cellIds = ["text1Cell", "text2Cell", "settingsCell", "animationCell"]
    
    
    var coachOverlay = ARCoachingOverlayView()
    var running = false
    
    var selectedPhobiaIndex: Int!
    
    var oldValue = 0.0
    var animation = false
    
    var selectedPhobia: Fobia {
        Model.shared.fobias[selectedPhobiaIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.pageIndicatorTintColor = UIColor(red:0.78, green:0.77, blue:0.77, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        //TODO: bloquear tela e voltar pra etapa
    }
    
    override func viewWillAppear(_ animated: Bool) {
        createSpider()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        togglePeopleOcclusion()
    }
    
    func createSpider() {
        setOverlay(automatically: true, forDetectionType: .horizontalPlane)
        
        self.anchor = AnchorEntity(plane: .horizontal)
        self.arView.scene.addAnchor(self.anchor)
        let url = Bundle.main.url(forResource: "oi.usdz", withExtension: nil)
        self.entity = try? Entity.loadModel(contentsOf: url!)
        self.entity.stopAllAnimations()
        
    }
    
    func setOverlay(automatically: Bool, forDetectionType goal: ARCoachingOverlayView.Goal){
        print("entrou")
        //1. Link The coachOverlay To Our Current Session
        
        self.coachOverlay.session = self.arView.session
        self.coachOverlay.delegate = self
        self.arView.addSubview(self.coachOverlay)
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item:  coachOverlay, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item:  coachOverlay, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item:  coachOverlay, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item:  coachOverlay, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
        ])
        
        self.coachOverlay.translatesAutoresizingMaskIntoConstraints = false
        self.coachOverlay.setActive(true, animated: false)
        self.coachOverlay.goal = goal
        
        
    }
    
    @IBAction func showEntity(_ sender: Any) {
        if entity.isActive {
            entity.isEnabled = false
        } else {
            entity.isEnabled = true
        }
    }
    
    @IBAction func animate(_ sender: Any) {
        if running {
            entity.stopAllAnimations()
            running = false
            //            entity.setOrientation(simd_quatf(angle: -180, axis: SIMD3<Float>(0, 1, 0)), relativeTo: entity)
            
        } else {
            print(entity.orientation.angle)
            
            
            
            
            
            
            entity.playAnimation(entity.availableAnimations[1].repeat(count: .max))
            let quaternion = simd_quatf(angle: degreesToRadians(180),
                                        axis: simd_float3(x: 0,
                                                          y: 1,
                                                          z: 0))
            
            
            var vector = simd_float3(x: 0, y: 0, z: 0.1)
            vector = quaternion.act(vector)
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                self.moveSpider()
            }
            
            
            
            if !animation {
                animation = true
                entity.setOrientation(quaternion, relativeTo: entity)
                print(entity.orientation(relativeTo: entity))
                
                
            }
            
            
            
            running = true
        }
    }
    
    func moveSpider() {
        let quaternion = simd_quatf(angle: degreesToRadians(180),
        axis: simd_float3(x: 0,
                          y: 1,
                          z: 0))
        var vector = simd_float3(x: 0, y: 0, z: 0.005)
        vector = quaternion.act(vector)
        entity.position += vector
    }
    
    @IBAction func size(_ sender: UIStepper) {
        if sender.value > oldValue {
            print("scale", entity.scale, sender.value)
            entity.scale += SIMD3<Float>(repeating: Float(sender.value / 10 ))
        } else {
            print("scale -", entity.scale, sender.value)
            
            if sender.value <= 0 {
                entity.scale += SIMD3<Float>(repeating: Float(sender.value / 10))
                entity.scale = abs(entity.scale)
            }
            else {
                entity.scale -= SIMD3<Float>(repeating: Float(sender.value / 10))
                entity.scale = abs(entity.scale)
                
            }
        }
        oldValue = sender.value
        
        
    }
    func degreesToRadians(_ degrees: Float) -> Float {
        return degrees * .pi / 180
    }
    
    
    
    
    
    @IBAction func changeTexture(_ sender: Any) {
        //        if fidelitySegmented.selectedSegmentIndex == 1 {
        //            let url = Bundle.main.url(forResource: "spiderAnimated.usdz", withExtension: nil)
        //            entity = try? Entity.loadModel(contentsOf: url!)
        //            //textura foda
        //        } else {
        //            let url = Bundle.main.url(forResource: "agoraVai.usdz", withExtension: nil)
        //            entity = try? Entity.loadModel(contentsOf: url!)}
    }
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        
        if anchor.isAnchored == false {
            //            arView.scene.anchors.remove(anchor)
            print("nao deu bom")
            createSpider()
        } else {
            
            print("deu bom")
            self.collectionView.isHidden = false
            anchor.addChild(entity!)
            entity.scale = SIMD3<Float>(repeating: Float(0.3))
            
        }
        
        
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
        let index = scrollView.contentOffset.x / witdh
        let roundedIndex = round(index)
        print(roundedIndex)
        if roundedIndex == 2 && running == false {
            //                createSpider()
            
        }
        
        self.pageControl?.currentPage = Int(roundedIndex)
    }
    
    fileprivate func togglePeopleOcclusion() {
        guard let config = arView.session.configuration as? ARWorldTrackingConfiguration, ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            return
        }
        config.frameSemantics.insert(.personSegmentationWithDepth)
        
        arView.session.run(config)
    }
}

extension Nivel4ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cellIds.count
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:self.arView.frame.width, height:300)
        
    }
}



extension UIColor {
    open class var transparentLightBlue: UIColor {
        return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 0.50)
    }
}



