import os 
import sys 
from clyngor import ASP, solve
from game_property import weak_winnability, termination_playability_slow, build_quantifier


if len(sys.argv) != 4:
    print('Usage python repair-N-player-weak.py [GDL ASP file] [path to the repair cost definition file] [cost bound]')
    exit(1)


cost = int(sys.argv[3])
inputfile = sys.argv[1]
outputfile = sys.argv[1].replace('.lp', '-weak-win.lp')
terminal = sys.argv[1].replace('.lp', '-termination.lp')
quantifier = sys.argv[1].replace('.lp', '-quantifier.lp')

files = outputfile + ' ' + terminal
weak_winnability(inputfile, outputfile)

#termination_playability_slow(inputfile, terminal)
#build_quantifier('robot', files, inputfile, quantifier)
#cmd = f'clingo --output=smodels encoding/repair-qbf-4.lp {inputfile} {files} {quantifier}  {sys.argv[2]} |  python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > game-slow.qdimacs'
#os.system(f"bash -c '{cmd}'")


cmd = f'clingo -t 3 --opt-mode=opt,{cost} --restart-on-model encoding/repair-4.lp {inputfile} {outputfile} {sys.argv[2]}'
os.system(f"bash -c '{cmd}'")
