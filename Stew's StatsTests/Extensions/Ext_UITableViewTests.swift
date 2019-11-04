import XCTest

class Ext_UITableViewTests: XCTestCase {

    //MARK:- hasValidIndexPathFor
    
    func test_foo() {
        let tableView = UITableView()
        let fakeDataSource = FakeDataSource()
        tableView.dataSource = fakeDataSource
        
        let cell = UITableViewCell()
        
        let indexPath = tableView.hasValidIndexPathFor(cell: cell)
    }
}

class FakeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    //3 sections, 3 rows
    var data = [
        ["1-1", "1-2","1-3"],
        ["1-1", "1-2","1-3"],
        ["1-1", "1-2","1-3"],
    ]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


