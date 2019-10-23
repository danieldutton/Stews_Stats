import Foundation

class FakeUserDefaults: UserDefaults {
    var dataCallCount = 0
    var forKey = ""
    var dataToReturn: Data? = Data(capacity: 5)
    
    var setCount = 0
    var value: Any?

    
    override func data(forKey: String) -> Data? {
        dataCallCount += 1
        self.forKey = forKey
        
        return dataToReturn
    }
    
    override func set(_ value: Any?, forKey defaultName: String) {
        self.setCount += 1
        self.value = value
        self.forKey = defaultName
    }
}
