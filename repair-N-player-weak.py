import os 
import sys 
from clyngor import ASP, solve

if len(sys.argv) != 4:
    print('Usage python repair-N-player-weak.py [GDL ASP file] [path to the repair cost definition file] [cost bound]')
    exit(1)

cost = int(sys.argv[3])

answer = solve(sys.argv[1], inline='#show role/1.')

role = set()

for ans in answer:
    for c in ans:
        role.add(c[1][0])

f = open(f'{sys.argv[1].replace('.lp', '-weak-win.lp')}', 'w')
print(f'program(1..{len(role)}).',file=f, end=' ')
i = 1
for r in role:
    print(f'weak_win({i},{r}).', end=' ', file=f)
    i += 1
print(file=f)
print(file=f)
print(':- not legal(R, A, P, T), does(R, A, P, T), role(R), program(P).', file=f)
print('1 {does(R, A, J, T) : input(R, A)} 1 :- tdom(act,T), not terminated(J, T), role(R), program(J).', file=f)
print(file=f)
print('terminated(J, T) :- terminal(J, T), tdom(fluent,T), program(J).', file=f)
print('terminated(J, T+1) :- terminated(J, T), tdom(fluent,T), program(J).', file=f)
print(file=f)
print(':- 0 { terminated(J, T) : tdom(fluent,T) } 0, program(J).', file=f)
print(':- terminated(P, T), not terminated(P, T - 1), not goal(R, 100, P, T), weak_win(P,R).', file=f)
print(':- terminated(P, 1), not goal(R, 100, P, 1), weak_win(P,R).', file=f)

f.close()

cmd = f'clingo -t 3 --opt-mode=opt,{cost} --restart-on-model encoding/repair-4.lp {sys.argv[1]} {sys.argv[1].replace('.lp', '-weak-win.lp')} {sys.argv[2]}'
os.system(f"bash -c '{cmd}'")
