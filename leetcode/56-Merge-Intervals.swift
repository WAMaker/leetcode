/**
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.isEmpty {
            return []
        }
        let sorted = intervals.sorted { $0.start < $1.start }
        var results = [Interval]()
        sorted.forEach { item in
            var appended = false
            for result in results {
                if result.end < item.start  {
                    continue
                }
                appended = true
                if result.end >= item.end {
                    continue
                }
                result.end = item.end
            }
            if !appended {
                results.append(item)
            }
        }
        return results
    }
}
