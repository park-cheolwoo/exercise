import random

r_num = random.randint(1,100)
answer_list = []
cnt = 0

for i in range(10):
  print(f"{i+1}번째 도전입니다.")
  answer = int(input("1부터 100 사이의 정수를 입력하세요. >> "))
  answer_list.append(answer)
  if answer < r_num:
    cnt +=1
    print("정답은 입력하신 숫자보다 큽니다.(UP) ")
  elif answer > r_num:
    cnt +=1
    print("정답은 입력하신 숫자보다 작습니다.(DOWN)")
  elif answer == r_num:
    print(f"정답입니다. 정답은 {r_num} 입니다.")
    cnt = 0
    break
if cnt == 10:
  print(f"10번 도전에 실패하셨습니다. 정답은 {r_num} 입니다.")
  print(f"입력하신 숫자들은 {answer_list}입니다.")