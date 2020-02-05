
import UIKit

class ViewController: UIViewController
{
    // This is an initialiser function. We load the main view in order to use it.
    override func viewDidLoad()
    {
        super.viewDidLoad()
        image.delegate = self
        image.allowsEditing = true
        
    }
    
    let image = UIImagePickerController()
    var imageTmp =  UIButton()
    
    // Declaration of the buttons where we'll upload the photos
    @IBOutlet weak var Button1st: UIButton!
    @IBOutlet weak var Button2nd: UIButton!
    @IBOutlet weak var Button3rd: UIButton!
    @IBOutlet weak var Button4th: UIButton!
    
    // Function for the swipe
    
    @IBOutlet var MySwipe: UISwipeGestureRecognizer!
    
    @IBAction func SwipeUp(_ sender: UISwipeGestureRecognizer?)
    {
        if let gesture = sender {
            // There's two cases : If the device is in portrait or in landscape. In the first case, it's swipe up, in the second it's swipe left
            if UIDevice.current.orientation.isPortrait && gesture.direction == .up
            {
                convertViewToImage()
                moveViewVertically()
            }
            else if UIDevice.current.orientation.isLandscape && gesture.direction == .left
            {
                convertViewToImage()
                moveViewHorizontally()
            }
        }
    }
    
    @IBOutlet weak var MyView: UIView!
    
    // Declaration of the three buttons at the bottom
    @IBOutlet weak var LowerLeftButton: UIButton!
    
    @IBOutlet weak var LowerMiddleButton: UIButton!
    
    @IBOutlet weak var LowerRightButton: UIButton!
    
    // Insert of the selected background
    @IBAction func LLBSelected(_ sender: Any)
    {
        LowerLeftButton.setBackgroundImage(UIImage(named: "select1"), for: .normal)
        LowerMiddleButton.setBackgroundImage(UIImage(named: "Layout 2"), for: .normal)
        LowerRightButton.setBackgroundImage(UIImage(named: "Layout 3"), for: .normal)
        
        Button2nd.isHidden = true
        Button4th.isHidden = false
    }
    
    
    
    @IBAction func LMBSelected(_ sender: Any)
    {
        LowerMiddleButton.setBackgroundImage(UIImage(named: "select2"), for: .normal)
        LowerLeftButton.setBackgroundImage(UIImage(named: "Layout 1"), for: .normal)
        LowerRightButton.setBackgroundImage(UIImage(named: "Layout 3"), for: .normal)
        
        Button4th.isHidden = true
        Button2nd.isHidden = false
    }
    
    @IBAction func LRBSelected(_ sender: Any) {
        LowerRightButton.setBackgroundImage(UIImage(named: "select3"), for: .normal)
        LowerMiddleButton.setBackgroundImage(UIImage(named: "Layout 2"), for: .normal)
        LowerLeftButton.setBackgroundImage(UIImage(named: "Layout 1"), for: .normal)
        
        Button4th.isHidden = false
        Button2nd.isHidden = false
    }
    
    // Function for uploading images
    @IBAction func UploadImageTopleft(_ sender: Any) {
        
        imageTmp = Button1st
        self.presentWithSource(source: .photoLibrary)
        Button1st.setImage(UIImage(named: "imageTmp"), for: .normal)
    }
    
    @IBAction func UploadImageTopRight(_ sender: Any) {
        imageTmp = Button2nd
        self.presentWithSource(source: .photoLibrary)
        Button2nd.setImage(UIImage(named: "imageTmp"), for: .normal)
    }
    
    @IBAction func UploadImageBottomLeft(_ sender: Any) {
        imageTmp = Button4th
        self.presentWithSource(source: .photoLibrary)
        Button4th.setImage(UIImage(named: "imageTmp"), for: .normal)
    }
    
    @IBAction func UploadImageBottomRight(_ sender: Any) {
        imageTmp = Button3rd
        self.presentWithSource(source: .photoLibrary)
        Button3rd.setImage(UIImage(named: "imageTmp"), for: .normal)
    }
    
    // Function for uploading images
    func presentWithSource(source: UIImagePickerController.SourceType) {
        image.sourceType = source
        present(image, animated: true, completion: nil)
    }
    private func convertViewToImage() {
        // convert Grid view to an image
        UIGraphicsBeginImageContextWithOptions(MyView.frame.size, view.isOpaque, 0)
        MyView.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else
        {
            return
            
        }
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityViewController.completionWithItemsHandler = {(UIActivityType: UIActivity.ActivityType?, completed: Bool, returnedItems: [Any]?, error: Error?) in
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: { self.MyView.transform = .identity
            }
                ,completion: nil)
        }
        present(activityViewController, animated: true, completion: nil)
    }
    private func moveViewVertically() {
        // verticall animation
        
        UIView.animate(withDuration: 0.5) {
            self.MyView.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
        }
        
    }
    private func moveViewHorizontally() {
        // Horizontal animation
        
        UIView.animate(withDuration: 0.5) {
            self.MyView.transform = CGAffineTransform(translationX: -self.view.frame.height, y: 0)
        }
    }
    
}


extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // extention for presentWithSource function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let edite = info[.editedImage] as? UIImage {
            imageTmp.setBackgroundImage(edite, for: .normal)
        }
        dismiss(animated: true, completion: nil)
    }
}

