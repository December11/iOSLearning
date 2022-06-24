import PlaygroundSupport


var source:  = NewsDataSource()
source.refreshScreenItems()

var beautifulSource = BeautifulDataSource()
beautifulSource.refreshScreenItems()




//let arr = [1, 2, 3, 4, 50 ,24, 4034, 32023023]
//let arrInArr = [arr, arr, arr]
//
//
//let arr2 = arr.map {
//    $0 * 2
//}
//
//let arr3: [Int] = arr.compactMap {
//    if $0 % 2 == 0 {
//        return nil
//    } else {
//        return $0
//    }
//}
//
//
//
//let value = arr.reduce(into: 0) { result, element in
//    result += element
//}
//
//
//
//print(value)
