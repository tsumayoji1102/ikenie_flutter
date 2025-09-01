void main() {
  printName();
  calc(x: 4, y: 2);

  // いくつか出力
  judgePoint(92);
  judgePoint(73);
  judgePoint(45);
  judgePoint(12);

  fizzBuzz();

  greets();
}

// 問題1
void printName() {
  print("塩見陵介");
}

// 問題2
void calc({required int x, required int y}) {
  print("計算結果");
  print("$x + $y = ${x + y}");
  print("$x - $y = ${x - y}");
  print("$x × $y = ${x * y}");
  print("$x ÷ $y = ${x / y}");
}

// 問題3
void judgePoint(int point) {
  if (point >= 90) {
    print("Great");
  } else if (point >= 60) {
    print("Good");
  } else if (point >= 20) {
    print("Fight");
  } else {
    print("Red");
  }
}

// 問題4
void fizzBuzz() {
  // i < 101でもOK
  for (var i = 1; i <= 100; i++) {
    String text = "";
    if (i % 3 == 0) {
      text += "Fizz";
    }
    if (i % 5 == 0) {
      text += "Buzz";
    }
    print("$i: $text");
  }
}

// 問題5
void greet(String name, {String? greeting, String? punctuation}) {
  print("$greeting, $nameさん$punctuation");
}

// 問題6
void greets() {
  greet("田中", greeting: "こんにちは", punctuation: "!");
  greet("鈴木", greeting: "おはよう", punctuation: "!");
  greet("佐藤", greeting: "こんにちは", punctuation: "。");
  greet("高橋", greeting: "こんばんは", punctuation: "!!");
}
