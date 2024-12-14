students = [
    [1, "홍길동", 100, 100, 99],
    [2, "유관순", 100, 100, 99],
    [3, "이순신", 100, 100, 99],
    [4, "강감찬", 100, 90, 99],
    [5, "김구", 90, 90, 99],
]

#합계,평균 추가
for s in students: # s: students 내 1개 리스트(학생 1명)
  sum=s[2]+s[3]+s[4]
  s.append(sum)
  avg=sum/3
  s.append(avg)

#찾아서 있으면 있습니다 없으면 없습니다 출력
search = input("학생 이름을 입력하세요.")
count = 0
for s in students:
  if search == s[1]:
    print(f"학생이 있습니다. 번호는 {s[0]} 입니다.")
    count = 1
    break
if count == 0: #if를 따로 쓰지 않는 경우 학생이 없다는 메시지가 여러개 출력됨
  print("학생이 없습니다. 다시 시도해주세요")