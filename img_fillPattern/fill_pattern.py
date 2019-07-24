import sys
import subprocess
import os
import itertools
from scipy.special import comb, perm
import random
import my_module.my_focusCropImg as cropImg
import cv2
def mkdir(path):
    path=path.strip()
    path=path.rstrip("\\")
    isExists=os.path.exists(path)
    if not isExists:
        os.makedirs(path) 
        print (path+' 创建成功')
        return True
    else:
        print (path+' 目录已存在')
        return False
def str_count(str):
    count=0
    for s in str:
        if '\u4e00' <= s <= '\u9fff':
            #print(s,end='\t')
            count+=1
    return count
def chosenLine(depCity_unique):
    #指定出发城市，只取价格最低的目的地
    arrPrice=dict()
    for city in depCity_unique:
        arrCity_price=depCity_unique[city]
        tmp=9999
        arrTmp=dict()
        #print(city+'\t'+str(len(arrCity_price)))
        for arrCity in arrCity_price:
            discount=arrCity_price[arrCity]['discount']
            price=arrCity_price[arrCity]['price']
            #print(discount+'\t'+price)
            price=float(price)
            if  price < tmp:
                arrTmp.clear()
                arrTmp[arrCity]=arrCity_price[arrCity]
                arrPrice[city]=arrTmp
                tmp = price
    return arrPrice
def city_Img(path):
    dictImg=dict()
    with open(path,'r',encoding='utf-8') as f:
        for line in f:
            #print(line)
            line = line.strip("\n")
            items = line.split('\t')
            cityName = items[0]
            if len(items) < 2:
                continue
            imgPaths = items[1].split(',')
            if len(imgPaths) == 1:
                #dictImg[cityName]=imgPaths[0]
                continue
            randomIndex = random.randint(0,len(imgPaths)-1)
            imgPath = imgPaths[randomIndex]
            dictImg[cityName]=imgPath
    print('city site 读取结果')
    print(dictImg)
    return dictImg
def chosenImg(depCity_unique,dictImg):
    #指定出发城市，根据位置随机选取景点图
    arrImg=dict()
    for city in depCity_unique:
        arrCity_price=depCity_unique[city]
        #print(arrCity_price)
        arrTmp=dict()
        #print(city+'\t'+str(len(arrCity_price)))
        for arrCity in arrCity_price:
            if arrCity in dictImg:
                arrTmp.clear()
                arrTmp['arr']=arrCity
                arrTmp['dep']=city
                arrTmp['img']=dictImg[arrCity]
                arrImg[city]=arrTmp
            else:
                print(arrCity+'暂无图片数据，被过滤')
    return arrImg
def fillPattern1(SRS, depCity, arrCity, discount, price, Dst):
    try:
        print(SRS+"\t"+depCity+"\t"+arrCity+"\t"+discount+"\t"+price+"\t"+Dst)
        args=[r"C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "-ExecutionPolicy",
            "Unrestricted", 
            r"C:\\Users\\sonia.wang\\Pictures\\pattern\\pattern1.ps1",SRS,depCity,arrCity,discount,price,Dst]
        p=subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        # dt=p.stdout.read()
        output,error = p.communicate()
        rc = p.returncode
        print(output)
        print(error)
        print(rc)
        # print(type(output))
        # output_ = str(output).split('\\r\\n')
        # print(type(output_))
        # identify = output_[0]
        
        # return identify
    except Exception as e:
        print(e)
def fillPattern2(SRS, depCity1, arrCity1, price1, depCity2, arrCity2, price2,
                    depCity3, arrCity3, price3, depCity4, arrCity4, price4,
                    depCity5, arrCity5, price5, depCity6, arrCity6, price6, 
                    Dst):
    try:
        # print(SRS+'\t'+depCity1+'\t'+arrCity1+'\t'+price1+'\t'+depCity2+'\t'+arrCity2+'\t'+ price2+'\t'+
        #             depCity3+'\t'+ arrCity3+'\t'+ price3+'\t'+ depCity4+'\t'+ arrCity4+'\t'+ price4+'\t'+
        #             depCity5+'\t'+ arrCity5+'\t'+ price5+'\t'+ depCity6+'\t'+ arrCity6+'\t'+ price6+'\t'+
        #             Dst)
        args=[r"C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "-ExecutionPolicy",
            "Unrestricted", 
            r"C:\\Users\\sonia.wang\\Pictures\\pattern\\pattern2.ps1",
                    SRS, depCity1, arrCity1, price1, depCity2, arrCity2, price2,
                    depCity3, arrCity3, price3, depCity4, arrCity4, price4,
                    depCity5, arrCity5, price5, depCity6, arrCity6, price6, 
                    Dst]
        p=subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        # dt=p.stdout.read()
        output,error = p.communicate()
        rc = p.returncode
        print(output)
        print(error)
        print(rc)
        # print(type(output))
        # output_ = str(output).split('\\r\\n')
        # print(type(output_))
        # identify = output_[0]
        
        # return identify
    except Exception as e:
        print(e)

