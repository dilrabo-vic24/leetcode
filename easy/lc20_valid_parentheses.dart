void main(List<String> args) {
  Solution solution = Solution();
  String strs = "([])";

  print(solution.isValid(strs));
}

class Solution {
  bool isValid(String s) {
    List<String> emptyStack = [];
    for (int i = 0; i < s.length; i++) {
      if (s[i] == "(") {
        emptyStack.add(")");
      } else if (s[i] == "{") {
        emptyStack.add("}");
      } else if (s[i] == "[") {
        emptyStack.add("]");
      } else if (s[i] == ")") {
        if (emptyStack.isEmpty) {
          return false;
        }else{
          if(emptyStack.last != ")"){
            return false;
          }
          emptyStack.removeLast();
        }
      }
      else if (s[i] == "}") {
        if (emptyStack.isEmpty) {
          return false;
        }else{
          if(emptyStack.last != "}"){
            return false;
          }
          emptyStack.removeLast();
        }
      }
      else if (s[i] == "]") {
        if (emptyStack.isEmpty) {
          return false;
        }else{
          if(emptyStack.last != "]"){
            return false;
          }
          emptyStack.removeLast();
        }
      }
    }

    if(emptyStack.isEmpty){
      return true;
    }else{
      return false;
    }

  }
}


class Solution2 {
  bool isValid(String s) {
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == '(') stack.add(')');
      else if (c == '{') stack.add('}');
      else if (c == '[') stack.add(']');
      else {
        if (stack.isEmpty || stack.removeLast() != c) return false;
      }
    }
    return stack.isEmpty;
  }
}
