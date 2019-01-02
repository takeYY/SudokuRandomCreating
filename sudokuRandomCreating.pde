/*
 * ～完成～
 * 数独解答をランダムに生成するプログラム。
 * 問題を解くときは自身で適当な箇所を空白にしてください。
*/

int[][] num = new int[9][9];        //行と列に規則性のある数独解答が入る配列
int[][] randomNum = new int[9][9];  //ランダムに並べた数独解答が入る配列
int n = 3141592;                         //ランダムに並び替える回数

void setup()
{
  noLoop();
}

void draw()
{
  //綺麗に並べられた配列を計算
  calcNum();
  
  //綺麗に並べられた配列の行同士・列同士をn回入れ替える計算
  calcRandomNum(n);
  //コンソールに(どの数独解答か,数独解答前に表示させたい文字列)を表示
  printSudoku(randomNum,n+"回ランダムに並べた数独の解答");
}

void calcNum()
{
  for(int y=0; y<9; y++)
  {
    for(int x=0; x<9; x++)
    {
      num[y][x] = 7*((x+1) + (3*y) + y/3);
      while(10 <= num[y][x])
      {
        num[y][x] -= 9;
      }
      randomNum[y][x] = num[y][x];
    }
  }
}

void calcRandomNum(int n)
{
  calcNum();
  
  for(int j=0; j<n; j++)
  {
    int randomY1 = (int)random(0,3);
    int randomY2 = (int)random(0,3);
    int randomX1 = (int)random(0,3);
    int randomX2 = (int)random(0,3);
    int index;
    for(int i=0; i<9; i++)
    {
      //行同士の入れ替え
      index = randomNum[3*(j%3)+randomY1][i];
      randomNum[3*(j%3)+randomY1][i] = randomNum[3*(j%3)+randomY2][i];
      randomNum[3*(j%3)+randomY2][i] = index;
    }
    for(int i=0; i<9; i++)
    {
      //列同士の入れ替え
      index = randomNum[i][3*(j%3)+randomX1];
      randomNum[i][3*(j%3)+randomX1] = randomNum[i][3*(j%3)+randomX2];
      randomNum[i][3*(j%3)+randomX2] = index;
    }
  }
}

void printSudoku(int[][] num,String str)
{
  println(str+"\n");
  for(int y=0; y<9; y++)
  {
    for(int x=0; x<9; x++)
    {
      print(num[y][x]+",");
    }
    println();
  }
}
