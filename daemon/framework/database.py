#!/usr/bin/python2
# Author: Abdelrahman Helaly
# Contact: < AH3laly@gmail.com , https://Github.com/AH3laly >
# Project: WebHosting Provider System. 
# License: Science not for Monopoly.


import mysql.connector
import framework as F

class database:
    conn = False
    cur = False

    def __init__(self):
        self.conn = False
        self.cur = False

    def connect(self,config):
        try:
	    F.log('Connected To Database','Notice',True)
            self.conn = mysql.connector.connect(**config)
            self.cur = self.conn.cursor()
        except Exception, err:
            F.log('Database Connect Error: '+err.msg,'error',True)
            return False

    def execute(self,query,params = ()):
        try:
            self.cur.execute(query,params)
            return self.cur
        except mysql.connector.Error as err:
            F.log('Executing Query Error: ' + err.msg + ' Query: ' + query ,'error',True)
            return False

    def commit(self):
        try:
            self.conn.commit()
            return True
        except Exception, err:
            F.log('Database Commit Error: '+err.msg,'error',True)
            return False

    def disconnect(self):
        try:
	    F.log('DisConnected From Database','Notice',True)
            self.conn.close()
        except Exception, err:
            F.log('Database Close Error: '+err.msg,'error',True)
            return False

