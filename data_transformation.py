source_address = 'a4|5e|60|b9|e8|4d'  # the source address of the computer used to capture data
file_path = 'data/Wikipedia1.txt'  # the path of txt file which is needed to transform
def hexstr_to_int(hexstr):
    index = 1
    int_num = 0
    for dig in hexstr:
        if ord(dig) < 97:
            int_num = int_num + pow(16, len(hexstr) - index) * (ord(dig) - 48)
        else:
            int_num = int_num + pow(16, len(hexstr) - index) * (ord(dig) - 87)
        index = index + 1
    return int(int_num)

def data_transform(list_TLSlength):
    data_transformed = []
    for length in list_TLSlength:
        l = length
        negative = 1
        if l < 0:
            negative = -1
            l = -l
        while l >= 512:
            l = l - 512
            data_transformed.append(negative)
#         if len(data_transformed) >= 5000:
#             break
    return data_transformed
TLSlength = []
with open(file_path) as f:
    p = 0
    first_line = False
    for line in f.readlines():
        p = p + 1
        if p == 100000:
            break
        if line[-6:-1] == 'ETHER':
            first_line = True
            continue
        elif first_line == True:
            nega = -1
            if '|17|03|03|' in line:
                first_part = line.split('|17|03|03|')[0]
                
                if first_part[24:41] == source_address:
                    nega = 1

                second_part = line.split('|17|03|03|')[1]
                list_nums = second_part.split('|')[0:2]

                first_line = False
                if len(list_nums) == 2:
                    TLSlength.append(nega * hexstr_to_int(list_nums[0] + list_nums[1]))
        else:
            continue
datad = data_transform(TLSlength)
print(datad)
print(len(datad))
