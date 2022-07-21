//
//  ViewController.swift
//  musicapp
//
//  Created by Олександр Олійник on 19.07.2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    
    var slides: [OnboardingSlideModel] = []
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    //MARK: - ViewControler LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSlides()
    }
    
    //MARK: - Private Funcs
    private func createSlides() {
        self.slides.append(OnboardingSlideModel(image: UIImage(named: "slideOneImage"), title: "Discover Latest Music and Events", description: "Listen to the latest music releases and buy music event only using Disc. app"))
        self.slides.append(OnboardingSlideModel(image: UIImage(named: "slideTwoImage"), title: "Check Any Detail of Musical Events", description: "Listen to the latest music releases and buy music event only using Disc. app"))
        self.slides.append(OnboardingSlideModel(image: UIImage(named: "slideThreeImage"), title: "Build in Lyrics in Music Player", description: "Listen to the latest music releases and buy music event only using Disc. app"))
    }
    //MARK: Navigation to next page
    @IBAction func startButtonPressed(_ sender: UIButton){
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? UIViewController else { return }
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .crossDissolve
        present(controller, animated: true)
    }
}
extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as? OnboardingCollectionViewCell {
            cell.configureOnboardingSlide(data: slides[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    //MARK: Page Control
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        pageControl.currentPage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage.self = pageControl.currentPage
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}



