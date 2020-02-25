class Solution:
    def minArray(self, numbers: List[int]) -> int:
        for i in range(len(numbers) - 1):
            if numbers[i] > numbers[i + 1]:
                return numbers[i + 1]
        return numbers[0]