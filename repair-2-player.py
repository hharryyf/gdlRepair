from clyngor import ASP, solve
import sys
def log_encoding(inputfile, opponent, outfile):
    f = open(outfile, 'w')
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
            print(f'does({opponent}, {moveL[j]}, 3, T) :- ', end='', file=f)
            for k in range(0, tol):
                if ((i >> k) & 1) == 0:
                    print('not ', end='', file=f)
                if k == tol - 1:
                    if i == 0:
                        print(f'moveL({k+1}' + ', T), ' + f'legal({opponent}, {moveL[j]}, 3, T), not terminated(3, T).', file=f)
                    else:
                        print(f'moveL({k+1}' + ', T), ' + f'legal({opponent}, {moveL[j]}, 3, T), not terminated(3, T).', file=f)
                else:
                    print(f'moveL({k+1}' + ', T), ', end='', file=f)
        j += 1
    
    print(file=f)
    f.close()


if len(sys.argv) != 6:
    print('Usage: python repair-2-player.py [game-name] [horizon] [current player] [opponent] [outputfile]')
    exit(1)

log_encoding(sys.argv[1], sys.argv[4], sys.argv[1].replace('.lp', '-log-encoding.lp'))
