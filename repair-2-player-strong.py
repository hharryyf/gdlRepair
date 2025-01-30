from clyngor import ASP, solve
import sys
import os
import queue
from game_property import log_action_encoding, get_role, termination_playability_slow, build_quantifier

def strong_winnability_encoding(inputfile, current, horizon, outfile):
    f = open(outfile, 'w')
    print('program(sw).', file=f)
    print(f'tdom(1..{horizon+1}).', file=f)
    ################ log-encoding #################
    role = get_role(inputfile)
    for r in role:
        if r != current:
            log_action_encoding(inputfile, r, 'sw', f)
    
    print('% N player game', file=f)
    #print(f"tdom(1..{horizon}).",file=f)
    print(file=f)
    print("% logarithmic encoding",file=f)
    print(f"{{moveL(R, M, sw, T) : ldom(R, M)}} :- tdom(act,T), role(R), R != {current}.",file=f)
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
bound = sys.argv[5]
outfile = sys.argv[4]

strong_winnability_encoding(inputfile, current, horizon, strong_win_file)
termination_playability_fast(inputfile, horizon, terminal)
build_quantifier(current, files, inputfile, quantifier)
cmd = f'clingo --output=smodels encoding/repair-qbf-4.lp {inputfile} {files} {quantifier}  {bound} |  python qasp2qbf.py | lp2normal2 | lp2acyc | lp2sat | python qasp2qbf.py --cnf2qdimacs > {outfile}'
os.system(f"bash -c '{cmd}'")
print(f'Saving QBF instance to {outfile} \nStart QBCE preprocessing...')
# --ignore-outermost-vars
cmd = f'time qratpre+   --no-qat --no-qrate --no-eabs --no-eabs-improved-nesting  --print-formula  {outfile} > qbce-{outfile}'
os.system(f"bash -c '{cmd}'")
print(f'Preprocessed QBF instance saved to qbce-{outfile}')
