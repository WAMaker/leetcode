class Solution {

    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var keys = Set<Int>()
        var marked = [Bool](repeating: false, count: rooms.count)

        func dfs(_ key: Int) {
            if marked[key] {
                return
            }
            marked[key] = true
            keys.insert(key)
            for k in rooms[key] {
                if marked[k] {
                    continue
                }
                dfs(k)
            }
        }

        dfs(0)
        return keys.count == rooms.count
    }

}
