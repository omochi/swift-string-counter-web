import React

struct TitleBarView: Component {
    func render() -> Node {
        return div(
            attributes: [
                "style": """
                    font-size: 20px;
                    font-weight: bold;
                    padding: 16px;
                """
            ]
        ) {
            "Swift String Counter"
        }
    }
}
