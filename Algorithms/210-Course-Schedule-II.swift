class Solution {
    private var map = [Int: [Int]]()
    private var marked = [Bool]()
    private var onStack = [Bool]()
    private var results = [Int]()
    private var hasCycle = false

    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        marked = Array(repeating: false, count: numCourses)
        onStack = Array(repeating: false, count: numCourses)

        prerequisites.forEach { prerequisite in
            if var edges = map[prerequisite[0]] {
                edges.append(prerequisite[1])
                map[prerequisite[0]] = edges
            } else {
                map[prerequisite[0]] = [prerequisite[1]]
            }
        }

        for key in map.keys where !marked[key] {
            dfs(key)
        }

        if hasCycle {
            return []
        }

        for i in 0 ..< numCourses where !marked[i] {
            results.append(i)
        }
        return results
    }

    private func dfs(_ v: Int) {
        marked[v] = true
        onStack[v] = true
        if hasCycle {
            onStack[v] = false
            return
        }
        guard let prerequisite = map[v] else {
            results.append(v)
            onStack[v] = false
            return
        }
        for w in prerequisite {
            if hasCycle {
                break
            }
            if !marked[w] {
                dfs(w)
            } else if onStack[w] {
                hasCycle = true
                break
            }
        }
        if hasCycle {
            return
        }
        results.append(v)
        onStack[v] = false
    }
}
