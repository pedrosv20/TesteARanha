import UIKit
import RealityKit
import ARKit
import WatchConnectivity

class Nivel4ViewController: UIViewController, UICollectionViewDelegate, ARCoachingOverlayViewDelegate {
    
    
    //    @IBOutlet weak var fidelitySegmented: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var arView: ARView!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var backButton: UIButton!
    
    var cell : StageFourCardCell!
    var animationCell : PlayAnimationCardCell!
    var entity : Entity!
    var anchor: AnchorEntity!
    
    var cellIds = ["ARcardCell", "animationCell"]
    
    var changed = false
    
    var coachOverlay = ARCoachingOverlayView()
    var running = false
    
    var selectedPhobiaIndex: Int!
    
    var oldValue = 0.0
    var animation = false
    
    var selectedPhobia: Fobia {
        Model.shared.fobias[selectedPhobiaIndex]
    }
    
    var session: WCSession?
    
    override func viewDidLoad() {
        if (WCSession.isSupported()) {
            if session != nil {
                if session!.isPaired {
                    session = WCSession.default
                    session!.delegate = self
                    session!.activate()
                }
            }
        }
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (notification) in
            self.dismiss(animated: false, completion: nil)

            // run your code here (or whatever)
        }
        
        pageControl.pageIndicatorTintColor = UIColor(red:0.78, green:0.77, blue:0.77, alpha:1.0)
        pageControl.currentPageIndicatorTintColor = UIColor(red:0.82, green:0.45, blue:0.52, alpha:1.0)
        //TODO: bloquear tela e voltar pra etapa
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        createSpider()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        togglePeopleOcclusion()
    }
    
    override func viewDidDisappear(_ animated: Bool) {

        arView?.session.pause()
        arView?.removeFromSuperview()
        arView = nil
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setOverlay(automatically: Bool, forDetectionType goal: ARCoachingOverlayView.Goal){
        
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
    
    @IBAction func didPressBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
       }

    
    @IBAction func showEntity(_ sender: Any) {
        
        if entity.isActive {
            cell.eyeImage.setImage(UIImage(named: "olhoBranco")!, for: .normal)
            cell.showLabel.text = "Mostrar"
            entity.isEnabled = false
            running = false
            entity.stopAllAnimations()

        } else {
            cell.eyeImage.setImage(UIImage(named: "olhoCortadoBranco")!, for: .normal)
            cell.showLabel.text = "Esconder"
            entity.isEnabled = true
        }
    }
    
    @IBAction func animate(_ sender: Any) {
        if running {
            entity.stopAllAnimations()
            running = false
        
            animationCell.playButton.setImage(UIImage(named: "playAnimation")!, for: .normal)
            animationCell.moveLabel.text = "Mover"
        } else {
            animationCell.playButton.setImage(UIImage(named: "pauseAnimation")!, for: .normal)
            animationCell.moveLabel.text = "Parar"

             entity.playAnimation(entity.availableAnimations[1].repeat(count: .max))
            let quaternion = simd_quatf(angle: degreesToRadians(180),
                                        axis: simd_float3(x: 0,
                                                          y: 1,
                                                          z: 0))
            
            var vector = simd_float3(x: 0, y: 0, z: 0.1)
            vector = quaternion.act(vector)
            

            if !animation {
                animation = true
                entity.setOrientation(quaternion, relativeTo: entity)
                print("gira o bixo")
            }
            
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (_) in
                self.moveSpider()
            }

            running = true
        }
    }
    
    @IBAction func size(_ sender: UIStepper) {
        
        sender.minimumValue = 0.2
        sender.maximumValue = 40
        sender.stepValue = 0.2
        
        entity.scale = SIMD3<Float>(repeating: Float(sender.value))
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
        animation = false
        
        if running {
            
            let quaternion = simd_quatf(angle: degreesToRadians(180),axis: simd_float3(x: 0, y: 1, z: 0))
            var vector = simd_float3(x: 0, y: 0, z: 0.1)
            vector = quaternion.act(vector)
            entity.setOrientation(quaternion, relativeTo: entity)
            moveSpider()
            entity.playAnimation(entity.availableAnimations[1].repeat(count: .max))
        } else {
            entity.scale = SIMD3<Float>(repeating: Float(0.5))
        }
        cell.sizeStepper.value = 0.5
        
        cell.eyeImage.setImage(UIImage(named: "olhoCortadoBranco")!, for: .normal)
        cell.showLabel.text = "Esconder"
        entity.isEnabled = true
    }
    
    public func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        
        if anchor.isAnchored == false {

            createSpider()
        } else {
            self.collectionView.isHidden = false
            anchor.addChild(entity!)
            entity.scale = SIMD3<Float>(repeating: Float(0.5))
            
        }
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
        
        if indexPath.item == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ARcardCell", for: indexPath) as! StageFourCardCell
                    
            cell.fidelitySegmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
            cell.sizeStepper.setDecrementImage(cell.sizeStepper.decrementImage(for: .normal), for: .normal)
            cell.sizeStepper.setIncrementImage(cell.sizeStepper.incrementImage(for: .normal), for: .normal)
            
            self.cell = cell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "animationCell", for: indexPath) as! PlayAnimationCardCell

        self.animationCell = cell
        return cell
            
        
        
       
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
