import React

struct RootView: Component {

    @State var text: String = ""

    func render() -> Node {
        let onTextChange = EventListener { (event) in
            let text = try! String.mustConstruct(from: event.jsValue.target.value)
            self.text = text
        }

        let cards = Card.make(from: text)

        return div(
            attributes: [
                "style": """
                    margin: 32px;
                    -- width: 400px;
                    display: flex;
                    flex-direction: column;
                    gap: 32px;
                """
            ]
        ) {
            textarea(
                attributes: [
                    "rows": "4"
                ],
                listeners: [
                    "input": onTextChange
                ]
            )
            div(
                attributes: [
                    "style": """
                        display: flex;
                        gap: 32px 8px;
                        flex-wrap: wrap;
                    """
                ]
            ) {
                CardHeaderView()

                cards.map { (card) in
                    CardView(key: card.byteOffset, card: card)
                }
            }
        }
    }
}
