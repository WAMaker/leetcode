class Solution {
public:
	int maxArea(vector<int>& height) {
		int left = 0, right = height.size() - 1;
		int max_area = 0;
		if (left >= right) {
			return max_area;
		}
		
		while (left < right) {
			int area = (right - left) * min(height[left], height[right]);
			max_area = max(max_area, area);
			if (height[left] >= height[right]) {
				right--;
			} else {
				left++;
			}
		}
		
		return max_area;
	}
};