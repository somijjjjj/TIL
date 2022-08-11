# 백준 No. 

import sys
input = sys.stdin.readline

n = int(input()) # 추 개수

weight = list(map(int, input().split())) # 추 무게

for i in range(len(weight)):
    min_num = i
    for j in range(i+1, len(weight)):
        if weight[min_num] > weight[j]:
            min_num = j
    
    weight[i], weight[min_num] = weight[min_num], weight[i]

result = 1
for i in weight :
    if result < i :
        break
    result += i

print(result)