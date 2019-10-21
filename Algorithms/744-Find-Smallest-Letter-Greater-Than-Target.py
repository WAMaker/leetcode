class Solution:
    def nextGreatestLetter(self, letters: List[str], target: str) -> str:
        l, r = 0, len(letters) - 1
        
        while l <= r:
            m = l + (r - l) // 2
            letter = letters[m]
            if letter <= target:
                l = m + 1
            else:
                r = m - 1
        if l == len(letters) or r == -1:
            return letters[0]
        return letters[l]