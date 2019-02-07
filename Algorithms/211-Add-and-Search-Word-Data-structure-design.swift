
class WordDictionary {

    private let root = TrieNode()

    /** Initialize your data structure here. */
    init() {

    }

    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var node = root
        word.forEach {
            let next = node.add($0)
            node = next
        }
        node.isWord = true
    }

    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return search(Array(word), 0, root)
    }

    private func search(_ cs: [Character], _ i: Int, _ node: TrieNode) -> Bool {
        if i == cs.count {
            return node.isWord
        }
        let c = cs[i]
        if c == Character(".") {
            for (_, val) in node.map {
                if search(cs, i + 1, val) {
                    return true
                }
            }
        } else if let next = node.map[c] {
            return search(cs, i + 1, next)
        }
        return false
    }

}

class TrieNode {

    var isWord = false
    var map = [Character: TrieNode]()

    func add(_ c: Character) -> TrieNode {
        if let node = map[c] {
            return node
        }
        let node = TrieNode()
        map[c] = node
        return node
    }

}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */

