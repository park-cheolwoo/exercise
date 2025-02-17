input = list(input().split())  # 734 893
print("input : ",input)
for i in range(2): # 2회
    s = input[i]
    input[i] = s[2] + s[1] +s[0]
print(input)
