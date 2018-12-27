class Solution {

    private var results = [String: Int]()

    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        results = [String: Int]()

        cpdomains.forEach { cpdomain in
            let tmp = cpdomain.split(separator: " ")
            guard let countStr = tmp.first, let count = Int(countStr), let domainStr = tmp.last else {
                return
            }
            domainVisitCount(String(domainStr), count: count)
        }

        return results.map {
            "\($1) \($0)"
        }
    }

    private func domainVisitCount(_ domain: String, count: Int) {
        if let visited = results[domain] {
            results[domain] = visited + count
        } else {
            results[domain] = count
        }

        let dot = Character(".")
        guard domain.contains(dot) else {
            return
        }
        for (i, c) in domain.enumerated() {
            if c == dot {
                let index = domain.index(domain.startIndex, offsetBy: i + 1)
                let parentDomain = String(domain[index...])
                domainVisitCount(parentDomain, count: count)
                return
            }
        }
    }

}
