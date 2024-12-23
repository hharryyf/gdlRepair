import sys
import math

if len(sys.argv) != 2:
    print('Usage: python 8-puzzle.py [maximum plan length]')
    exit(1)
# define init/base/input
print(f'tdom(1..{sys.argv[1]}).')
print('role(player).')
print(f'base(step(1..{sys.argv[1]})).')
print('base(cell(1..3,1..3,1..8)).')
print('base(cell(1..3,1..3,b)).')
print('input(player, move(1..3,1..3)).')

print('init(cell(1,1,8)).')
print('init(cell(1,2,1)).')
print('init(cell(1,3,3)).')
print('init(cell(2,1,4)).')
print('init(cell(2,2,b)).')
print('init(cell(2,3,2)).')
print('init(cell(3,1,7)).')
print('init(cell(3,2,6)).')
print('init(cell(3,3,5)).')
print('init(step(1)).')

rid = 1
legal = 0

def print_legal_rule(role:str, act:str, fluents:list):
    global rid
    global legal
    print(f'original_head({rid}, {role}, {act}).', end = ' ')
    for fluent in fluents:
        if fluent[0] == '+':
            print(f'original_body({rid}, pos, {fluent[1:]}).', end = ' ')
        else:
            print(f'original_body({rid}, neg, {fluent[1:]}).', end = ' ')
    print()
    rid += 1
    legal += 1

def print_next_rule(next:str, fluents:list):
    global rid
    print(f'original_head({rid}, {next}).', end = ' ')
    for fluent in fluents:
        if fluent[:2] == '+d':
            fluent = fluent[2:].split('|')
            print(f'original_body({rid}, pos,{fluent[0]}, {fluent[1]}).', end = ' ')
        elif fluent[:2] == '-d':
            fluent = fluent[2:].split('|')
            print(f'original_body({rid}, neg,{fluent[0]}, {fluent[1]}).', end = ' ')
        elif fluent[:2] == '+f':
            print(f'original_body({rid}, pos,{fluent[2:]}).', end = ' ')
        else:
            print(f'original_body({rid}, neg,{fluent[2:]}).', end = ' ')
    print()
    rid += 1

# define legal

for i in range(1, 3):
    for j in range(1, 4):
        fluents = []
        fluents.append(f'+cell({i+1},{j},b)')
        print_legal_rule('player', f'move({i},{j})', fluents)

for i in range(1, 3):
    for j in range(1, 4):
        fluents = []
        fluents.append(f'+cell({i},{j},b)')
        print_legal_rule('player', f'move({i+1},{j})', fluents)


for i in range(1, 4):
    for j in range(1, 3):
        fluents = []
        fluents.append(f'+cell({i},{j},b)')
        print_legal_rule('player', f'move({i},{j+1})', fluents)

for i in range(1, 4):
    for j in range(1, 3):
        fluents = []
        fluents.append(f'+cell({i},{j+1},b)')
        print_legal_rule('player', f'move({i},{j})', fluents)

# define next

for i in range(1, int(sys.argv[1])):
    fluent = []
    fluent.append(f'+f step({i})')
    print_next_rule(f'step({i+1})', fluent)

for i in range(1, 4):
    for j in range(1, 4):
        fluent = []
        fluent.append(f'+d player|move({i},{j})')
        print_next_rule(f'cell({i}, {j}, b)', fluent)

'''
(<= (next (cell ?u ?y ?z))
    (does player (move ?x ?y)) 
    (true (cell ?u ?y b))
    (true (cell ?x ?y ?z))
    (distinct ?z b))


'''

for u in range(1, 4):
    for y in range(1, 4):
        for z in range(1, 9):
            for x in range(1, 4):
                if u - x == 1 or x - u == 1:
                    fluent = []
                    fluent.append(f'+d player|move({x},{y})')
                    fluent.append(f'+f cell({u},{y},b)')
                    fluent.append(f'+f cell({x},{y},{z})')
                    print_next_rule(f'cell({u},{y},{z})', fluent)

for x in range(1, 4):
    for v in range(1, 4):
        for z in range(1, 9):
            for y in range(1, 4):
                if v - y == 1 or y - v == 1:
                    fluent = []
                    fluent.append(f'+d player|move({x},{y})')
                    fluent.append(f'+f cell({x},{v},b)')
                    fluent.append(f'+f cell({x},{y},{z})')
                    print_next_rule(f'cell({x},{v},{z})', fluent)

'''

'''


for x in range(1, 4):
    for y in range(1, 4):
        for z in range(1, 9):
            for bx in range(1, 4):
                for by in range(1, 4):  
                    for mx in range(1, 4):
                        for my in range(1, 4):
                            if abs(mx - bx) + abs(my - by) == 1 and (mx, my) != (x, y) and (bx, by) != (x, y):
                                fluent = []
                                fluent.append(f'+f cell({x},{y},{z})')
                                fluent.append(f'+f cell({bx},{by},b)')
                                fluent.append(f'+d player|move({mx},{my})')
                                print_next_rule(f'cell({x},{y},{z})', fluent)


print(f'legal_rule(1..{legal}).')
print(f'old_rule(1..{rid-1}).')
print(f'rule(1..{rid-1}).')
# define goal and terminal

print('goal(player, 100, J, T) :- true(cell(1,1,1), J, T), true(cell(1,2,2), J, T), true(cell(1,3,3), J, T), true(cell(2,1,4), J, T), true(cell(2,2,5), J, T), true(cell(2,3,6), J, T), true(cell(3,1,7), J, T), true(cell(3,2,8), J, T), true(cell(3,3,b), J, T), program(J), tdom(T).')

print('goal(player, 0, J, T) :- not goal(player, 100, J, T), tdom(T), program(J).')

print('terminal(J, T) :- goal(player, 100, J, T), program(J), tdom(T).')
print(f'terminal(J, T) :- true(step({sys.argv[1]}), J, T), program(J), tdom(T).')

