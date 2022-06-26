extension Int {
    var isEven: Bool {
        self % 2 == 0
    }
    var isOdd: Bool {
        self % 2 != 0
    }
    var nextOdd: Int {
        self * 2 + 1
    }
}

