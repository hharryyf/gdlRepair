from clyngor import ASP, solve
import sys
import os
from game_property import termination_playability_slow, build_quantifier, strong_winnability_encoding

def termination_playability_fast(inputfile, horizon, outfile):
    # deal with termination
    f = open(outfile, 'w')
    print('true(roundcounter(1), J, 1) :- program(J).', file=f)
    print('true(roundcounter(T+1), J, T+1) :- true(roundcounter(T), J, T), program(J), tdom(act,T).', file=f)
    answer = solve(inputfile, inline='#show input/2.')
    mdom = {}
    for ans in answer:
        for c in ans:
            if c[1][0] not in mdom:
                mdom[c[1][0]] = set()
            mdom[c[1][0]].add(c[1][1])

    for role in mdom.keys():
        print('terminal(J,T) :- program(J), tdom(T)', end = '', file=f)
        for act in mdom[role]:
            print(f', not legal({role}, {act}, J, T)', end='', file=f)
        print('.', file=f)    
    
    print(f'terminal(J,T):- true(roundcounter({horizon+1}), J, T), program(J), tdom(T).', file=f)        
    f.close()


if len(sys.argv) != 7 and len(sys.argv) != 6:
    print('Usage: python repair-2-player-strong.py [game-encoding-path] [horizon] [current player] [outputfile] [repair bound file] [optional many other property files separated by ,]')
    exit(1)

optional = ''

if len(sys.argv) == 7:
    optional = sys.argv[6].replace(',', ' ')

strong_win_file = sys.argv[1].replace('.lp', '-log-encoding.lp')
inputfile = sys.argv[1]
horizon = int(sys.argv[2])
current = sys.argv[3]
terminal = sys.argv[1].replace('.lp', '-termination.lp')
quantifier = sys.argv[1].replace('.lp', '-quantifier.lp')
files = optional + ' ' + strong_win_file + ' ' + terminal
#files = optional +  ' ' + terminal

bound = sys.argv[5]
outfile = sys.argv[4]

strong_winnability_encoding(inputfile, current, horizon, strong_win_file)
termination_playability_fast(inputfile, horizon, terminal)
#termination_playability_slow(inputfile, terminal)
build_quantifier(current, files, inputfile, quantifier)
cmd = f'clingo --output=smodels encoding/repair-qbf-4.lp {inputfile} {files} {quantifier}  {bound} |  python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > {outfile}'
os.system(f"bash -c '{cmd}'")
print(f'Saving QBF instance to {outfile} \nStart QBCE preprocessing...')
# --ignore-outermost-vars
cmd = f'time qratpre+   --no-qat --no-qrate --no-eabs --no-eabs-improved-nesting  --print-formula  {outfile} > qbce-{outfile}'
os.system(f"bash -c '{cmd}'")
print(f'Preprocessed QBF instance saved to qbce-{outfile}')
