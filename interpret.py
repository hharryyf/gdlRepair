import sys

if len(sys.argv) != 2:
    print('Usage python interpert.py [path-to-the-qdo-file]')
    exit(1)
file = sys.argv[1]
f = open('out.qasp2qbf', 'r')
good = {}
for line in f:
    line = line.split()
    id = int(line[0])
    if line[1][:9] == 'add_body(' or line[1][:12] == 'remove_body(' or line[1][:12] == 'remove_head(' or line[1][:9] == 'add_head(':
        good[id] = line[1].strip()

f.close()

f = open(file, 'r')
for line in f:
    line = line.split()
    if len(line) == 0:
        continue
    if line[0] == 'V':
        if int(line[1]) in good:
            print(good[int(line[1])])

f.close()
