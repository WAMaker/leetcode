
class Trie {

    private let root = TrieNode()

    /** Initialize your data structure here. */
    init() {

    }

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var node = root
        for (i, c) in word.enumerated() {
            let next = node.insert(c)
            node = next
        }
        node.isString = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = root
        for c in word {
            guard let result = node.search(c) else {
                return false
            }
            node = result
        }
        return node.isString
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        for c in prefix {
            guard let result = node.search(c) else {
                return false
            }
            node = result
        }
        return true
    }
}

class TrieNode {

    var isString = false
    private var map = [Character: TrieNode]()

    func insert(_ c: Character) -> TrieNode {
        if let node = map[c] {
            return node
        }
        let node = TrieNode()
        map[c] = node
        return node
    }

    func search(_ c: Character) -> TrieNode? {
        return map[c]
    }

}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

