# AttributedString

```swift
let str1 = AttributedString(string: "Hallo world!", attributes: .foregroundColor(.red), .font(.systemFont(ofSize: 24.0)))

self.label1.attributedTextEx = str1

var str2 = AttributedString(string: "My email is hello@danielemargutti.com and my website is http://www.danielemargutti.com")

str2.add(attributes: .font(.systemFont(ofSize: 14.0)), range: str2.fullRange)

let mailRegular = Regular(pattern: "([A-Za-z0-9_\\-\\.\\+])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]+)", options: .caseInsensitive, matchingOptions: [])
let urlRegular = Regular(pattern: "http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?", options: .caseInsensitive, matchingOptions: [])

try! str2.add(attributes: .font(.systemFont(ofSize: 18.0)), .foregroundColor(.red), range: str2.fullRange, regular: mailRegular)
try! str2.add(attributes: .font(.systemFont(ofSize: 18.0)), .foregroundColor(.green), range: str2.fullRange, regular: urlRegular)

self.label2.attributedTextEx = str2
```