void main(List<String> args) {
  Solution solution = Solution();
  List<String> strs = ["cir", "car"];

  print(solution.longestCommonPrefix(strs));
}

class Solution {
  String longestCommonPrefix(List<String> strs) {
    String minLenthWord = strs[0];
    String maxPrefix = "";

    for (int i = 0; i < strs.length; i++) {
      if (strs[i].length < minLenthWord.length) {
        minLenthWord = strs[i];
      }
    }

    for (int i = 0; i < minLenthWord.length; i++) {
      bool check = true;

      for (int j = 0; j < strs.length; j++) {
        if (strs[j][i] != minLenthWord[i]) {
          check = false;
          break;
        }
      }

      if (check) {
        maxPrefix += minLenthWord[i];
      } else {
        break;
      }
    }

    return maxPrefix;
  }
}
