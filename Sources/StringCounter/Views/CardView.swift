import React

struct CardView: Component {
    var key: AnyHashable?

    var card: Card
    var deps: Deps? {
        [key, card]
    }

    func render() -> Node {
        func cellStyle(font: String? = nil) -> Style {
            var s = Style()
                .display("flex")
                .alignItems("center")
                .height("18px")
            if let font {
                s = s.fontFamily(font)
            }
            return s
        }

        return div(
            style: .init()
                .display("flex")
                .flexDirection("column")
                .alignItems("center")
                .gap("8px")
                .border("1px solid var(--gray-300)")
                .borderRadius("8px")
                .padding("8px")
        ) {
            div(
                style: cellStyle(font: "monospace")
            ) {
                "\(card.byteOffset)"
            }

            div(
                style: cellStyle(font: "monospace")
            ) {
                String(format: "0x%02X", card.byte)
            }

            div(
                style: .init()
                    .display("flex")
                    .flexDirection("column")
                    .alignItems("center")
                    .gap("4px")
            ) {

                div(
                    style: cellStyle(font: "monospace")
                ) {
                    if let scalar = card.scalar {
                        String(format: "U+%04X", scalar.value)
                    }
                }

                div(
                    style: cellStyle()
                ) {
                    if let scalar = card.scalar {
                        scalar.description
                    }
                }
            }

            div(
                style: cellStyle()
            ) {
                if let char = card.char {
                    char.description
                }
            }
        }
    }
}
