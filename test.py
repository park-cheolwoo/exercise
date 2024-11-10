from selenium import webdriver
import time

url = 'https://www.naver.com'
browser = webdriver.Chrome()
browser.get(url)
time.sleep(3)
browser.close()

