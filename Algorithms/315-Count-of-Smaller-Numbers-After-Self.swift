class Solution {
	private var count = [Int: Int]()
	private var smallerCounts = [Int]()
	
	struct Item {
		let num: Int
		let origin: Int
	}
	
	func countSmaller(_ nums: [Int]) -> [Int] {
		if nums.isEmpty {
			return []
		}
		
		var items = nums.enumerated().map {
			Item(num: $1, origin: $0)
		}
		smallerCounts = [Int](repeating: 0, count: nums.count)
		sort(&items, 0, nums.count - 1)
		
		return smallerCounts
	}
	
	private func sort(_ items: inout [Item], _ start: Int, _ end: Int) {
		if start >= end {
			return
		}
		
		let middle = start + (end - start) >> 1
		sort(&items, start, middle)
		sort(&items, middle + 1, end)
		
		var part1 = Array(items[start...middle]), part2 = Array(items[(middle + 1)...end])
		var cursor1 = part1.count - 1, cursor2 = part2.count - 1
		var cursor3 = end

		while cursor3 >= start {
			defer {
				cursor3 -= 1
			}
			
			if cursor1 < 0 {
				items[cursor3] = part2[cursor2]
				cursor2 -= 1
				continue
			}
			if cursor2 < 0 {
				items[cursor3] = part1[cursor1]
				cursor1 -= 1
				continue
			}

			if part1[cursor1].num > part2[cursor2].num {
				smallerCounts[part1[cursor1].origin] += cursor2 + 1
				items[cursor3] = part1[cursor1]
				cursor1 -= 1
			} else {
				items[cursor3] = part2[cursor2]
				cursor2 -= 1
			}
		}
	}
}