def fillPattern3(SRS, depCity1, arrCity1, discount1, price1, depCity2, arrCity2, discount2, price2,
                    depCity3, arrCity3, discount3, price3, depCity4, arrCity4, discount4, price4,
                    depCity5, arrCity5, discount5, price5, depCity6, arrCity6, discount6, price6, 
                    Dst):
    try:
        # print(SRS+'\t'+depCity1+'\t'+arrCity1+'\t'+price1+'\t'+depCity2+'\t'+arrCity2+'\t'+ price2+'\t'+
        #             depCity3+'\t'+ arrCity3+'\t'+ price3+'\t'+ depCity4+'\t'+ arrCity4+'\t'+ price4+'\t'+
        #             depCity5+'\t'+ arrCity5+'\t'+ price5+'\t'+ depCity6+'\t'+ arrCity6+'\t'+ price6+'\t'+
        #             Dst)
        args=[r"C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "-ExecutionPolicy",
            "Unrestricted", 
            r"C:\\Users\\sonia.wang\\Pictures\\pattern\\pattern3.ps1",
                    SRS, depCity1, arrCity1, discount1, price1, depCity2, arrCity2, discount2, price2,
                    depCity3, arrCity3, discount3, price3, depCity4, arrCity4, discount4, price4,
                    depCity5, arrCity5, discount5, price5, depCity6, arrCity6, discount6, price6, 
                    Dst]
        p=subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        # dt=p.stdout.read()
        output,error = p.communicate()
        rc = p.returncode
        print(output)
        print(error)
        print(rc)
        # print(type(output))
        # output_ = str(output).split('\\r\\n')
        # print(type(output_))
        # identify = output_[0]
        
        # return identify
    except Exception as e:
        print(e)
