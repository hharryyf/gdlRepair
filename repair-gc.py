import sys
import os

if len(sys.argv) != 5 and len(sys.argv) != 6:
    print('Usage python repair-gc.py [game-name] [cost bound, -1 means no bound] [optimization strategy: usc|bb] [number of threads] [optional:path to a GTL encoding file]')
    exit(1)
    
game = sys.argv[1]
cost = int(sys.argv[2])

if cost == -1:
    cost = ''
else:
    cost = ',' + str(cost)

unsat = 'encoding/termination-unsat.lp'

if len(sys.argv) == 6:
    unsat = sys.argv[5]

guess = '{'+ 'encoding/repair-4.lp,encoding/holds.lp,' + f'instances/{game}/bound.lp,instances/{game}/rule.lp,instances/{game}/weak-win.lp,instances/{game}/static.lp' + '}'
check = '{' + f'{unsat},' + f'instances/{game}/static.lp' + '}'

if sys.argv[3] == 'usc':
    cmd = f'time python gc1.py {guess} -C {check} --opt-mode=opt{cost} -t {sys.argv[4]} --restart-on-model  --opt-strategy=usc,oll --opt-usc-shrink=inv'
else:
    cmd = f'time python gc1.py --binary {guess} -C {check} --opt-mode=opt{cost} -t {sys.argv[4]} --restart-on-model  --opt-strategy=bb,dec'

os.system(f'bash -c "{cmd}"')
