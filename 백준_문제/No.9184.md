# No.9184 신나는 함수 실행
https://www.acmicpc.net/problem/9184

<br>
<br>

# 문제

다음과 같은 재귀함수 w(a, b, c)가 있다.
```
if a <= 0 or b <= 0 or c <= 0, then w(a, b, c) returns:
    1

if a > 20 or b > 20 or c > 20, then w(a, b, c) returns:
    w(20, 20, 20)

if a < b and b < c, then w(a, b, c) returns:
    w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)

otherwise it returns:
    w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
```

위의 함수를 구현하는 것은 매우 쉽다. 하지만, 그대로 구현하면 값을 구하는데 매우 오랜 시간이 걸린다. (예를 들면, a=15, b=15, c=15)

a, b, c가 주어졌을 때, w(a, b, c)를 출력하는 프로그램을 작성하시오.

<br>

## 입력
입력은 세 정수 a, b, c로 이루어져 있으며, 한 줄에 하나씩 주어진다. 입력의 마지막은 -1 -1 -1로 나타내며, 세 정수가 모두 -1인 경우는 입력의 마지막을 제외하면 없다.

<br>

## 출력
입력으로 주어진 각각의 a, b, c에 대해서, w(a, b, c)를 출력한다.

<br>

## 제한
-50 ≤ a, b, c ≤ 50

<br>

# 풀이

```python
import sys
input = sys.stdin.readline


def w(a,b,c):

    if a <= 0 or b <= 0 or c <= 0 :
        return 1

    if a > 20 or b > 20 or c > 20 :
        return w(20, 20, 20)

    # 이미 값이 존재하면 바로 리턴
    if dp[a][b][c]:
        return dp[a][b][c]

    if a < b < c :
        dp[a][b][c] = w(a, b, c-1) + w(a, b-1, c-1) - w(a, b-1, c)
        return dp[a][b][c]

    dp[a][b][c] = w(a-1, b, c) + w(a-1, b-1, c) + w(a-1, b, c-1) - w(a-1, b-1, c-1)
    return dp[a][b][c]

# 20보다 클 경우 모두 20으로 맞추기때문에 최대 20까지 공간을 만든다.
dp = [[[0]*(21) for _ in range(21)] for _ in range(21)]


while True :

    a, b, c = map(int, input().split())

    if a == -1 and b == -1 and c == -1 :
        break

    print(f'w({a}, {b}, {c}) = {w(a,b,c)}')
```
