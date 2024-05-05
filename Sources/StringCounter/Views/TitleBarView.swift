import React

struct TitleBarView: Component {
    @State var showsAbout: Bool = false

    func render() -> Node {

        let onAboutButton = EventListener { (_) in
            showsAbout.toggle()
        }

        return div(
            style: .init()
                .display("flex")
                .flexDirection("column")
        ) {
            div(
                style: .init()
                    .display("flex")
                    .alignItems("center")
                    .justifyContent("space-between")
                    .margin("16px")
            ) {
                span(
                    style: .init()
                        .fontSize("20px")
                        .fontWeight("bold")
                ) {
                    "Swift String Counter"
                }

                div(
                    style: .init()
                        .display("flex")
                        .alignItems("center")
                        .gap("16px")
                ) {
                    button(
                        attributes: .init()
                            .class("button"),
                        listeners: .init()
                            .click(onAboutButton)
                    ) {
                        "About"
                    }

                    a(
                        attributes: .init()
                            .href("https://github.com/omochi/swift-string-counter-web")
                    ) {
                        button(
                            attributes: .init()
                                .class("button")
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
