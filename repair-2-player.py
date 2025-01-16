from clyngor import ASP, solve
import sys
import os
import queue
def log_encoding(inputfile, current, opponent, horizon, outfile):
    f = open(outfile, 'w')
    print('program(sw).', file=f)
    ################ log-encoding #################
    answer = solve(inputfile, inline='#show input/2.')
    moveL = set()
    for ans in answer:
        for c in ans:
            if c[1][0] == opponent:
                moveL.add(c[1][1])
    moveL = list(moveL)
    moveL.sort()
    tol, lenl = 0, len(moveL)
    while (1 << tol) < lenl:
        tol += 1

    print(f'ldom(1..{tol}).', file=f)
    print('% log-encoding', file=f)

    j = 0
    for i in range(0, 1 << tol):
        if j < len(moveL):
            print(f'does({opponent}, {moveL[j]}, sw, T) :- ', end='', file=f)
            for k in range(0, tol):
                if ((i >> k) & 1) == 0:
                    print('not ', end='', file=f)
                if k == tol - 1:
                    if i == 0:
                        print(f'moveL({opponent}, {k+1}' + ', sw, T), ' + f'legal({opponent}, {moveL[j]}, sw, T), not terminated(sw, T).', file=f)
                    else:
                        print(f'moveL({opponent}, {k+1}' + ', sw, T), ' + f'legal({opponent}, {moveL[j]}, sw, T), not terminated(sw, T).', file=f)
                else:
                    print(f'moveL({opponent}, {k+1}' + ', sw, T), ', end='', file=f)
        j += 1
    
    print(file=f)
    print('% two player game', file=f)
    print(f"tdom(1..{horizon}).",file=f)
    print(file=f)
    print("% logarithmic encoding",file=f)
    print(f"{{moveL({opponent}, M, sw, T) : ldom(M)}} :- tdom(act,T).",file=f)
    print(file=f)
    print("% additional constraints for the GDL encoding.",file=f)
    print("terminated(sw,T) :- terminal(sw,T).",file=f)
    print("terminated(sw,T) :- terminated(sw,T-1), tdom(T).",file=f)
    print(file=f)
    print(":- does(P,M,sw,T), not legal(P,M,sw,T).",file=f)
    print(file=f)
    print("% existential and universal players must take a move at its turn",file=f)
    print("1 {does(P,M,sw,T) : input(P, M)} 1 :- not terminated(sw,T), tdom(act,T), role(P).",file=f)
    print(":- terminated(sw,T), does(P,M,sw,T).",file=f)
    print("% game must terminate",file=f)
    print(":- 0 {terminated(sw,T) : tdom(T)} 0.",file=f)
    print("% current player player must reach goal 100",file=f)
    print(f":- terminated(sw,T), not terminated(sw,T-1), not goal({current}, 100 ,sw, T).",file=f)
    print(f":- terminated(sw, 1), not goal({current}, 100 ,sw, 1).",file=f)
    f.close()

