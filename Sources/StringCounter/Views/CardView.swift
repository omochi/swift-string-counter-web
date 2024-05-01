import React

struct CardView: Component {
    var key: AnyHashable?

    var card: Card
    var deps: Deps? {
        [key, card]
    }

    func render() -> Node {
        func cellStyle(font: String? = nil) -> String {
            var s = """
            display: flex;
            align-items: center;
            height: 18px;
            """
            if let font {
                s += "font-family: \(font);"
            }
            return s
        }

        return div(
            attributes: [
                "style": """
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    gap: 8px;
                    border: solid 1px var(--gray-300);
                    border-radius: 4px;
                    padding: 8px;
                """
            ]
        ) {
            div(
                attributes: ["style": cellStyle(font: "monospace")]
            ) {
                "\(card.byteOffset)"
            }

            div(
                attributes: ["style": cellStyle(font: "monospace")]
            ) {
                String(format: "0x%02X", card.byte)
            }

            div(
                attributes: [
                    "style": """
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 4px;
                    """
                ]
            ) {

                div(
                    attributes: ["style": cellStyle(font: "monospace")]
                ) {
                    if let scalar = card.scalar {
                        String(format: "U+%04X", scalar.value)
                    }
                }

                div(
                    attributes: ["style": cellStyle()]
                ) {
                    if let scalar = card.scalar {
                        scalar.description
                    }
                }
            }

            div(
                attributes: ["style": cellStyle()]
            ) {
                if let char = card.char {
                    char.description
                }
            }
        }
    }
}
