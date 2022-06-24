# List Comprehension 

- 파이썬에서 리스트를 한 줄의 코드로 손쉽게 만들 수 있는 문법

### for문을 사용하는 경우
```
numbers = []
for i in range(1,11):
  numbers.append(i)

print(numbers)
# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
- 빈 리스트를 생성하여 iterable 한 객체의 요소를 반복
- 빈리스트에 결과를 추가하는 과정

### list comprehension을 이용하는 경우
```
numbers = [i for i in range(1,11)]
print(numbers)

# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
- 가장 기본적인 형태 
- [expression for element in iterable]

### 조건문이 추가된 list comprehension
```
numbers = [i for i in range(1,11) if i%2 == 1]
print(numbers)

# [1, 3, 5, 7, 9]
```
- 조건문이 추가된 형태
- [expression for element in iterable if conditon]

### 중복표현
- 내부에서 for 키워드와 if 키워드를 몇번이고 반복할 수 있음
```
>>> [ (x, y) for x in ['쌈밥', '치킨', '피자'] for y in ['사과', '아이스크림', '커피']]
[('쌈밥', '사과'),
 ('쌈밥', '아이스크림'),
 ('쌈밥', '커피'),
 ('치킨', '사과'),
 ('치킨', '아이스크림'),
 ('치킨', '커피'),
 ('피자', '사과'),
 ('피자', '아이스크림'),
 ('피자', '커피')]
```

---

# dictionary comprehension
```
>>> students = ['철수', '영희', '길동', '순희']
>>> { student: 0 for student in students }
{'철수': 0, '영희': 0, '길동': 0, '순희': 0}
```
- 중괄호를 이용하면서 ```key:value``` 형태로 내용을 채우면 ```dict``` 만들 수 있음
- dict comprehension 을 이용하여 기존 dict데이터를 새롭게 변경 가능
```
scores = {'철수': 50, '영희': 80, '길동': 90, '순희': 60, '전학생': 100}
scores = { name: score for name, score in scores.items() if name != '전학생'}
print(scores)
# {'길동': 90, '순희': 60, '영희': 80, '철수': 50}

grades = { name: 'PASS' if value > 70 else 'No-PASS' for name, value in scores.items()}
print(grades)
# {'길동': 'PASS', '순희': 'No-PASS', '영희': 'PASS', '철수': 'No-PASS'}
```
