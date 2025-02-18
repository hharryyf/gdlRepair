import sys
import os

game = sys.argv[1]
cost = int(sys.argv[2])

guess = '{'+ 'encoding/repair-4.lp,encoding/holds.lp,' + f'guess-check-instances/{game}/bound.lp,guess-check-instances/{game}/rule.lp,guess-check-instances/{game}/weak-win.lp,guess-check-instances/{game}/static.lp' + '}'
check = '{' + 'encoding/termination-unsat.lp,' + f'guess-check-instances/{game}/static.lp' + '}'

cmd = f'python gc.py {guess} -C {check} --opt-mode=opt,{cost} -t 3'

os.system(f'bash -c "{cmd}"')