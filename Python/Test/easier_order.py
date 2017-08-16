#!/usr/bin/python
#-*-coding:utf-8 -*-

import requests
import json
import time

dish_list = []
type_list = []
type_id_list = []
type_dish_list = []
sub_dish_list = []
dish_id_list = []

def get_data(file_name):

    print 'start read data %r', time.time()

    for line in open(file_name):
        line_list = line.split()

        if len(line_list) > 1:
            if line_list[-1] == ',':
                del line_list[-1]

            if len(line_list) > 1:
                str = line_list[-1]
                if str[-1] == ',':
                    str = str[:-1]
                    line_list[-1] = str

                if line_list[0][0] == '*':
                    del line_list[0]
                    type_list.append(line_list)
                    sub_dish_list = []
                    type_dish_list.append(sub_dish_list)
                else:
                    del line_list[0]
                    if  sub_dish_list == None:
                        sub_dish_list = []
                    else:
                        sub_dish_list.append(line_list)

                dish_list.append(line_list)

    print 'read data finish %r', time.time()

def post_types(type_id_file_name):

    for type in type_list:
        type_name = ''
        for str in type:
            type_name = type_name + ' ' + str

        url = 'http://www.easierorder.com:3080/api/v1/res/addFoodType'
        add_type_payload = {
            'email': 'sichuan@order.com',
            'foodType': {
                'sortNum': 0,
                'name': type_name
            },
            'token': 'c5771a76-51a2-4e3d-ad25-13845c383d1e',
        }

        headers = {'content-type': 'application/json'}
        request = requests.post(url, data=json.dumps(add_type_payload), headers = headers)
        json_content = request.content
        content = json.loads(json_content)
        body = content.get('body')
        type_id = body.get('_id')
        type_id_list.append(type_id)

        file = open(type_id_file_name, 'a')
        file.write("%s\n" %type_id)
        file.close()
        pass

def post_dishes(dish_id_file_name='dishid.txt', type_id_file_name = 'typeid.txt'):

    type_id_list = []

    print 'start post dishes %r', time.time()

    dish_dic_list = []

    with open(type_id_file_name) as f:
        for line in f:
            line = line.strip('\n')
            type_id_list.append(line)

    for index in range(len(type_dish_list)):
        sub_dishes = type_dish_list[index]
        for dish in sub_dishes:
            dish_dic = {'name' : '', 'typeid' : type_id_list[index] ,'price' : ''}

            if dish[-1] == 'M/P':
                dish_dic['price'] = '0'
            else:
                dish_dic['price'] = dish[-1]

            dish_dic['price'] = float(dish_dic['price'])
            del dish[-1]
            dish_name = ''
            for str in dish:
                 dish_name = dish_name + ' ' + str
            dish_dic['name'] = dish_name
            dish_dic_list.append(dish_dic)

    for dish_dic in dish_dic_list:

        url = 'http://www.easierorder.com:3080/api/v1/res/addFood'
        add_type_payload = {
            "email": "sichuan@order.com",
            "token": "c5771a76-51a2-4e3d-ad25-13845c383d1e",
            "food": {
                "picUrl": "",
                "sortNum": 0,
                "foodTypeID": dish_dic['typeid'],
                "state": "on",
                "openTime": [],
                "hotDegree": 0,
                "price": dish_dic['price'],
                "name": dish_dic['name'],
                "desc": ""
            }
        }

        headers = {'content-type': 'application/json'}
        request = requests.post(url, data=json.dumps(add_type_payload), headers = headers)
        json_content = request.content
        content = json.loads(json_content)
        msg_code = content.get('msgCode')

        if msg_code != 512:#不重复
            body = content.get('body')
            dish_id = body.get('_id')
            dish_id_list.append(dish_id)
            print 'dish id:', dish_id
            file = open(dish_id_file_name, 'a')
            file.write("%s\n" % dish_id)
            file.close()

    print 'post dishes finish %r', time.time()

def close_dish(dish_id_file_name):

    print 'start close dishes %r', time.time()

    close_dish_id_list = []

    with open(dish_id_file_name) as f:
        for line in f:
            line = line.strip('\n')
            close_dish_id_list.append(line)

    for dish_id in close_dish_id_list:

        url = 'http://www.easierorder.com:3080/api/v1/res/offFood'
        add_type_payload = {
            "email": "sichuan@order.com",
            "token": "c5771a76-51a2-4e3d-ad25-13845c383d1e",
            "_id": dish_id
        }

        headers = {'content-type': 'application/json'}
        request = requests.post(url, data=json.dumps(add_type_payload), headers = headers)
        json_content = request.content
        content = json.loads(json_content)
        print content['msgString']

    print 'close dishes finish %r',time.time()

def del_dish(dish_id_file_name = 'dishid.txt'):

    print 'start delete dishes %r', time.time()

    close_dish(dish_id_file_name)

    del_dish_list = []
    with open(dish_id_file_name) as f:
        for line in f:
            line = line.strip('\n')
            del_dish_list.append(line)

    for dish_id in del_dish_list:

        url = 'http://www.easierorder.com:3080/api/v1/res/delFood'
        add_type_payload = {
            "email": "sichuan@order.com",
            "token": "c5771a76-51a2-4e3d-ad25-13845c383d1e",
            "_id": dish_id
        }

        headers = {'content-type': 'application/json'}
        request = requests.post(url, data=json.dumps(add_type_payload), headers = headers)
        json_content = request.content
        content = json.loads(json_content)
        print content['msgString']

    print 'delete dishes finish %r', time.time()

if __name__ == '__main__':

    file1 = 'res1.txt'
    file2 = 'res2.txt'
    get_data(file1)
    post_dishes()
    #del_dish()
