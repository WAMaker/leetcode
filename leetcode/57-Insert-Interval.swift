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
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        guard let first = intervals.first, let last = intervals.last else {
            return [newInterval]
        }
        if first.start > newInterval.end {
            return [newInterval] + intervals
        }
        if last.end < newInterval.start {
            return intervals + [newInterval]
        }

        var results = [Interval]()
        var isMerged = false
        for (idx, interval) in intervals.enumerated() {
            guard let rl = results.last else {
                if interval.end >= newInterval.start {
                    let merged = Interval(min(interval.start, newInterval.start), max(interval.end, newInterval.end))
                    results.append(merged)
                    isMerged = true
                } else {
                    results.append(interval)
                }
                continue
            }
            guard rl.end < interval.start else {
                rl.start = min(rl.start, interval.start)
                rl.end = max(rl.end, interval.end)
                continue
            }
            if interval.start > newInterval.end {
                if !isMerged {
                    results.append(newInterval)
                }
                results += intervals[idx...]
                break
            }
            if interval.end < newInterval.start {
                results.append(interval)
                continue
            }
            let merged = Interval(min(interval.start, newInterval.start), max(interval.end, newInterval.end))
            results.append(merged)
            isMerged = true
        }
        return results
    }
}
