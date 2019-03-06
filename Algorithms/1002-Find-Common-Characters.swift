class Solution {
	func commonChars(_ A: [String]) -> [String] {
		var exist = [Character: Int]()
		A.enumerated().forEach { i, str in
			var tmp = [Character: Int]()
			str.forEach { c in
				tmp[c, default: 0] += 1
			}
			
			if i == 0 {
				exist = tmp
				return
			}
			exist.forEach { key, val in
				if let tval = tmp[key] {
					exist[key] = min(tval, val)
				} else {
					exist[key] = nil
				}
			}
		}
		var result = [String]()
		exist.forEach { key, val in
			for i in 0 ..< val {
				result.append("\(key)")
			}
		}
		return result
	}
}