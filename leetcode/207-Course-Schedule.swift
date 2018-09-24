class Solution {
    private var map = [Int: [Int]]()
    private var marked = [Bool]()
    private var onStack = [Bool]()
    private var hasCycle = false

    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        if prerequisites.isEmpty {
            return true
        }
        marked = Array(repeating: false, count: numCourses)
        onStack = Array(repeating: false, count: numCourses)
        hasCycle = false

        prerequisites.forEach { prerequisite in
            if var edges = map[prerequisite[0]] {
                edges.append(prerequisite[1])
                map[prerequisite[0]] = edges
            } else {
                map[prerequisite[0]] = [prerequisite[1]]
            }
        }

        for key in map.keys where !marked[key] {
            dfs(v: key)
        }
        return !hasCycle
    }

    private func dfs(v: Int) {
        marked[v] = true
        onStack[v] = true
        guard let edges = map[v] else {
            onStack[v] = false
            return
        }
        for w in edges {
            if hasCycle {
                return
            }
            if !marked[w] {
                dfs(v: w)
            } else if onStack[w] {
                hasCycle = true
                return
            }
        }
        if hasCycle {
            return
        }
        onStack[v] = false
    }
}
