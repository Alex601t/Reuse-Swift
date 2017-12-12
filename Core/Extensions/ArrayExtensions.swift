import Foundation

public extension Array {
    func element(at index: Int) -> Element? {
        return (0 <= index && index < count) ? self[index] : nil
    }
}
