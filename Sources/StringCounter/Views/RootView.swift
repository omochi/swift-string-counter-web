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
            style: .init()
                .display("flex")
                .flexDirection("column")
        ) {
            TitleBarView()

            div(
                style: .init()
                    .display("flex")
                    .flexDirection("column")
                    .gap("16px")
            ) {

                textarea(
                    attributes: .init()
                        .rows("4")
                        .placeholder("input your string here"),
                    style: .init()
                        .margin("0px 16px"),
                    listeners: .init()
                        .input(onTextChange)
                )

                CardListView(cards: cards)
            }
        }
    }
}
