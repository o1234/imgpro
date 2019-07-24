# encoding=utf-8
import jieba
import os
import pandas as pd
import math
""" eg
seg_list = jieba.cut("我来到北京清华大学", cut_all=True)
print("Full Mode: " + "/ ".join(seg_list))  # 全模式

seg_list = jieba.cut("我来到北京清华大学", cut_all=False)
print("Default Mode: " + "/ ".join(seg_list))  # 精确模式

seg_list = jieba.cut("他来到了网易杭研大厦")  # 默认是精确模式
print(", ".join(seg_list))

seg_list = jieba.cut_for_search("小明硕士毕业于中国科学院计算所，后在日本京都大学深造")  # 搜索引擎模式
print(", ".join(seg_list))
"""
df=pd.read_csv('content.csv',header=0,sep='\t')
# df=pd.DataFrame(columns=['pinlv','title','content'])
# with open("content.csv",encoding='UTF-8') as file:
# 	for line in file:
# 		print( line)
# 		df=df.append(line.split(','))
# 		print(df.describe())
print(df[:3])

gen=pd.DataFrame(columns=['push_title','push_content']) #to do

with open('spit.txt','w',encoding='utf-8') as f:
	for index in df.index:
		loops=int(float(df['ctr'][index])*100000)
		print(loops)
		for i in range(loops):
			#seg_list=jieba.cut(df['push_title'][index],cut_all=True)
			seg_list=jieba.cut(df['push_title'][index])
			f.write(" ".join(seg_list)+' ')
			# seg_list=jieba.cut(df['push_content'][index],cut_all=True)
			seg_list=jieba.cut(df['push_content'][index])
			f.write(" ".join(seg_list)+'\n')
		
	
f.close()



