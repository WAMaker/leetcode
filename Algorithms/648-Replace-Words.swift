class Solution {

    private let trie = Trie()

    func replaceWords(_ dict: [String], _ sentence: String) -> String {
        dict.forEach { word in
            trie.insert(word)
        }

        var words = sentence.split(separator: " ")
        var result = ""

        words.enumerated().forEach { i, word in
            result += trie.replacement(String(word))
            if i != words.count - 1 {
                result += " "
            }
        }

        return result
    }

}

class Trie {

    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        word.forEach { c in
            let next = node.insert(c)
            node = next
        }
        node.len = word.count
    }

    func replacement(_ word: String) -> String {
        var replace = ""
        var node = root
        for c in word {
            guard let next = node.search(c) else {
                break
            }
            replace += String(c)
            if next.len > 0 {
                return replace
            }
            node = next
        }
        return word
    }

}

class TrieNode {

    var len = 0
    private var map = [Character: TrieNode]()

    func search(_ c: Character) -> TrieNode? {
        return map[c]
    }

    func insert(_ c: Character) -> TrieNode {
        if let node = map[c] {
            return node
        }
        let node = TrieNode()
        map[c] = node
        return node
    }

}
