class Solution {
    func swimInWater(_ grid: [[Int]]) -> Int {
        let N = grid.count
        let uf = UnionFinder(grid.flatMap { $0 }, N: N)
        for i in 0 ..< N * N {
            if uf.open(t: i) {
                return i
            }
        }
        return 0
    }
}

class UnionFinder {

    typealias Index = (x: Int, y: Int)

    private let N: Int
    private let elevation: [Int]

    private var tree = [Int]()
    private var size: [Int]
    private var elevationIndex: [Int]

    init(_ elevation: [Int], N: Int) {
        self.N = N
        self.elevation = elevation

        size = Array(repeating: 1, count: N * N)
        elevationIndex = Array(repeating: 0, count: N * N)

        tree.reserveCapacity(N * N)
        elevation.enumerated().forEach { idx, val in
            tree.append(idx)
            elevationIndex[val] = idx
        }
    }

    func open(t: Int) -> Bool {
        let eIndex = elevationIndex[t]
        let index: Index = (x: eIndex / N, y: eIndex % N)
        let rootT = find(eIndex)

        // up
        if index.x - 1 >= 0, elevation[(index.x - 1) * N + index.y] < t {
            let upEIndex = (index.x - 1) * N + index.y
            let rootUp = find(upEIndex)

            if rootUp != rootT {
                union(eIndex, upEIndex)
            }
        }

        // down
        if index.x + 1 < N, elevation[(index.x + 1) * N + index.y] < t {
            let downEIndex = (index.x + 1) * N + index.y
            let rootDown = find(downEIndex)

            if rootDown != rootT {
                union(eIndex, downEIndex)
            }
        }

        // left
        if index.y - 1 >= 0, elevation[index.x * N + index.y - 1] < t {
            let leftEIndex = index.x * N + index.y - 1
            let rootLeft = find(leftEIndex)

            if rootLeft != rootT {
                union(eIndex, leftEIndex)
            }
        }

        // right
        if index.y + 1 < N, elevation[index.x * N + index.y + 1] < t {
            let rightEIndex = index.x * N + index.y + 1
            let rootUp = find(rightEIndex)

            if rootUp != rootT {
                union(eIndex, rightEIndex)
            }
        }

        let rootFirst = find(0)
        let rootLast = find(N * N - 1)
        return rootFirst == rootLast
    }

    private func find(_ i: Int) -> Int {
        var parent = i
        while parent != tree[parent] {
            parent = tree[parent]
        }
        return parent
    }

    private func union(_ i: Int, _ j: Int) {
        let rootI = find(i)
        let rootJ = find(j)

        if rootI == rootJ {
            return
        }

        if size[rootI] < size[rootJ] {
            tree[rootI] = tree[rootJ]
            size[rootJ] += size[rootI]
        } else {
            tree[rootJ] = tree[rootI]
            size[rootI] += size[rootJ]
        }
    }

}
