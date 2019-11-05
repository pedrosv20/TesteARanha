import UIKit
import RealityKit
import ARKit

class Nivel4ViewController: UIViewController, UICollectionViewDelegate, ARCoachingOverlayViewDelegate {
    
    
//    @IBOutlet weak var fidelitySegmented: UISegmentedControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet var arView: ARView!
    var entity : Entity!
    var anchor: AnchorEntity!
    
    var cellIds = ["text1cell", "text2cell", "settingsCell", "animationCell"]
    
    
    var coachQuantico = ARCoachingOverlayView()
    var running = false
    
    var selectedPhobiaIndex: Int!
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
        //TODO: chamar set overlay quando der swipe pra terceira collection
    }
    
    override func viewDidAppear(_ animated: Bool) {
        togglePeopleOcclusion()
    }
    
    func createSpider() {
        setOverlay(automatically: true, forDetectionType: .horizontalPlane)
        anchor = AnchorEntity(plane: .horizontal)
        arView.scene.addAnchor(anchor)
        let url = Bundle.main.url(forResource: "spiderAnimated.usdz", withExtension: nil)
        entity = try? Entity.loadModel(contentsOf: url!)
        entity.stopAllAnimations()
    }
    
    func setOverlay(automatically: Bool, forDetectionType goal: ARCoachingOverlayView.Goal){
        print("entrou")
        //1. Link The coachQuantico To Our Current Session
        
        self.coachQuantico.session = self.arView.session
        self.coachQuantico.delegate = self
        self.arView.addSubview(self.coachQuantico)
         NSLayoutConstraint.activate([
                   NSLayoutConstraint(item:  coachQuantico, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 0),
                   NSLayoutConstraint(item:  coachQuantico, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: 0),
                   NSLayoutConstraint(item:  coachQuantico, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 0),
                   NSLayoutConstraint(item:  coachQuantico, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1, constant: 0)
               ])
               
        self.coachQuantico.translatesAutoresizingMaskIntoConstraints = false

        self.coachQuantico.goal = goal
        coachQuantico.setActive(true, animated: false)
        coachQuantico.activatesAutomatically = true
        
  
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
        print(anchor.orientation.angle)
            
            entity.playAnimation(entity.availableAnimations[1].repeat(count: .max))
            running = true
        }
    }
    
    @IBAction func size(_ sender: UIStepper) {
        entity.scale = SIMD3<Float>(repeating: Float(sender.value))
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
            print("nao deu bom")
            createSpider()
        } else {
            print("deu bom")
            anchor.addChild(entity!)
            coachQuantico.activatesAutomatically = false
        }
        //        anchor = AnchorEntity(plane: .horizontal)
        //        if anchor.isAnchored == false {
        //            setOverlay(automatically: true, forDetectionType: .horizontalPlane)
        //        } else {
        //            coachQuantico.activatesAutomatically = false
        //            createSpider()
        //            anchor.addChild(entity!)
        //        }
        
        
        
        
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let witdh = scrollView.frame.width - (scrollView.contentInset.left*2)
           let index = scrollView.contentOffset.x / witdh
           let roundedIndex = round(index)
           self.pageControl?.currentPage = Int(roundedIndex)
       }
    
    fileprivate func togglePeopleOcclusion() {
        guard let config = arView.session.configuration as? ARWorldTrackingConfiguration, ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentation) else {
                fatalError("People occlusion is not supported on this device.")
        }
        config.frameSemantics.insert(.personSegmentation)

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



