import requests
import pprint
from bs4 import BeautifulSoup
import json


url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
params = {
    "serviceKey": "EPhM94JT5WuG2cnWrA7xBy4Ip1zeWGD/c9StwgvLEua3LPV6Qgp9+u/q5hyyC9/tVA+L4WipZChsLpNs4obZ+w==",
    "pageNo": "1",
    "numOfRows": "10",
    "dataType": "JSON",
    "base_date": "20241210",
    "base_time": "1450",
    "nx": "55",
    "ny": "127",
}

response = requests.get(url, params=params)
datas = json.loads(response.content)
# print(datas)
data = datas['response']['body']['items']['item']
# print(data)
for i in data:
  category = i['category']
  obsrValue = i['obsrValue']
  print("카테고리 : ",category)
  print("밸류 : ",obsrValue)
print("끝")
