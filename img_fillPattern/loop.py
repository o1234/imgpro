import subprocess
import sys

def str_count(str):
    count=0
    for s in str:
        if '\u4e00' <= s <= '\u9fff':
            #print(s,end='\t')
            count+=1
    return count

def fillCityPrice(SRS,slogon,city,arrCity,depCity,discount,price,lenghOfdepCity=2,off_w=40,off_h=205,pointsize=100,distance=255):
    try:
        print(lenghOfdepCity)
        print(SRS+'A'+off_w+'A'+off_h+'A'+pointsize+'A'+distance+'A'+slogon+'A'+city+'A'+'A'+arrCity+'A'+depCity+'A'+discount+'A'+price+'A'+lenghOfdepCity)
        args=[r"C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\powershell.exe",
            "-ExecutionPolicy",
            "Unrestricted", 
            r"C:\\Users\\sonia.wang\\Pictures\\line_05.ps1",SRS,off_w,off_h,pointsize,distance,slogon,city,arrCity,depCity,discount,price,lenghOfdepCity]
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


if __name__=="__main__":
    #python中的sys.argv[1]
    path="C:\\Users\\sonia.wang\\Pictures\\"
    print(len(sys.argv))
    with open(path+'plane_discount_20190716.txt',encoding='utf-8') as f:
        for line in f:
            items=line.split('\t')
            depCity=items[0]
            arrCity=items[1]
            discount=items[2]
            price=items[3].replace('\n','')
            targetCity="西安"
            targetCity_="xn"
            targetSlogon="千年古都"
            targetImg="xn00_2.06.jpg"
            if arrCity == targetCity:
               #print(line)
               lenghOfdepCity = str_count(depCity)
               #tj: 40 205 100 255 在云端坐摩天轮 tj01
               #bj: 120 205 100 255 遇见紫禁城 bj01
               #hai: 40 185 100 255 奔向阳光海浪 hai06
               #km: 40 185 100 255 "#1b3858" 邂逅滇池 km02
               #sh: 40 185 100 125 迪士尼浪漫之行 sh012
               #yc: 40 185 100 255 探索西部风情 yc05
               #hz: 40 185 100 255 "#1b3858" hz09
               #xn: 40 185 100 255 "#2c1913" 千年古都 xn00
               fillCityPrice(path+targetImg,targetSlogon,targetCity_,targetCity,depCity,discount,price,lenghOfdepCity=str(lenghOfdepCity),
                            off_w=str(40),off_h=str(185),pointsize=str(100),distance=str(255))




    