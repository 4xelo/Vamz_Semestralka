//
//  HomeTableViewController.swift
//  Vamz_Semestralka
//
//  Created by Alexander Krajči on 30/04/2022.
//

import UIKit

/// Trieda ma na starosti UI elementy obrazovky HomeViewController.storyboard
class HomeViewController: UIViewController{
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Dummy Variables
    let sections = ["LATEST"]
    var items = [Latest]()
    
    //MARK: - Lifecycle
    /// Metoda je volana po tom, ako sa nacita view z viewControllera, v metode sa nastavi tableView, tableViewCell  a headerView.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        HistoryManager.shared.loadItems() {
            refreshTableView()
        }
        
        let recipeCell = UINib.init(nibName: "RecipeCell", bundle: nil)
        self.tableView.register(recipeCell, forCellReuseIdentifier: "RecipeCell")
        
        let headerView = UINib.init(nibName: "HeaderView", bundle: nil)
        self.tableView.register(headerView, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.reloadData()
       
    }
    
    /// Metoda priradi zoznamu items prvky z UserDefaults: historyListItems a obnovi tableView
    private func refreshTableView() {
        self.items = HistoryManager.shared.historyItemsList
        self.tableView.reloadData()
    }
}

//MARK: - TavleView Data source
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    // MARK: - Table view data source
    /// Metoda vrati pocet sekcii
    /// - Parameter tableView: Objekt tableView, ktory ziada tuto informaciu.
    /// - Returns: Pocet sekcii.
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    /// Metoda vrati vysku ktoru by mal mat riadok v desatinnych cislach
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    /// - Returns: Nezapornu hodnotu s pohyblivou desatinnou ciarkou, ktora urcuje vysku ktoru by mal mat riadok.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    /// Metoda vracia pocet riadkov 
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - section: Index sekcie.
    /// - Returns: pocet riadkov
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    /// Metoda si od zdroja pyta cellu, s zamerom aby ju mohla umiestnit na urcite miesto v tableView. V metode sa vytvori CategoryCell, ktora je nasledne naplnena hodnotami a vratena.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    /// - Returns: Objekt, ktory dedi z UITableViewCell.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeCell
        cell.foodImage.loadImage(URLAddress: items[indexPath.row].imageUrl)
        cell.servingsLabel.text = "\(items[indexPath.row].servingsCount) ks"
        cell.timeLabel.text = "\(items[indexPath.row].time) min"
        cell.difficultyLabel.text = items[indexPath.row].difficulty
        cell.foodNameLabel.text = items[indexPath.row].category
        return cell
    }
    
    
    /// Metoda vykona funkcie po tom ako sa view zobrazil.
    /// - Parameter animated: ak je true, tak je view pridany s animaciou.
    override func viewDidAppear(_ animated: Bool) {
        
        items = HistoryManager.shared.historyItemsList
        tableView.reloadData()
    }
    
    /// Metoda po zakliknuti na konkretnu recept zobrazi storyboard FoodDetailViewControlleru.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - indexPath: Index sekcie.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "FoodDetailViewController", bundle: nil)
        if let foodDetailViewController = storyboard.instantiateInitialViewController() as? FoodDetailViewController {
            foodDetailViewController.loadFoodDetail(items[indexPath.row].id)
            navigationController?.pushViewController(foodDetailViewController, animated: true)
        }
    }
    
    /// Poziada delegata o view, ktory sa ma zobrazit v hlavicke zadanej casti zobrazenia tabulky.
    /// - Parameters:
    ///   - tableView: Objekt tableView, ktory ziada tuto informaciu.
    ///   - section: Cislo sekcie obsahujuce zobrazenie hlavicky.
    /// - Returns: Objekt ktory dedi z UIViewu.
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        headerView.headerLabel.text = sections[section]
        return headerView
    }
}

extension UIImageView {
    
    ///  Metoda nacita obrazok zo zadanej URLAdresy.
    /// - Parameter URLAddress: string url adresy obrazka.
    func loadImage(URLAddress: String) {
        guard let url = URL(string: URLAddress) else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                    self?.image = loadedImage
                }
            }
        }
    }
}
