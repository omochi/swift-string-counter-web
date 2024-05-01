import React

struct CardListView: Component {
    var cards: [Card]

    func render() -> Node {
        return div(
            attributes: [
                "style": """
                    margin: 0px 16px;
                    display: flex;
                    gap: 16px 8px;
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
