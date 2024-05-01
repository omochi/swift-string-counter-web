import React

struct AboutView: Component {
    func render() -> Node {
        return div(
            attributes: [
                "style": """
                margin: 0px 16px 16px;
                """
            ]
        ) {
            p {
                "このページでは Swift による文字の数え上げ結果を調べることができます。"
                "実際に Swift によって実装され、 Wasm にコンパイルすることであなたのブラウザ上で実行しています。"
            }
            p {
                "HTML のレンダリングには "

                a(
                    attributes: [
                        "href": "https://github.com/omochi/swift-react"
                    ]
                ) {
                    "Swift React"
                }

                " を利用しています。"
            }
        }
    }
}

struct TitleBarView: Component {
    @State var showsAbout: Bool = false

    func render() -> Node {

        let onAboutButton = EventListener { (_) in
            showsAbout.toggle()
        }

        return div(
            attributes: [
                "style": """
                display: flex;
                flex-direction: column;
                """
            ]
        ) {
            div(
                attributes: [
                    "style": """
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin: 16px;
                    """
                ]
            ) {
                span(
                    attributes: [
                        "style": """
                        font-size: 20px;
                        font-weight: bold;
                        """
                    ]
                ) {
                    "Swift String Counter"
                }

                div(
                    attributes: [
                        "style": """
                        display: flex;
                        align-items: center;
                        gap: 16px;
                        """
                    ]
                ) {
                    button(
                        attributes: [
                            "class": "button",
                        ],
                        listeners: [
                            "click": onAboutButton
                        ]
                    ) {
                        "About"
                    }

                    a(
                        attributes: [
                            "href": "https://github.com/omochi/swift-string-counter-web"
                        ]
                    ) {
                        button(
                            attributes: [
                                "class": "button",
                            ]
                        ) {
                            "GitHub"
                        }
                    }
                }
            }

            if showsAbout {
                AboutView()
            }
        }
    }
}
