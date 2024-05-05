import React

struct AboutView: Component {
    func render() -> Node {
        return div(
            style: .init()
                .margin("0px 16px 16px")
        ) {
            p {
                "このページでは Swift による文字の数え上げ結果を調べることができます。"
                "実際に Swift によって実装され、 Wasm にコンパイルすることであなたのブラウザ上で実行しています。"
            }
            p {
                "HTML のレンダリングには "

                a(
                    attributes: .init()
                        .href("https://github.com/omochi/swift-react")
                ) {
                    "Swift React"
                }

                " を利用しています。"
            }
        }
    }
}
