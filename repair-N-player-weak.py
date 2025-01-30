import os 
import sys 
from clyngor import ASP, solve
from game_property import weak_winnability


if len(sys.argv) != 4:
    print('Usage python repair-N-player-weak.py [GDL ASP file] [path to the repair cost definition file] [cost bound]')
    exit(1)


cost = int(sys.argv[3])
inputfile = sys.argv[1]
outputfile = sys.argv[1].replace('.lp', '-weak-win.lp')

weak_winnability(inputfile, outputfile)

cmd = f'clingo -t 3 --opt-mode=opt,{cost} --restart-on-model encoding/repair-4.lp {inputfile} {outputfile} {sys.argv[2]}'
os.system(f"bash -c '{cmd}'")
