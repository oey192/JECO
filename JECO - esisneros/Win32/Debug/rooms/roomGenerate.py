

def padStr(string):
    string = str(string)
    if len(string) == 1:
        string = '0' + string
    return string

pref = raw_input("Enter the building prefix ")
numFloors = 0
while numFloors < 1:
    try:
        numFloors = input("Enter the number of floors ")
    except Exception, e:
        print "You must enter an integer"
    if numFloors < 1:
        print "You must a number larger than 0"

outf = file(pref.lower() + '.txt', 'w')
pref = pref.upper()

numPerFloor = []

for i in range(0, numFloors):
    numPerFloor.append(0)
    while numPerFloor[i] < 1:
        try:
            numPerFloor[i] = input("Enter the highest room number for floor " + str(i + 1) + ' ')
        except Exception, e:
            print "You must enter a valid number"

for i in range(0, numFloors):
    for roomNum in range(0, numPerFloor[i] + 1):
        outf.write(pref + str(i) + padStr(roomNum) + '\n')
