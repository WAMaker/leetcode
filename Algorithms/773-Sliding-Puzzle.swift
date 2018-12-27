class Solution {

    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let initialBoard = Board(board)
        let gameTree = GameTree(initialBoard, steps: 0, previous: nil)

        let initialTwinBoard = initialBoard.twin()
        let twinGameTree = GameTree(initialTwinBoard, steps: 0, previous: nil)

        let minPQ = MinPQ()
        minPQ.add(gameTree)
        let twinMinPQ = MinPQ()
        twinMinPQ.add(twinGameTree)

        while minPQ.size > 0 {
            let min = minPQ.deleteMin()
            if min.isGoal {
                return min.steps
            }

            let minTwin = twinMinPQ.deleteMin()
            if minTwin.isGoal {
                return -1
            }

            min.neighbors().forEach { gt in
                minPQ.add(gt)
            }
            minTwin.neighbors().forEach { gt in
                twinMinPQ.add(gt)
            }
        }
        return -1
    }

}

class GameTree {

    let board: Board
    let priority: Int
    let steps: Int

    var isGoal: Bool {
        return board.hamming == 0
    }

    private let previous: GameTree?

    init(_ board: Board, steps: Int, previous: GameTree?) {
        self.board = board
        self.steps = steps
        self.previous = previous
        self.priority = steps + board.hamming
    }

    func neighbors() -> [GameTree] {
        let previousBoard = previous?.board
        var neighbors = [GameTree]()
        board.neighbors().forEach { neighbor in
            if let previousBoard = previousBoard, previousBoard == neighbor {
                return
            }
            let gameTree = GameTree(neighbor, steps: steps + 1, previous: self)
            neighbors.append(gameTree)
        }
        return neighbors
    }

    public static func < (lhs: GameTree, rhs: GameTree) -> Bool {
        return lhs.priority < rhs.priority
    }

}

class Board: Equatable {

    typealias Index = (x: Int, y: Int)

    let hamming: Int
    let zeroIdx: Index

    private let board: [[Int]]

    init(_ board: [[Int]]) {
        self.board = board

        var hamming = 0
        var zeroIdx: Index = (0, 0)
        board.enumerated().forEach { i, column in
            column.enumerated().forEach { j, item in
                if item == 0 {
                    zeroIdx = (i, j)
                    return
                }
                if i * column.count + j + 1 != item {
                    hamming += 1
                }
            }
        }
        self.zeroIdx = zeroIdx
        self.hamming = hamming
    }

    func twin() -> Board {
        var twinBoard = board

        for (i, column) in board.enumerated() {
            for (j, item) in column.enumerated() {
                if item == 0 || i == board.count - 1 || j == column.count - 1 {
                    continue
                }
                if board[i][j + 1] != 0 {
                    (twinBoard[i][j], twinBoard[i][j + 1]) = (twinBoard[i][j + 1], twinBoard[i][j])
                    return Board(twinBoard)
                }
                if board[i + 1][j] != 0 {
                    (twinBoard[i][j], twinBoard[i + 1][j]) = (twinBoard[i + 1][j], twinBoard[i][j])
                    return Board(twinBoard)
                }
            }
        }

        return self
    }

    func neighbors() -> [Board] {
        let columnCount = board.count
        let rowCount = board.first?.count ?? 0

        var neighbors = [Board]()
        // top
        if zeroIdx.x - 1 >= 0 {
            var _board = board
            (_board[zeroIdx.x - 1][zeroIdx.y], _board[zeroIdx.x][zeroIdx.y]) = (_board[zeroIdx.x][zeroIdx.y], _board[zeroIdx.x - 1][zeroIdx.y])
            let bd = Board(_board)
            neighbors.append(bd)
        }

        // bottom
        if zeroIdx.x + 1 < columnCount {
            var _board = board
            (_board[zeroIdx.x + 1][zeroIdx.y], _board[zeroIdx.x][zeroIdx.y]) = (_board[zeroIdx.x][zeroIdx.y], _board[zeroIdx.x + 1][zeroIdx.y])
            let bd = Board(_board)
            neighbors.append(bd)
        }

        // left
        if zeroIdx.y - 1 >= 0 {
            var _board = board
            (_board[zeroIdx.x][zeroIdx.y - 1], _board[zeroIdx.x][zeroIdx.y]) = (_board[zeroIdx.x][zeroIdx.y], _board[zeroIdx.x][zeroIdx.y - 1])
            let bd = Board(_board)
            neighbors.append(bd)
        }

        // right
        if zeroIdx.y + 1 < rowCount {
            var _board = board
            (_board[zeroIdx.x][zeroIdx.y + 1], _board[zeroIdx.x][zeroIdx.y]) = (_board[zeroIdx.x][zeroIdx.y], _board[zeroIdx.x][zeroIdx.y + 1])
            let bd = Board(_board)
            neighbors.append(bd)
        }
        return neighbors
    }

    public static func == (lhs: Board, rhs: Board) -> Bool {
        return lhs.zeroIdx == rhs.zeroIdx
    }

}

class MinPQ {

    private var heap = [GameTree]()

    var size: Int {
        return heap.count - 1
    }

    init() {
        let zero = GameTree(Board([[]]), steps: 0, previous: nil)
        heap.append(zero)
    }

    func add(_ board: GameTree) {
        heap.append(board)
        swim(size)
    }

    func deleteMin() -> GameTree {
        exchange(1, size)
        let board = heap.removeLast()
        sink(1)
        return board
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1, less(idx, idx / 2) {
            exchange(idx, idx / 2)
            idx /= 2
        }
    }

    private func sink(_ i: Int) {
        var idx = i
        while idx * 2 <= size {
            var childIdx = idx * 2
            if childIdx + 1 <= size, less(childIdx + 1, childIdx) {
                childIdx += 1
            }
            if less(idx, childIdx) {
                break
            }
            exchange(idx, childIdx)
            idx = childIdx
        }
    }

    private func less(_ i: Int, _ j: Int) -> Bool {
        return heap[i].priority < heap[j].priority
    }

    private func exchange(_ i: Int, _ j: Int) {
        (heap[i], heap[j]) = (heap[j], heap[i])
    }

}
