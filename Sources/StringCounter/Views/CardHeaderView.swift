import React

struct CardHeaderView: Component {
    func render() -> Node {
        func cellStyle(height: String = "18px") -> Style {
            return .init()
                .display("flex")
                .alignItems("center")
                .height(height)
        }

        return div(
            style: .init()
                .display("flex")
                .flexDirection("column")
                .alignItems("flex-start")
                .gap("8px")
                .border("1px solid var(--gray-300)")
                .borderRadius("8px")
                .padding("8px")
        ) {
            div(
                style: cellStyle()
            ) {
                "byte offset"
            }

            div(
                style: cellStyle()
            ) {
                "utf-8 byte"
            }

            div(
                style: cellStyle(height: "40px")
            ) {
                "unicode scalar"
            }

            div(
                style: cellStyle()
            ) {
                "character"
            }
        }
    }
}