def build_quantifier(current, other, gamefile, logfile, quantifier):
    '''
        Construct the quantifier prefix of the QASP based on the encoding method GD
        specify the gamefile, the logarithmic encoding file, output to the quantifier file
    '''

    cmd = f'clingo --output=smodels repair-qbf-4.lp {gamefile} example/tic-tac-toe/win.lp {logfile}  > smodels.txt'
    os.system(f"bash -c '{cmd}'")

    outputfile = open(file=quantifier, mode='w')

    #bad = ['log_domain(', 'timedomain(', 'movetimedomain(', 'move_domain(']
    state, mxv = 0, 0
    edge = set()
    vertex, universal, exist = {}, {}, {}

    with open('smodels.txt') as f:
        for line in f:
            line = line.strip()
            if line == '0':
                state += 1
                continue
            if state == 0:
                line = list(map(int, line.split()))
                # normal rule
                # head number_of_lit number_of_neg_lit [negative lit] [positive lit]
                if line[0] == 1:
                    head = line[1]
                    for i in range(4, len(line)):
                        if line[i] == 1:
                            print('Unexpected Error')
                            exit(1)
                        edge.add((line[i], head))
                # head number_of_lit number_of_neg_lit bound [negative lit] [positive lit]
                elif line[0] == 2:
                    head = line[1]
                    for i in range(5, len(line)):
                        edge.add((line[i], head))
                # number_of_head [head] number_of_lit number_of_neg_lit [negative lit] [positive lit]
                elif line[0] == 3:
                    head_num = line[1]
                    head = []
                    for i in range(2, head_num + 2):
                        head.append(line[i])
                    # this part can be optimized
                    for i in range(head_num + 4, len(line)):
                        for h in head:
                            edge.add((line[i], h))
                else:
                    print('Cannot handle rule of type 4+ in Clingo!')
                    exit(1)
            elif state == 1:
                line = line.split()
                vid, atom = int(line[0]), line[1]
                ok = True
                #for b in bad:
                #    if atom[:len(b)] == b:
                #        ok = False
                if ok:
                    mxv = max(mxv, vid)
                    newl = atom.replace('(', ',').replace(')',',').split(',')
                    lencurr = len(f'does({current},')
                    if atom[:lencurr] != f'does({current},' and atom[:6] != 'moveL(':
                        vertex[vid] = (atom, -1)
                        continue

                    lv = -1
                    bk = -1
                    for i in range(len(newl) - 1, -1, -1):
                        if len(newl[i]) and newl[i] != '\n':
                            lv = int(newl[i])
                            bk = i
                            break
                    if newl[bk - 1] != 'sw':
                        vertex[vid] = (atom, -1)
                        continue
                    if lv != -1:
                        vertex[vid] = (atom, lv)
                        if atom[:lencurr] == f'does({current},':
                            if lv in exist:
                                exist[lv].append(vid)
                            else:
                                exist[lv] = []
                                exist[lv].append(vid)
                        elif atom[:6] == 'moveL(':
                            if lv in universal:
                                universal[lv].append(vid)
                            else:
                                universal[lv] = []
                                universal[lv].append(vid)

    for e in edge:
        mxv = max(mxv, max(e[0], e[1]))

    univ_out = []
    exist_in = []
    for univ in universal.items():
        lv = univ[0]
        univ_out.append((lv, mxv + 1))
        for uv in univ[1]:
            edge.add((uv, mxv + 1))
        mxv += 1

    for exi in exist.items():
        lv = exi[0]
        exist_in.append((lv, mxv + 1))
        for ex in exi[1]:
            edge.add((mxv + 1, ex))
        mxv += 1

    univ_out.sort()
    exist_in.sort()

    luniv, lexist = len(univ_out), len(exist_in)
    i, j = luniv - 1, lexist - 1
    while i >= 0:
        while j >= 0 and exist_in[j][0] > univ_out[i][0]:
            edge.add((univ_out[i][1], exist_in[j][1]))
            j -= 1
        i -= 1

    graph = []
    visited = []
    for i in range(0, mxv + 1):
        graph.append([])
        visited.append(-1)

    for e in edge:
        graph[e[0]].append(e[1])

    def bfs(v, uv, depth):
        q = queue.Queue()
        q.put(v)
        while q.empty() == False:
            curr = q.get()
            if visited[curr] == 1:
                continue
            if uv != curr and curr in vertex:
                print(f'_exists({depth},{vertex[curr][0]}).', file=outputfile)
            visited[curr] = 1

            for nxt in graph[curr]:
                if visited[nxt] != 1:
                    q.put(nxt)

    for i in range(luniv - 1, -1, -1):
        for uv in universal[univ_out[i][0]]:
            print(f'_forall({i * 2 + 2},{vertex[uv][0]}).', file=outputfile)
        for uv in universal[univ_out[i][0]]:
            if visited[uv] != 1:
                bfs(uv, uv, i * 2 + 3)

    for i in range(1, mxv + 1):
        if i in vertex and visited[i] != 1:
            print(f'_exists(1,{vertex[i][0]}).', file=outputfile)

    outputfile.close()


if len(sys.argv) != 6:
    print('Usage: python repair-2-player.py [game-name] [horizon] [current player] [opponent] [outputfile]')
    exit(1)

log_encoding(sys.argv[1], sys.argv[3], sys.argv[4], int(sys.argv[2]), sys.argv[1].replace('.lp', '-log-encoding.lp'))
build_quantifier(sys.argv[3], sys.argv[4], sys.argv[1], sys.argv[1].replace('.lp', '-log-encoding.lp'), sys.argv[1].replace('.lp', '-quantifier.lp'))
