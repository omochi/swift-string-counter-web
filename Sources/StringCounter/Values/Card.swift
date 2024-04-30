struct Card: Hashable {
    var byteOffset: Int
    var byte: UInt8
    var scalar: UnicodeScalar?
    var char: Character?

    static func make(from string: String) -> [Card] {
        
        var byteOffset: Int = 0

        var cards: [Card] = []

        for char in string {
            for (scalarIndex, scalar) in char.unicodeScalars.enumerated() {
                for (byteIndex, byte) in scalar.utf8.enumerated() {
                    let card = Card(
                        byteOffset: byteOffset,
                        byte: byte,
                        scalar: byteIndex == 0 ? scalar : nil,
                        char: scalarIndex == 0 && byteIndex == 0 ? char : nil
                    )
                    cards.append(card)

                    byteOffset += 1
                }
            }
        }

        return cards
    }
}
