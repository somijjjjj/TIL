# https://cloudstudying.kr/challenges/153

class Stack():
    def __init__(self):
        self.stack = []
    
    def __len__(self):
        return len(self.stack)
        
    def push(self, data):
        self.stack.append(data)
        
    def pop(self):
        pop_object = None
        if self.empty():
            print("Stack is Empty")
        else:
            pop_object = self.stack.pop()
            
        return pop_object
            
    def empty(self):
        is_empty = False
        if len(self.stack) == 0:
            is_empty = True
        return is_empty


numbers = [4, 2, 0, 5, 6, 1, 3]

stack = Stack()

for i in numbers:
    stack.push(i)


sortedStack = Stack()
while stack.empty() == False :
    max = stack.pop()
    arr = []

    for i in range(stack.__len__()) :
        num = stack.pop()

        if num > max :
            arr.append(max)
            max = num
        else :
            arr.append(num)

    sortedStack.push(max)

    for i in arr :
        stack.push(arr[i])


# 출력
print("|   |")
while sortedStack.empty() == False :
    print(f"| {sortedStack.pop()} |\n")

