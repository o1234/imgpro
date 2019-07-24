#!/sr/bin/env python
# -*- coding: utf-8 -*-

"""
功能：测试gensim使用，处理中文语料
时间：2016年5月21日 20:49:07
"""

from gensim.models import word2vec
import logging
import pandas as pd
import jieba
import math

# 主程序
logging.basicConfig(format='%(asctime)s : %(levelname)s : %(message)s', level=logging.INFO)
sentences = word2vec.LineSentence("spit.txt")  # 加载语料
#sentences=[['a','b'],['c','d']]
model = word2vec.Word2Vec(sentences, min_count=1,size=300)  # default min_count=5,size=100,workers=1
print(model)
#print(model.wv.vocab)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

# y=model.similarity('宝地','宝地')
# print(y)

# generate compare list
compareArray=[]
df=pd.read_csv('content.csv',header=0,sep='\t')

N=5 # the similarity with the top N
for index in range(0,min(len(df),N)):
	valArray=[]
	line=""
	seg_list=jieba.cut(df['push_title'][index]+(df['push_content'][index]))
	line=line.join(" ".join(seg_list))
	valArray.append(line.split(" "))

	print(str(index)+'\t'+line+'\n')

	for index in range(0,len(valArray[0])):
		compareArray.append(valArray[0][index])

# validation
df=pd.read_csv('content.csv',header=0,sep='\t')
pArray=dict()
for index in df.index:
	simiArray=[]
	line=""
	p=0
	seg_list=jieba.cut_for_search(df['push_title'][index])
	line=line.join(" ".join(seg_list))
	# simiArray.append(line.split(" "))
	seg_list=jieba.cut_for_search(df['push_content'][index])
	line=line.join(" ".join(seg_list))
	simiArray.append(line.split(" "))
	# print(len(simiArray[0]))
	for i in range(0,len(simiArray[0])):
		for j in range(0,len(compareArray)):
			if compareArray[j] in model.wv.vocab and simiArray[0][i] in model.wv.vocab:
				p = p + model.similarity(simiArray[0][i], compareArray[j])
	p = p/(len(simiArray[0])*len(compareArray))
	pArray.update({df['activity_id'][index]:p})

res=sorted(pArray.items(),key=lambda item:item[1])

with open('activitySimilarity','w',encoding='utf-8') as f:
	for key in pArray:
		print(key)
		print(pArray[key])
		f.write('R_'+str(key))
		f.write(':')
		f.write(str(pArray[key]))# normolized [0,1]
		f.write('\n')
f.close()

with open('activityCtr','w',encoding='utf-8') as f:
	for index in df.index:
		f.write('R_'+str(df['activity_id'][index]))
		f.write(':')
		f.write(str(float(df['SUM(c.click)'][index])/float(df['SUM(c.pv)'][index])))
		f.write('\n')
f.close()
"""
### citySimilarity
df=pd.read_csv('city.csv',header=0,sep=',',encoding='utf-8')
cityMap=dict()
for index in df.index:
	key=df['city'][index]
	value=int(df['count'][index])
	cityMap[key]=value



list= ['北京','上海','广州','成都','重庆','深圳','西安','杭州','昆明','南京','长沙','莱芜','郑州','厦门','天津','哈尔滨','三亚','武汉','贵阳','海口','济南','沈阳','青岛','乌鲁木齐','南宁','苏州','福州','兰州','宁波','香港','南昌','武昌','合肥','大连','石家庄','长春','珠海','大理','太原','温州','桂林','东莞','无锡','丽江','泉州','佛山','北碚','呼和浩特','惠州','嘉兴','烟台','徐州','曼谷','绵阳','常州','金华','北海','西宁','潍坊','洛阳','拉萨','银川','保定','遵义','南充','西双版纳','澳门','绍兴','咸阳','台州','柳州','乐山','宜昌','中山','湛江','衡阳','临沂','扬州','南通','秦皇岛','揭阳','东京','赣州','普吉','漳州','泰安','威海','唐山','张家界','湖州','包头','廊坊','济宁','邯郸','阜阳','首尔','九江','商丘','上饶','义乌','?'];
i=0
p=0
for city in list:
    if city in cityMap.keys():
        p = p + cityMap[city]
    i = i + cityMap[city]
print(i)
print(p)


"""

# # 计算两个词的相似度/相关程度
# y1 = model.similarity("不错", "好")
# print ("【不错】和【好】的相似度为：", y1)
# print ("--------\n")

# # 计算某个词的相关词列表
# y2 = model.most_similar("书", topn=20)  # 20个最相关的
# print ("和【书】最相关的词有：\n")
# for item in y2:
#     print (item[0], item[1])
# print ("--------\n")

# # 寻找对应关系
# print( "书-不错，质量-")
# y3 = model.most_similar(['质量', '不错'], ['书'], topn=3)
# for item in y3:
#     print (item[0], item[1])
# print ("--------\n")

# # 寻找不合群的词
# y4 = model.doesnt_match("书 书籍 教材 很".split())
# print ("不合群的词：", y4)
# print ("--------\n")

# # 保存模型，以便重用
# model.save("书评.model")
# # 对应的加载方式
# # model_2 = word2vec.Word2Vec.load("text8.model")

# # 以一种C语言可以解析的形式存储词向量
# model.save_word2vec_format("书评.model.bin", binary=Tre)
# # 对应的加载方式
# # model_3 = word2vec.Word2Vec.load_word2vec_format("text8.model.bin", binary=Tre)

# if __name__ == "__main__":
#     pass
