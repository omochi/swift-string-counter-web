import React

struct CardHeaderView: Component {
    func render() -> Node {
        func cellStyle(height: String = "28px") -> String {
            return """
            display: flex;
            align-items: center;
            height: \(height);
            """
        }

        return div(
            attributes: [
                "style": """
                    margin-right: 16px;
                    display: flex;
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 8px;
                    -- border: solid 1px var(--gray-300);
                    -- border-radius: 4px;
                    padding: 9px;
                """
            ]
        ) {
            div(
                attributes: ["style": cellStyle()]
            ) {
                "byte offset"
            }

            div(
                attributes: ["style": cellStyle()]
            ) {
                "utf-8 byte"
            }

            div(
                attributes: ["style": cellStyle(height: "64px")]
            ) {
                "unicode scalar"
            }

            div(
                attributes: ["style": cellStyle()]
            ) {
                "character"
            }
        }
    }
}

