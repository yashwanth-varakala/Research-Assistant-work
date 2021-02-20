import argparse
import csv
import os
import math
from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plt

import matplotlib.dates as md

import datetime as dt
import time
import xlsxwriter


import pandas as pd
from openpyxl import load_workbook

#reading the file
df=pd.read_csv('quaternion2euler_final3.csv',encoding='utf-8' ).fillna(0)


#assigning variables to the required columns(ELBOW)
x=df['Time_stamp'].iloc[0:544]
y=df['Elbow_Roll'].iloc[0:544]
z=df['Elbow_pitch'].iloc[0:544]
a=df['Elbow_Yaw'].iloc[0:544]

#plotting the euler angles
Elbow1=plt.figure()
ax= Elbow1.add_subplot(111)
plt.xlabel("Time stamp")
plt.ylabel("Euler angles")
plt.suptitle('"ELBOW Euler angles" Roll- Green' )
ax.plot(x,y,"g")

Elbow1=plt.figure()
ax2= Elbow1.add_subplot(111)
plt.xlabel("Time stamp")
plt.ylabel("Euler angles")
plt.suptitle('"ELBOW Euler angles" Pitch - Red ')

ax2.plot(x,z,"r")


Elbow1=plt.figure()
ax3= Elbow1.add_subplot(111)
plt.xlabel("Time stamp")
plt.ylabel("Euler angles")
plt.suptitle('"ELBOW Euler angles"  Yaw - yellow')

ax3.plot(x,a,"y")





#assigning variables to the required columns(Wrist)
w1=df['wrist_roll'].iloc[0:544]
w2=df['wrist_pitch'].iloc[0:544]
w3=df['wrist_yaw'].iloc[0:544]

wrist=plt.figure()
ax1= wrist.add_subplot(111)
plt.xlabel("Time stamp")
plt.ylabel("Euler angles")
plt.suptitle('"Wrist Euler angles" Roll- Green ')
ax1.plot(x,w1,"g")



wrist=plt.figure()
ax12= wrist.add_subplot(111)
plt.xlabel("Time stamp")
plt.ylabel("Euler angles")
plt.suptitle('"Wrist Euler angles"  Pitch - Red ')

ax12.plot(x,w2,"r")

wrist=plt.figure()
ax13= wrist.add_subplot(111)
plt.xlabel("Time stamp")
plt.ylabel("Euler angles")
plt.suptitle('"Wrist Euler angles"  Yaw - yellow')
ax13.plot(x,w3,"y")
plt.show()












