from splinter import Browser
from bs4 import BeautifulSoup
import pandas as pd
import time

def init_browser():
    executable_path = {'executable_path':'chromedriver.exe'}
    return Browser('chrome', **executable_path, headless=False)



def scrape_info():
    browser = init_browser()

    url = 'https://www.wholefoodsmarket.com/stores/list'
    browser.visit(url)
    browser.reload()

    html = browser.html
    soup = BeautifulSoup(html, 'html.parser')
    full_address_list = []

    for y in range(101):
        temp_address_list= soup.find_all('div', class_='storefront-address')
        x = 0

        for entry in temp_address_list:
            try:
                store_address_1 = soup.find_all('div', class_='street-block')[x].text
                store_address_2 = soup.find_all('div', class_='addressfield-container-inline locality-block country-US')[x].text 
                address_block = store_address_1 + " " + store_address_2
                full_address_list.append(address_block)
                x+=1
            except:
                x+=1
        browser.click_link_by_href(f'/stores/list?page={y+1}')
        html = browser.html
        soup = BeautifulSoup(html, 'html.parser')
        time.sleep(1)

    wholefoods_address = {
        "Address":full_address_list
    }
    print(full_address_list)
    browser.quit
    return wholefoods_address