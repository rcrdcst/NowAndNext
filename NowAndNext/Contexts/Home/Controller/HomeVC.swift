//
//  ViewController.swift
//  NowAndNext
//
//  Created by ricardo silva on 20/06/2018.
//  Copyright © 2018 ricardo silva. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class HomeVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var disposeBag = DisposeBag()
    private let vm = HomeVM()
    private let cellIdentifier = "NowAndNextTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(cellType: NowAndNextTableViewCell.self)
        
        vm.channels()
        .subscribe(onNext: { [unowned self] result in
                var programData: [ProgramData] = []
                result.forEach { value in
                    var item: ProgramData = ProgramData()
                    item.name = value.value[0].title
                    item.coverImage = value.value[0].getCoverImg()
                    item.currentProgram = value.value[0].title
                    item.nextProgram = value.value[1].title
                
                    programData.append(item)
                }
                
                let items = Observable.just(programData)
                
                items.bind(to: self.tableView.rx.items(cellIdentifier: self.cellIdentifier)) { (row, element, cell) in
                    if let celltoUse = cell as? NowAndNextTableViewCell {
                        celltoUse.programName.text = element.name
                        celltoUse.nextProgram.text = element.nextProgram
                        celltoUse.setImage(url: element.coverImage)
                    }
                    
                }
        }).disposed(by: disposeBag)
        
    }
    
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115
    }
}