def fillPattern3_subImg(SRS, img1, img2, img3, Dst):
    try:
        # print(SRS+'\t'+depCity1+'\t'+arrCity1+'\t'+price1+'\t'+depCity2+'\t'+arrCity2+'\t'+ price2+'\t'+
        #             depCity3+'\t'+ arrCity3+'\t'+ price3+'\t'+ depCity4+'\t'+ arrCity4+'\t'+ price4+'\t'+
        #             depCity5+'\t'+ arrCity5+'\t'+ price5+'\t'+ depCity6+'\t'+ arrCity6+'\t'+ price6+'\t'+
        #             Dst)
        args=[r"C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "-ExecutionPolicy",
            "Unrestricted", 
            r"C:\\Users\\sonia.wang\\Pictures\\pattern\\pattern3_subimg.ps1", SRS, img1, img2, img3, Dst]
        p=subprocess.Popen(args, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        # dt=p.stdout.read()
        output,error = p.communicate()
        rc = p.returncode
        print(output)
        print(error)
        print(rc)
        # print(type(output))
        # output_ = str(output).split('\\r\\n')
        # print(type(output_))
        # identify = output_[0]
        
        # return identify
    except Exception as e:
        print(e)
def run_pattern1(path,flight_filepath):
    mkdir(path+"pattern1/")
    total=len(open(flight_filepath,'rU',encoding='utf-8').readlines())
    success=0
    filtered=0
    with open(flight_filepath,encoding='utf-8') as f:
        index=0
        for line in f:
            index +=1
            items=line.split('\t')
            depCity=items[0].replace('\n','')
            arrCity=items[1].replace('\n','')
            discount=items[2].replace('折','')
            price=items[3].replace('\n','')
            if str_count(depCity)==2 and str_count(arrCity)==2:
                
                discount=str("%1.1f" % float(discount))
                
                lenghOfdepCity = str_count(depCity)
                fillPattern1(path+"pattern1.jpg",depCity,arrCity,discount,price,path+"pattern1/")
                success +=1
                print("第"+str(index)+"/"+str(total)+"张处理完成")
            else:
                filtered +=1
                print("第"+str(index)+"/"+str(total)+"张被过滤")
    print("共生成"+str(success)+"张，"+str(filtered)+"张被过滤")
def run_pattern2(path,flight_filepath):
    mkdir(path+"pattern2/")
    total=len(open(flight_filepath,'rU',encoding='utf-8').readlines())
    success=0
    filtered=0
    depCity_unique=dict()

    airport_city_list_top = list() # key:code value:cityname

    airport = open('airport_code.txt',mode='r',encoding='utf-8')
    count = 0

    # read file
    for line in airport:
        count +=1
        city = line.split('\t')[0].rstrip()
        if count <=12: ## 只保留流量top的出发机场
            airport_city_list_top.append(city)

    with open(flight_filepath,encoding='utf-8') as f:
        index=0
        for line in f:
            index +=1
            items=line.split('\t')
            depCity=items[0].replace('\n','')
            arrCity=items[1].replace('\n','')
            discount=items[2].replace('折','')
            price=items[3].replace('\n','')
            if depCity in depCity_unique:
                value = depCity_unique[depCity]
            else:
                value = dict()
            if int(price) < 300 and str_count(depCity)==2 and str_count(arrCity)==2 and depCity in airport_city_list_top:
                print(line)
                value[arrCity]={'discount':discount,'price':price}
                depCity_unique[depCity]=value
                success +=1
                #print("第"+str(index)+"/"+str(total)+"张处理完成")
            else:
                filtered +=1
                #print("第"+str(index)+"/"+str(total)+"张被过滤")
    print("共筛选城市"+str(success)+"个")
    
    arrPrice = chosenLine(depCity_unique)#指定出发城市，只取价格最低的目的地

    # (key,value), = arrPrice['北京'].items()
    # print(key+'\t'+value)
    depCity_list=list(depCity_unique.keys())
    iter = itertools.combinations(depCity_list,6)#有序排列
    print(len(depCity_list))
    index_num = 0
    combined_num = comb(len(depCity_list),6) 
    for cities in list(iter):
        index_num +=1
        dep0=cities[0]; (arr0,value0), = arrPrice[dep0].items(); discount0 = value0['discount']; price0 = value0['price']
        dep1=cities[1]; (arr1,value1), = arrPrice[dep1].items(); discount1 = value1['discount']; price1 = value1['price']
        dep2=cities[2]; (arr2,value2), = arrPrice[dep2].items(); discount2 = value2['discount']; price2 = value2['price']
        dep3=cities[3]; (arr3,value3), = arrPrice[dep3].items(); discount3 = value3['discount']; price3 = value3['price']
        dep4=cities[4]; (arr4,value4), = arrPrice[dep4].items(); discount4 = value4['discount']; price4 = value4['price']
        dep5=cities[5]; (arr5,value5), = arrPrice[dep5].items(); discount5 = value5['discount']; price5 = value5['price']
        fillPattern2(path+"pattern2.jpg",dep0,arr0,price0,dep1,arr1,price1,dep2,arr2,price2,dep3,arr3,price3,dep4,arr4,price4,dep5,arr5,price5,path+"pattern2/")
        print("第"+str(index_num)+"/"+str(combined_num)+"张处理完成")
def run_pattern3(path,flight_filepath):
    mkdir(path+"pattern3/")
    total=len(open(flight_filepath,'rU',encoding='utf-8').readlines())
    success=0
    filtered=0
    dictImg=city_Img('cityName_imgPath.txt')
    depCity_unique=dict()
    airport = open('airport_code.txt',mode='r',encoding='utf-8')
    count = 0
    airport_city_list_top = list()
    
    ### img config
    fix_=[0.0]*3
    fix_[0] = str('%.3f' % float(378/342))
    fix_[1] = str('%.3f' % float(290/342))
    fix_[2] = str('%.3f' % float(680/342))
    pre_ImgPath = 'C:/Users/sonia.wang/Pictures/'


    # read file
    for line in airport:
        count +=1
        city = line.split('\t')[0].rstrip()
        if count <=12: ## 只保留流量top的出发机场
            airport_city_list_top.append(city)

    with open(flight_filepath,encoding='utf-8') as f:
        index=0
        for line in f:
            index +=1
            items=line.split('\t')
            depCity=items[0].replace('\n','')
            arrCity=items[1].replace('\n','')
            discount=items[2].replace('折','')
            price=items[3].replace('\n','')
            if depCity in depCity_unique:
                value = depCity_unique[depCity]
            else:
                value = dict()
            if int(price) < 300 and str_count(depCity)==2 and str_count(arrCity)==2 and depCity in airport_city_list_top and arrCity in dictImg:
                #print(line)
                value[arrCity]={'discount':discount,'price':price}
                depCity_unique[depCity]=value
                success +=1
                #print("第"+str(index)+"/"+str(total)+"张处理完成")
            else:
                filtered +=1
                #print("第"+str(index)+"/"+str(total)+"张被过滤")
    #print("共筛选城市"+str(success)+"个")
    
    #图片的位置决定图片的长宽比例
    arrImg= chosenImg(depCity_unique,dictImg)
    
    arrPrice = chosenLine(depCity_unique)#指定出发城市，只取价格最低的目的地
    depCity_list=list(depCity_unique.keys())
    print('挑选出的城市数目： '+ str(len(depCity_list)))
    iter = itertools.combinations(depCity_list,6)#有序排列
    index_num = 0
    combined_num = comb(len(depCity_list),6) 
    dep=['']*6 ;arr=['']*6 ;value=[dict()]*6 ;discount=[0.0]*6 ;price=[0]*6 
    for cities in list(iter):
        print("########  loog begin  ######### ")
        index_num +=1
        dep[0]=cities[0]; (arr[0],value[0]), = arrPrice[dep[0]].items(); discount[0] = value[0]['discount']; price[0] = value[0]['price']
        dep[1]=cities[1]; (arr[1],value[1]), = arrPrice[dep[1]].items(); discount[1] = value[1]['discount']; price[1] = value[1]['price']
        dep[2]=cities[2]; (arr[2],value[2]), = arrPrice[dep[2]].items(); discount[2] = value[2]['discount']; price[2] = value[2]['price']
        dep[3]=cities[3]; (arr[3],value[3]), = arrPrice[dep[3]].items(); discount[3] = value[3]['discount']; price[3] = value[3]['price']
        dep[4]=cities[4]; (arr[4],value[4]), = arrPrice[dep[4]].items(); discount[4] = value[4]['discount']; price[4] = value[4]['price']
        dep[5]=cities[5]; (arr[5],value[5]), = arrPrice[dep[5]].items(); discount[5] = value[5]['discount']; price[5] = value[5]['price']
        fillPattern3(path+"pattern3.jpg",dep[0],arr[0],discount[0],price[0],dep[1],arr[1],discount[1],price[1],dep[2],arr[2],discount[2],price[2],
                                        dep[3],arr[3],discount[3],price[3],dep[4],arr[4],discount[4],price[4],dep[5],arr[5],discount[5],price[5],
                                        path+"pattern3/")
        print("第"+str(index_num)+"/"+str(combined_num)+"张处理完成")
        #随机选取到达城市中的三个作为左侧素材
        raw_img_path = path+"pattern3/" + dep[0] + '_' + dep[1] + '_' + dep[2] + '_'+ dep[3] + '_' + dep[4] + '_' + dep[5] + '.jpg'
        
        arr_City_unique=dict()
        unique_tmp=dict()
        unique_i=0
        for i in range(0,6):
            if arr[i] not in unique_tmp:
                arr_City_unique[unique_i]={'arr':arr[i],'dep':dep[i]}
                unique_tmp[arr[i]]='0'
                unique_i +=1

        index_=[0]*3
        img_=['']*3

        if len(arr_City_unique) < 3:
            print('not enough input arrCities')
            continue
        print('arr_City_unique.length ==  '+str(len(arr_City_unique)))
        print(arr_City_unique)
        img_seed = random.randint(0,len(arr_City_unique)-1)
        index_[0] = (img_seed+0)%len(arr_City_unique)
        index_[1] = (img_seed+1)%len(arr_City_unique)
        index_[2] = (img_seed+2)%len(arr_City_unique)
        print('chosen 3 img index: '+str(index_[0])+'\t'+str(index_[1])+'\t'+str(index_[2]))
        print(arr_City_unique[index_[0]]['dep']+'\t'+arr_City_unique[index_[0]]['arr'])
        print(arr_City_unique[index_[1]]['dep']+'\t'+arr_City_unique[index_[1]]['arr'])
        print(arr_City_unique[index_[2]]['dep']+'\t'+arr_City_unique[index_[2]]['arr'])
        
        print(arrImg)

        img_[0] = pre_ImgPath + arrImg[arr_City_unique[index_[0]]['dep']]['img']
        img_[1] = pre_ImgPath + arrImg[arr_City_unique[index_[1]]['dep']]['img']
        img_[2] = pre_ImgPath + arrImg[arr_City_unique[index_[2]]['dep']]['img']

        

        for i in range(0,3):
            print("==== i =="+str(i) +"\t"+ str(index_[i]))
            if not os.path.exists(img_[i]):
                print('开始生成'+img_[i]+'.jpg……')
                if arr[index_[i]] in dictImg:
                    print('yes it is')
                print('从文件列表得到图片地址'+dictImg[arr[index_[i]]])
                print('从映射表得到的地址'+arrImg[dep[index_[i]]]['img'])
                x,y,kp = cropImg.calCenterPos(img_[i]+'.jpg')
                imgname_out = cropImg.crop(img_[i],'jpg',str(x),str(y),fix_[i])
                print('生产完成'+img_[i]+'.jpg')
            print("imgpath: "+img_[i])
        fillPattern3_subImg(raw_img_path, img_[0]+'_'+fix_[0]+'.jpg', img_[1]+'_'+fix_[1]+'.jpg', img_[2]+'_'+fix_[2]+'.jpg', path+'pattern3/')
        print("########  loog end  ######### ")

if __name__=="__main__":
    #python中的sys.argv[1]
    path="C:/Users/sonia.wang/Pictures/pattern/"
    print(len(sys.argv))
    filepath='./output.txt'
    run_pattern3(path,filepath)
    