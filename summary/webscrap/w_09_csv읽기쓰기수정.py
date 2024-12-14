# 읽기
import csv

f = open("example.csv", "r")
rdr = csv.reader(f)

for line in rdr:
    print(line)

f.close()

# ----
# 쓰기
f = open("write.csv", "w", newline="\n") # newline에 줄바꿈 "\n" 을 추가해야 줄바꿈 처리됨
wr = csv.writer(f)
wr.writerow([1, "홍길동", "부산"])
wr.writerow([2, "유관순", "서울"])

f.close()

# ---
# 수정
f = open("write.csv", "a", newline="")
wr = csv.writer(f)
wr.writerow([3, "이순신", "강원"])

f.close()
