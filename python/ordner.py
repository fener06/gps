#!/usr/bin/python
import time, datetime, os
from os import path

today = datetime.date.today()
todaystr = today.isoformat()
if os.path.exists(output/todaystr) == True:
	print('directory exists')
else:
	os.mkdir(output/todaystr)
	print('directory created')

