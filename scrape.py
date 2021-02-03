#!/usr/bin/python

from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
import mysql.connector

SCRAPE_URL = 'https://eintaxid.com'

DB_HOST = 'localhost'
DB_NAME = 'scrape_companies'
DB_USERNAME = 'scrape_companies'
DB_PASSWORD = 'scrape_companies'

# letters generated with print(list(string.ascii_lowercase))
DICTIONARY = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

COLUMNS = [
	'name',
	'ein',
	'doing_business_as',
	'type_of_business',
	'phone',
	'address',
	'city',
	'state',
	'zip',
	'mailing_address',
	'mailing_address_2',
	'mailing_city',
	'mailing_state',
	'mailing_zip',
	'cik',
	'end_of_fiscal_year',
	'incorporation_state',
	'incorporation_sub_division ',
	'incorporation_country',
]

class Database:
    def __init__(self):
        self.db = mysql.connector.connect(
            host = DB_HOST,
            user = DB_USERNAME,
            password = DB_PASSWORD,
            database = DB_NAME
        )

    def insertCompany(self, data):
        sqlColumns = ''
        sqlData = ''

        for i in range(0, len(COLUMNS)):
            if i > 0:
                sqlColumns += ', '
                sqlData += ', '
            sqlColumns += COLUMNS[i]
            sqlData += '\'' + data[i].replace('\'', '\\\'') + '\''

        sql = 'INSERT INTO companies (' + sqlColumns + ') VALUES (' + sqlData + ')';
        cursor = self.db.cursor()
        cursor.execute(sql)
        self.db.commit()
        cursor.close()

class Scraper:
    def __init__(self):
        chrome_options = Options()
        chrome_options.add_argument("--headless")
        self.chrome = webdriver.Chrome(options=chrome_options)

        self.db = Database()

    def scrape(self):
        for keyword in DICTIONARY:
            self.search(keyword)

        self.chrome.quit()

    def search(self, keyword):
        print('Start scrape for companies starting with letter ' + keyword)
        page = 1
        while self.scrapeSearchPage(keyword, page):
            page += 1
        print('Finish scrape for companies starting with letter ' + keyword)

    def scrapeSearchPage(self, keyword, page):
        self.chrome.get(SCRAPE_URL + '/companies/' + keyword + '?page=' + str(page))
        elements = self.chrome.find_elements_by_xpath('//div[@class="panel panel-default pan"]//a')
        links = []
        for element in elements:
            links.append(element.get_attribute('href'))

        for a in links:
            self.scrapeCompany(a)

        return len(links) > 0

    def scrapeCompany(self, url):
        self.chrome.get(url)
        elements = self.chrome.find_elements_by_xpath('//table//td')

        data = []

        for element in elements:
            data.append(element.text)

        self.db.insertCompany(data)

def main():
    scraper = Scraper()
    scraper.scrape()

if __name__ == '__main__':
    main()
