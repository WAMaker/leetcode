class Solution {
public:
	string reverseWords(string s) {
		int i, start, end;
		string res;
		
		for (i = 0; i < s.length(); i++) {
			if (s[i] != ' ') {
				break;
			}
		}
		start = i;
		for (i = s.length() - 1; i >= 0; i--) {
			if (s[i] != ' ') {
				break;
			}
		}
		end = i;
		
		for (i = start; i <= end; i++) {
			if (s[i] == ' ' && s[i - 1] == ' ') {
				continue;
			}
			res += s[i];
		}
		reverse(res.begin(), res.end());
		
		int ri = 0;
		for (i = 0; i <= res.length(); i++) {
			if (res[i] != ' ') {
				continue;
			}
			reverse(res.begin() + ri, res.begin() + i);
			ri = i + 1;
		}
		reverse(res.begin() + ri, res.end());
		
		return res;
	}
};