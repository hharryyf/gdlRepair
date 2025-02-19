import sys
import os

if len(sys.argv) != 3:
    print('Usage python repair-N-player-weak-gc.py [game-name] [cost bound]')
    exit(1)
    
game = sys.argv[1]
cost = int(sys.argv[2])

guess = '{'+ 'encoding/repair-4.lp,encoding/holds.lp,' + f'instances/{game}/bound.lp,instances/{game}/rule.lp,instances/{game}/weak-win.lp,instances/{game}/static.lp' + '}'
check = '{' + 'encoding/termination-unsat.lp,' + f'instances/{game}/static.lp' + '}'

cmd = f'time python gc1.py {guess} -C {check} --opt-mode=opt,{cost} -t 3 --restart-on-model'

os.system(f'bash -c "{cmd}"')
