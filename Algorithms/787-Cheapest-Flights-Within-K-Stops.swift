class Solution {
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        let pq = MinPQ()
        var map = [Int: [Flight]]()

        flights.forEach {
            let flight = Flight(src: $0[0], dst: $0[1], price: $0[2])
            if var dsts = map[flight.src] {
                dsts.append(flight)
                map[flight.src] = dsts
            } else {
                map[flight.src] = [flight]
            }

            if flight.src == src {
                pq.add(flight)
            }
        }

        var minCost = Int.max

        while let flight = pq.deleteMin() {
            guard flight.steps <= K else {
                continue
            }
            if flight.dst == dst {
                minCost = flight.lastPrice
                break
            }

            guard let destinations = map[flight.dst] else {
                continue
            }
            for var destination in destinations {
                destination.lastPrice = flight.lastPrice + destination.lastPrice
                destination.steps = flight.steps + 1
                pq.add(destination)
            }
        }

        return minCost == Int.max ? -1 : minCost
    }
}

struct Flight {
    let src: Int
    let dst: Int
    let price: Int
    var steps: Int
    var lastPrice: Int

    init(src: Int, dst: Int, price: Int) {
        self.src = src
        self.dst = dst
        self.price = price
        self.steps = 0
        self.lastPrice = price
    }
}

class MinPQ {

    private var heap = [Flight]()
    private var size: Int {
        return heap.count - 1
    }

    init() {
        let dst = Flight(src: 0, dst: 0, price: 0)
        heap.append(dst)
    }

    func add(_ flight: Flight) {
        heap.append(flight)
        swim(size)
    }

    func deleteMin() -> Flight? {
        if size == 0 {
            return nil
        }
        exchange(1, size)
        let last = heap.removeLast()
        sink(1)
        return last
    }

    private func swim(_ i: Int) {
        var idx = i
        while idx / 2 >= 1 && less(idx, idx / 2) {
            exchange(idx, idx / 2)
            idx /= 2
        }
    }

    private func sink(_ i: Int) {
        let sz = size
        var idx = i
        while idx * 2 <= sz {
            var child = idx * 2
            if child + 1 <= sz, less(child + 1, child) {
                child += 1
            }
            if less(idx, child) {
                break
            }
            exchange(idx, child)
            idx = child
        }
    }

    private func less(_ left: Int, _ right: Int) -> Bool {
        return heap[left].lastPrice < heap[right].lastPrice
    }

    private func exchange(_ left: Int, _ right: Int) {
        (heap[left], heap[right]) = (heap[right], heap[left])
    }

}
