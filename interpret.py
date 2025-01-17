f = open('out.qasp2qbf', 'r')
good = {}
for line in f:
    line = line.split()
    id = int(line[0])
    if line[1][:9] == 'add_body(' or line[1][:12] == 'remove_body(' or line[1][:12] == 'remove_head(' or line[1][:9] == 'add_head(':
        good[id] = line[1].strip()

f.close()

f = open('out.qdimacs', 'r')
for line in f:
    line = line.split()
    if line[0] == 'V':
        if int(line[1]) in good:
            print(good[int(line[1])])

f.close()
