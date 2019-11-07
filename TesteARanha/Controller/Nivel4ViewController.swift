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
    
    override func viewDidDisappear(_ animated: Bool) {
        arView?.session.pause()
        arView?.removeFromSuperview()
        arView = nil
        
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
    
    func createSpider() {
        setOverlay(automatically: true, forDetectionType: .horizontalPlane)
        
        self.anchor = AnchorEntity(plane: .horizontal)
        self.arView.scene.addAnchor(self.anchor)
        let url = Bundle.main.url(forResource: "oi.usdz", withExtension: nil)
        self.entity = try? Entity.loadModel(contentsOf: url!)
        self.entity.stopAllAnimations()
        entity.scale = SIMD3<Float>(repeating: Float(0.5 / 10 ))
        
    }
    
    func moveSpider() {
        if running {
            let quaternion = simd_quatf(angle: degreesToRadians(180),
            axis: simd_float3(x: 0,
                              y: 1,
                              z: 0))
            var vector = simd_float3(x: 0, y: 0, z: 0.002)
            vector = quaternion.act(vector)
            print("girou o bixo")
            entity.position += vector
            print("ta andando")
        }
    }
    
    func degreesToRadians(_ degrees: Float) -> Float {
        return degrees * .pi / 180
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

            
        } else {
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
            }
            running = true
        }
    }
    
    @IBAction func size(_ sender: UIStepper) {
        sender.minimumValue = 0.2
        sender.maximumValue = 10
        sender.stepValue = 0.5
        entity.scale = SIMD3<Float>(repeating: Float(sender.value / 10 ))
    }
    
    @IBAction func changeTexture(_ sender: UISegmentedControl) {
        let url: URL!
        if sender.selectedSegmentIndex == 0 {
            url = Bundle.main.url(forResource: "oi.usdz", withExtension: nil)
        } else {
             url = Bundle.main.url(forResource: "spiderAnimated.usdz", withExtension: nil)
        }
        
        self.entity.removeFromParent()
        self.entity = try? Entity.loadModel(contentsOf: url!)
        self.anchor.addChild(entity)
        if running {
            let quaternion = simd_quatf(angle: degreesToRadians(180),
                                        axis: simd_float3(x: 0,
                                                          y: 1,
                                                          z: 0))
            
            var vector = simd_float3(x: 0, y: 0, z: 0.1)
            vector = quaternion.act(vector)
            entity.setOrientation(quaternion, relativeTo: entity)
            moveSpider()
            entity.playAnimation(entity.availableAnimations[1].repeat(count: .max))
        }
        entity.scale = SIMD3<Float>(repeating: Float(0.5 / 10 ))
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
    
    fileprivate func togglePeopleOcclusion() {
        guard let config = arView.session.configuration as? ARWorldTrackingConfiguration, ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
            print("deu ruim return")
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
        
        if indexPath.item == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ARcardCell", for: indexPath) as! StageFourCardCell
                    
            cell.fidelitySegmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
            
            return cell
        } else {
            return collectionView.dequeueReusableCell( withReuseIdentifier: cellIds[indexPath.item], for: indexPath)
            
        }
        
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



