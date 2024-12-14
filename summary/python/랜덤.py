import random # import문 사용시 random과 같은 파일명 사용하면 안됨.
r_num = random.randint(0,100)
count = 0
# for문


# for i in range(10):
#   print(f"{i+1}번째 도전입니다.")
#   ans  = int(input("1부터 100까지의 숫자를 입력하세요."))
#   if r_num < ans:
#     print("정답은 입력하신 값보다 작습니다.")
#   elif r_num > ans :
#     print("정답은 입력하신 값보다 큽니다.")
#   else:
#     print(f"정답입니다. 정답은 {r_num}입니다.")
#     count = 1
#     break
# if count == 0:
#   print(f"10번 도전에 실패하셨습니다. 정답은 {r_num}입니다.")


# while문
# i=0
# while (i<10):
#   print(f"{i+1}번째 도전입니다.")
#   ans  = int(input("1부터 100까지의 숫자를 입력하세요."))
#   if r_num < ans:
#     print("정답은 입력하신 값보다 작습니다.")
#     i+=1
#   elif r_num > ans :
#     print("정답은 입력하신 값보다 큽니다.")
#     i+=1
#   else:
#     print(f"정답입니다. 정답은 {r_num}입니다.")
#     count = 1
#     break
# if count == 0:
#   print(f"10번 도전에 실패하셨습니다. 정답은 {r_num}입니다.")