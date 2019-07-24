import numpy as np
import cv2
from matplotlib import pyplot as plt
import sys
import subprocess

def calCenterPos(img):
    #orb算法
    orb = cv2.ORB_create()
    kp= orb.detect(img,None)#des是描述子
    #surf算法
    # surf = cv2.xfeatures2d.SURF_create()
    # kp = surf.detect(img,None)#des是描述子
    #fast算法
    # fast=cv2.FastFeatureDetector_create()#获取FAST角点探测器
    # kp=fast.detect(img,None)#描述符
    #sift算法
    # sift = cv2.xfeatures2d.SIFT_create()
    # kp = sift.detect(img,None)#des是描述子    
    i=0
    center_x=0
    center_y=0
    for kp_ in kp:
        point=kp_.pt
        x = (point[0])
        y = (point[1])
        center_x = center_x + x
        center_y = center_y + y
        i=i+1
    center_x = center_x/i
    center_y = center_y/i
    return center_x,center_y,kp

def crop(SRS,format,off_w,off_h,fix_=0):
    try:
        print(SRS)
        print(format)
        print(off_w)
        print(off_h)
        args=[r"C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "-ExecutionPolicy",
            "Unrestricted", 
            r"C:\\Users\\sonia.wang\\Pictures\\crop.ps1",SRS,format,off_w,off_h,fix_]
        p=subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        # dt=p.stdout.read()
        output,error = p.communicate()
        rc = p.returncode
        print(output)
        print(error)
        print(rc)
        print(type(output))
        output_ = str(output).split('\\r\\n')
        print(type(output_))
        identify = output_[0]
        imgout = output_[1].split('\\r')[0]
        print(identify)
        print(imgout)
        return imgout
    except Exception as e:
        print(e)
    

if __name__=="__main__":
    #python中的sys.argv[1]
    print(len(sys.argv))
    if len(sys.argv) > 3:
        fix_ = sys.argv[3]
    else:
        fix_ = '0'
    

    name = 'C:\\Users\\sonia.wang\\Pictures\\'+sys.argv[1]
    format = sys.argv[2]
    imgname = name+'.'+format
    img = cv2.imread(imgname,0)
    x,y,kp = calCenterPos(img)

    cv2.imshow('raw',img)
    cv2.waitKey(0)
    
    img = cv2.drawKeypoints(img,kp,img,color=(255,255,0))#画到img上面
    cv2.circle(img,(int(x),int(y)),5,(0,0,255),4)
    print("center position is: "+"\t"+str(x)+"\t"+str(y))
    print ("Total Keypoints with nonmaxSuppression: ", len(kp))#特征点个数
    cv2.imshow('sift',img)
    cv2.waitKey(0)
    #裁剪图片，fix_ 为指定比例，默认为0
    
    imgname_out = crop(name,format,str(x),str(y),fix_)

    print(imgname_out)
    img_out = cv2.imread(imgname_out,4)
    cv2.imshow(imgname_out,img_out)
    cv2.waitKey(0)

    