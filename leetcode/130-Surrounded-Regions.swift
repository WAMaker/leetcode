let X = Character("X")
let O = Character("O")

class Solution {

    func solve(_ board: inout [[Character]]) {
        guard let columnCount = board.first?.count else {
            return
        }
        let rowCount = board.count
        let uf = UnionFind(rowCount: rowCount, columnCount: columnCount)

        board.enumerated().forEach { i, row in
            row.enumerated().forEach { j, item in
                guard item == O else {
                    return
                }

                if i == 0 || i == rowCount - 1 || j == 0 || j == columnCount - 1 {
                    uf.open(i, j)
                }

                // top
                if i > 0 && board[i - 1][j] == O {
                    uf.union(i, j, i - 1, j)
                }

                // bottom
                if i < rowCount - 1 && board[i + 1][j] == O {
                    uf.union(i, j, i + 1, j)
                }

                // left
                if j > 0 && board[i][j - 1] == O {
                    uf.union(i, j, i, j - 1)
                }

                // right
                if j < columnCount - 1 && board[i][j + 1] == O {
                    uf.union(i, j, i, j + 1)
                }
            }
        }

        for i in 0..<rowCount {
            for j in 0..<columnCount where board[i][j] == O {
                if !uf.isOpen(i, j) {
                    board[i][j] = X
                }
            }
        }
    }

}

class UnionFind {

    var parent: [Int]
    var sizes: [Int]

    private let rowCount: Int
    private let columnCount: Int

    private var opened: [Bool]

    init(rowCount: Int, columnCount: Int) {
        self.rowCount = rowCount
        self.columnCount = columnCount

        let count = rowCount * columnCount

        sizes = Array(repeating: 1, count: count)
        parent = Array(repeating: 0, count: count)
        opened = Array(repeating: false, count: count)

        for i in 0..<count {
            parent[i] = i
        }
    }

    func isOpen(_ i: Int, _ j: Int) -> Bool {
        return opened[find(i, j)]
    }

    func open(_ i: Int, _ j: Int) {
        let index = calculateIndex(i, j)
        opened[index] = true
    }

    func union(_ li: Int, _ lj: Int, _ ri: Int, _ rj: Int) {
        let rootLeft = find(li, lj)
        let rootRight = find(ri, rj)

        if li == 0 || li == rowCount - 1 || lj == 0 || lj == columnCount - 1 {
            open(li, lj)
        }
        if ri == 0 || ri == rowCount - 1 || rj == 0 || rj == columnCount - 1 {
            open(ri, rj)
        }

        if rootLeft == rootRight {
            return
        }

        if opened[rootLeft] {
            parent[rootRight] = parent[rootLeft]
            sizes[rootLeft] += sizes[rootRight]
            return
        }
        if opened[rootRight] {
            parent[rootLeft] = parent[rootRight]
            sizes[rootRight] += sizes[rootLeft]
            return
        }

        if sizes[rootLeft] > sizes[rootRight] {
            parent[rootRight] = parent[rootLeft]
            sizes[rootLeft] += sizes[rootRight]
        } else {
            parent[rootLeft] = parent[rootRight]
            sizes[rootRight] += sizes[rootLeft]
        }
    }

    func find(_ i: Int, _ j: Int) -> Int {
        var index = calculateIndex(i, j)
        while index != parent[index] {
            parent[index] = parent[parent[index]]
            index = parent[index]
        }
        return index
    }

    private func calculateIndex(_ i: Int, _ j: Int) -> Int {
        return i * columnCount + j
    }

}
