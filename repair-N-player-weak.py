import os 
import sys 

if len(sys.argv) < 4:
    print('Usage python repair-N-player-weak.py [game-name]  [cost bound, negative cost means prove termination and playability] [time-limit -1 means no time-limit] [optional:number of thread]')
    exit(1)

numthread = 1
if len(sys.argv) == 5:
    numthread = int(sys.argv[4])

timelimit = int(sys.argv[3])
cost = int(sys.argv[2])
term = False
if cost < 0:
    cost = cost * -1
    term = True
if timelimit < 0:
    timelimit = ''
else:
    timelimit = f'--time-limit={timelimit}'    
bound = 'instances/' + sys.argv[1] + '/bound.lp'
rule = 'instances/' +sys.argv[1] + '/rule.lp'
static = 'instances/' +sys.argv[1] + '/static.lp'
win = 'instances/' +sys.argv[1] + '/weak-win.lp'
disj = 'instances/' +sys.argv[1] + '/disjunction.lp'

#termination_playability_slow(inputfile, terminal)
#build_quantifier(player, files, inputfile, quantifier)
#cmd = f'clingo --output=smodels encoding/repair-qbf-4.lp {inputfile} {files} {quantifier}  {sys.argv[2]} |  python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > game-slow.qdimacs'
#os.system(f"bash -c '{cmd}'")
print(f'Timelimit: {timelimit}')
print(f'Number of threads: {numthread}')

cmd = f'clingo {timelimit} -t {numthread} --opt-mode=opt,{cost} --restart-on-model encoding/repair-4.lp {bound} {rule} {static} {win}'

if term:
    cmd += ' '
    cmd += f'encoding/disjunction.lp {disj}'

os.system(f"bash -c '{cmd}'")
