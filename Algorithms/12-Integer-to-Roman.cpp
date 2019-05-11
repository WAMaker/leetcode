class Solution {
public:
	string intToRoman(int num) {
		string table[][10] = {
			{"", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"},
			{"", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"},
			{"", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"},
			{"", "M", "MM", "MMM"}
		};
		string res = "";
		int bit = 0;
		while (num > 0) {
			int quotient = num % 10;
			res = table[bit][quotient] + res;
			num /= 10;
			bit += 1;
		}
		
		return res;
	}
};