# python, 내장함수 format()


### 1. 포메팅 이란?
- 문자열을 이쁘게 만드는 방법
- 문자열 중간 중간에 특정 변수의 값을 넣어주기 위해 사용함

### 2. 사용법
- "{인덱스a}, {인덱스b}, {인덱스c}".format(값a, 값b, 값c)
- 예를 들어, 구구단 프로그램
    ```
    a = 2; b = 3;
    result = "구구단 {0} * {1} = {2}".format(a, b, a*b)
    print(result)
    ```
    > 구구단 2 * 3 = 6

    ### 2-1. 직접 대입
    ```
    s1 = "name : {0}".format('Jeny')
    print(s1)
    ```
    ### 2-2. 변수로 대입
    ```
    age = 0.5
    s2 = "age : {0}".format(age)
    print(s2)
    ```
    ### 2-3. 이름으로 대입
    ```
    s3 = "birthday : {bir}, gender : {gen}".format(bir=0129, gen='여')
    print(s3)
    ```
    > name : Jeny   
    age : 0.5  
    birthday : 0129, gender : 여
    
### 3. format문자열의 중괄호 인덱스 가지고 놀기

   ### 3-1. 인덱스를 입력하지 않으면?
   - format 인자 순서대로 들어감
   ```
   s4 = "name : {}, city : {}".format('Jeny', 'Busan')
   print(s4)
   ```
   ### 3-2. 인덱스 순서가 바뀌면?
   - 순서가 바뀌어도 인덱스 번호가 있기 때문에 번호에 맞는 인자값이 들어감
   ```
   s5 = "song1 : {1}, song2 : {0}".format('nunu nana', 'ice cream)
   print(s5)
   ```
   ### 3-3. 인덱스를 중복해서 입력하면?
   - 인덱스를 중복해서 입력하면 해당하는 인자 값이 들어감.
   - 인덱스 중복도 가능하다.
   ```
   s6 = "test1 : {0}, test2 : {1}, test3 : {0}".format('인덱스0','인덱스1')
   print(s6)
   ```
   > name : Jeny, city : Busan  
   song1 : ice cream, song2 : nunu nana  
   test1 : 인덱스0, test2 : 인덱스1, test3 : 인덱스0
    
    ### 3-4. format 함수 사용할 때 중괄호가 나오게 하려면?
    - 중괄호를 두번 겹치면 원래 중괄호 문자가 나옴
    - 출력할 값과 중괄호를 겹쳐서 출력하려면 세 개를 겹치면 됨
    ```
    s7 = 'Format example. {{}}, {}'.format('test')
    print(s7)
    s8 = 'This is value {{{0}}}'.format(1212)
    print(s8)
    ```
    > Format example. {}, test  
    This is value {1212}

### 4. format함수 응용

   ### 4-1. 문자열 정렬하기
   ```
   # 왼쪽 정렬
   s9 = 'this is {0:<10} | done {1:<5} |'.format('left', 'a')
   print(s9)  

   # 오른쪽 정렬
   s10 = 'this is {0:>10} | done {1:>5} |'.format('right', 'b')
   print(s10)  

   # 가운데 정렬
   s11 = 'this is {0:^10} | done {1:^5} |'.format('center', 'c')
   print(s11)
   ```
   > this is left　　　　　　| done a　　　　 |  
   this is 　　　　　right | done 　　　　b |  
   this is 　　center 　　 | done 　　 c　　 |
   - 왼쪽 정렬 : 기호 '<'
   - 오른쪽 정렬 : 기호 '>'
   - 가운데 정렬 : 기호 '^'
   - 기호 뒤에는 자릿수
        - {0:<10} -> {0}값을 10자리로 표현하고 왼쪽 정렬할 것
        - {1:>5} -> {1}값을 5자리로 표현하고 오른쪽 정렬할 것

   ### 4-2. 문자열에 공백이 아닌 값 채우기
   ```
   # 왼쪽 정렬
   s12 = 'this is {0:-<10} | done {1:o<5} |'.format('left', 'a')
   print(s12)  

   # 오른쪽 정렬
   s13 = 'this is {0:+>10} | done {1:0>5} |'.format('right', 'b')
   print(s13)  

   # 가운데 정렬
   s14 = 'this is {0:.^10} | done {1:@^5} |'.format('center', 'c')
   print(s14)
   ```
   > this is left------ | done aoooo |  
   this is ++++right | done 0000b |  
   this is ..center.. | done @@c@@ |   
   - 기호 앞에 특정 문자를 입력하면 공백 부분이 입력한 문자열로 채워짐

   ### 4-3. 자리수와 소수점 표현하기
   ```
   # 정수 N자리
   s15 = '정수 3자리 : {0:03d}, {1:03d}'.format(12345, 12)
   print(s15)
   
   # 소수점 N자리
   s16 = '아래 2자리 : {0:0.2f}, 아래 5자리 : {1:0.5f}'.format(123.1234567, 3.14)
   print(s16)
   ```
   > 정수 3자리 : 12345, 012  
   아래 3자리 : 123.12, 아래 5자리 : 3.14000
   - 정수의 자리수를 표현할 때 : "0Nd" 
   - 소수점 자리수를 표현할 때 : "0.Nf"
     - N은 원하는 자릿수 입력하면 되고, 자릿수가 부족한 경우 자동으로 0이 채워짐

