import sys
import os

if len(sys.argv) != 3 and len(sys.argv) != 4:
    print('Usage python repair-N-player-weak-gc.py [game-name] [cost bound] [optional:path to UNSAT file]')
    exit(1)
    
game = sys.argv[1]
cost = int(sys.argv[2])

if cost == -1:
    cost = ''
else:
    cost = ',' + str(cost)

unsat = 'encoding/termination-unsat.lp'

if len(sys.argv) == 4:
    unsat = sys.argv[3]

guess = '{'+ 'encoding/repair-4.lp,encoding/holds.lp,' + f'instances/{game}/bound.lp,instances/{game}/rule.lp,instances/{game}/weak-win.lp,instances/{game}/static.lp' + '}'
check = '{' + f'{unsat},' + f'instances/{game}/static.lp' + '}'

#cmd = f'time python gc1.py {guess} -C {check} --opt-mode=opt{cost} -t 3 --restart-on-model  --opt-strategy=usc,oll --opt-usc-shrink=inv'
cmd = f'time python gc1.py {guess} -C {check} --opt-mode=opt{cost} -t 3 --restart-on-model  --opt-strategy=bb,dec'

#--opt-strategy=bb,dec
os.system(f'bash -c "{cmd}"')
