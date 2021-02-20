import argparse
import csv
import os
import math
from mpl_toolkits import mplot3d
import numpy as np
import matplotlib.pyplot as plot

import pandas as pd
from openpyxl import load_workbook





def quaternion_to_euler_angle_X(w, x, y, z): #function for the Euler_X
    ysqr = y * y

    t0 = +2.0 * (w * x + y * z)
    t1 = +1.0 - 2.0 * (x * x + ysqr)
    X = math.degrees(math.atan2(t0, t1))
    #print("\tEuler_X=", X)
    return  X


def quaternion_to_euler_angle_Y(w, x, y, z): #function for the Euler_Y
    t2 = +2.0 * (w * y - z * x)
    t2 = +1.0 if t2 > +1.0 else t2
    t2 = -1.0 if t2 < -1.0 else t2
    Y = math.degrees(math.asin(t2))
    #print("\tEuler_Y=", Y)
    return  Y

def quaternion_to_euler_angle_Z(w, x, y, z): #function for the Euler_Z
    ysqr= y*y
    t3 = +2.0 * (w * z + x * y)
    t4 = +1.0 - 2.0 * (ysqr + z * z)
    Z = math.degrees(math.atan2(t3, t4))

    #print("\tEuler_Z=",Z)

    return  Z







df=pd.read_csv('elbow_wrist_rotations.csv')




a= range(0,543,1)  #from first row to last row



for i in a:


   
   a1=df['Elbow_rotation_w'][i] #elbow rotation_w is stored in a1
   a2=df['Elbow_rotation_x'][i] #elbow rotation_x is stored in a2
   a3=df['Elbow_rotation_y'][i] #elbow rotation_y is stored in a3
   a4=df['Elbow_rotation_z'][i] #elbow rotation_z is stored in a4

   print("Elbow_euler_x=", quaternion_to_euler_angle_X(a1,a2 ,a3,a4 ),"\tElbow_euler_y=", quaternion_to_euler_angle_Y(a1,a2 ,a3,a4 ),"\tElbow_euler_z=", quaternion_to_euler_angle_Z(a1,a2 ,a3,a4 ))
       
   
   b1=df['Wrist_rotation_w'][i] #wrist rotation_w is stored in b1
   b2=df['Wrist_rotation_w'][i] #wrist rotation_w is stored in b2
   b3=df['Wrist_rotation_w'][i] #wrist rotation_w is stored in b3
   b4=df['Wrist_rotation_w'][i] #wrist rotation_w is stored in b4

   print("wrist_euler_x=", quaternion_to_euler_angle_X(b1,b2 ,b3,b4 ),"\twrist_euler_y=", quaternion_to_euler_angle_Y(b1,b2 ,b3,b4 ),"\twrist_euler_z=", quaternion_to_euler_angle_Z(b1,b2 ,b3,b4 ))
   






   
