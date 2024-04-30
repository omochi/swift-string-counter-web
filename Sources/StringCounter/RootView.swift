import React

struct RootView: Component {

    @State var text: String = ""

    func render() -> Node {
        let onTextChange = EventListener { (event) in
            let text = try! String.mustConstruct(from: event.jsValue.target.value)
            self.text = text
        }

        return div(
            attributes: [
                "class": "root-wrapper"
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
            "table"
        }
    }
}
