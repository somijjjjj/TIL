# 백준 No. 저울

import sys
input = sys.stdin.readline

N = int(input()) 
nums= [ int(input()) for _ in range(N) ] 

# Bubble Sort
for i in range(len(nums)): 
    for j in range(len(nums)-1) :
        if nums[j] > nums[j+1]: # 0값이 1값보다 더 크면
            # tmp = nums[j # 임시저장
            nums[j], nums[j+1] = nums[j+1], nums[j] # 1값을 0값 자리 교체

print("정렬~")
for n in nums: # 출력
    print(n)