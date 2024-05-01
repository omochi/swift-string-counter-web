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
                    display: flex;
                    flex-direction: column;
                """
            ]
        ) {
            TitleBarView()

            div(
                attributes: [
                    "style": """
                        display: flex;
                        flex-direction: column;
                        gap: 16px;
                    """
                ]
            ) {

                textarea(
                    attributes: [
                        "rows": "4",
                        "style": """
                            margin: 0px 16px;
                        """
                    ],
                    listeners: [
                        "input": onTextChange
                    ]
                )

                CardListView(cards: cards)
            }
        }
    }
}
