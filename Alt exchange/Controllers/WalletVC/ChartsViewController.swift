//
//  ChartsViewController.swift
//  Alt exchange
//
//  Created by Vlad Kovryzhenko on 1/23/18.
//  Copyright © 2018 Vlad Kovryzhenko. All rights reserved.
//

import Foundation
import UIKit
import Charts

class ChartsViewController: WalletsViewController,UISearchBarDelegate {
    
    @IBAction func addCoinBtn(_ sender: UIBarButtonItem) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "allCoinsVC") //as! NavVC
        self.present(vc!, animated: false, completion: nil)
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var chartView: BarChartView!
    @IBAction func moreBtnTapped(_ sender: UIBarButtonItem) {
        handleOption(Option.saveToGallery, forChartView: chartView)
    }
    
    let dataLabels = ["100"]
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Wallets"
        createSearchBar()
        self.navigationController?.navigationBar.barTintColor = .white
        chartView.backgroundColor = UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
        chartView.highlightPerDragEnabled = false
        chartView.drawValueAboveBarEnabled = true
        chartView.autoScaleMinMaxEnabled = false
        chartView.fitBars = false
        handleOption(Option.animateXY, forChartView: chartView)
        // Do any additional setup after loading the view.
        self.options = [.toggleValues,
                        .toggleHighlight,
                        .animateX,
                        .animateY,
                        .animateXY,
                        .saveToGallery,
                        .togglePinchZoom,
                        .toggleAutoScaleMinMax,
                        .toggleData,
                        .toggleBarBorders]
        
        self.setup(barLineChartView: chartView)
        
        chartView.delegate = self 
        
        chartView.setExtraOffsets(left: 12, top: -5, right: 12, bottom: 5)
        
        chartView.drawBarShadowEnabled = false
        chartView.chartDescription?.enabled = false
        chartView.xAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.drawBarShadowEnabled = false
        
        
        let leftAxis = chartView.leftAxis
        leftAxis.drawLabelsEnabled = false
        leftAxis.spaceTop = 0.25
        leftAxis.spaceBottom = 0.25
        leftAxis.drawAxisLineEnabled = false
        leftAxis.drawZeroLineEnabled = true
        leftAxis.zeroLineColor = .white
        leftAxis.zeroLineWidth = 1.5
        
        self.updateChartData()
    }
    
    
    
    func createSearchBar() {
        let searchBar = UISearchBar()
       // searchBar.showsCancelButton = true
        searchBar.placeholder = "Search"
        searchBar.delegate = self
        searchBar.backgroundColor = UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
        self.navigationItem.titleView = searchBar
    }
    
    
    override func updateChartData() {
        if self.shouldHideData {
            chartView.data = nil
            return
        }
        
        self.setChartData()
    }
    
    func setChartData() {
        let yVals = [BarChartDataEntry(x: 0, y: 124.1),
                     BarChartDataEntry(x: 1, y: 238.5),
                     BarChartDataEntry(x: 2, y: 1280.1),
                     BarChartDataEntry(x: 3, y:   42.3),
                     BarChartDataEntry(x: 4, y: 980.1),
                     BarChartDataEntry(x: 5, y: 91.1)]
        
        let green = UIColor(red: 228/255, green: 32/255, blue: 30/255, alpha: 1)
        let red = UIColor(red: 31/255, green: 228/255, blue: 24/255, alpha: 1)
        let colors = yVals.map { (entry) -> NSUIColor in
            return entry.y > 257 ? red : green
        }
        
        let set = BarChartDataSet(values: yVals, label: "")
        set.colors = colors
        set.valueColors = colors
        let data = BarChartData(dataSet: set)
        data.setValueFont(.systemFont(ofSize: 13))
        
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        data.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        data.barWidth = 0.9
        chartView.data = data
    
    }
    
    override func optionTapped(_ option: Option) {
        super.handleOption(option, forChartView: chartView)
    }
}

extension ChartsViewController: IAxisValueFormatter {
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return dataLabels[min(max(Int(value), 0), dataLabels.count - 1)]
    }
}

