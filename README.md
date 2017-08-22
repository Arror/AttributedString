# AttributedString

```swift
let str1 = AttributedString(string: "Hallo world!", attributes: .foregroundColor(.red), .font(.systemFont(ofSize: 24.0)))

var str2 = str1

str2.add(attributes: .foregroundColor(.green), .font(.systemFont(ofSize: 30.0)), range: str2.startIndex..<str2.endIndex)

self.label1.attributedText = str1 as NSAttributedString

self.label2.attributedText = str2 as NSAttributedString
```