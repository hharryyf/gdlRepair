'''
    buggy Tic-tac-toe file, every x/o move will fill an x on the board
'''

print('tdom(1..10).')
print('mtdom(1..9).')
print('role(xplayer).')
print('role(oplayer).')
print('base(cell(1..3,1..3,x)).')
print('base(cell(1..3,1..3,o)).')
print('base(cell(1..3,1..3,b)).')
print('base(control(xplayer)).')
print('base(control(oplayer)).')
print('input(xplayer, mark(1..3,1..3)).')
print('input(oplayer, mark(1..3,1..3)).')
print('input(xplayer, noop).')
print('input(oplayer, noop).')

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

for i in range(1, 4):
    for j in range(1, 4):
        print(f'init(cell({i},{j},b)).')

print('init(control(xplayer)).')

print_legal_rule('xplayer', 'noop', ['+control(oplayer)'])
print_legal_rule('oplayer', 'noop', ['+control(xplayer)'])

for i in range(1, 4):
    for j in range(1, 4):
        print_legal_rule('xplayer', f'mark({i},{j})', ['+control(xplayer)', f'+cell({i},{j},b)'])
        print_legal_rule('oplayer', f'mark({i},{j})', ['+control(oplayer)', f'+cell({i},{j},b)'])

print_next_rule('control(xplayer)', ['+f control(oplayer)'])
print_next_rule('control(oplayer)', ['+f control(xplayer)'])


for i in range(1, 4):
    for j in range(1, 4):
        print_next_rule(f'cell({i},{j},x)', [f'+d xplayer|mark({i},{j})', f'+f cell({i},{j},b)'])
        if (i == 1 and j == 1):
            print_next_rule(f'cell({i},{j},o)', [f'+d oplayer|mark({i},{j})', f'+f cell({i},{j},b)']) # here's the bug
        else:
            print_next_rule(f'cell({i},{j},x)', [f'+d oplayer|mark({i},{j})', f'+f cell({i},{j},b)']) # here's the bug
         
        print_next_rule(f'cell({i},{j},x)', [f'+f cell({i},{j},x)'])
        print_next_rule(f'cell({i},{j},o)', [f'+f cell({i},{j},o)'])

for i in range(1, 4):
    for j in range(1, 4):
        for k in range(1, 4):
            for l in range(1, 4):
                if (i, j) != (k, l):
                    print_next_rule(f'cell({i},{j},b)', [f'+f cell({i},{j},b)', f'+d xplayer|mark({k},{l})'])
                    print_next_rule(f'cell({i},{j},b)', [f'+f cell({i},{j},b)', f'+d oplayer|mark({k},{l})'])


print(f'legal_rule(1..{legal}).')
print(f'old_rule(1..{rid-1}).')
print(f'rule(1..{rid-1}).')

print('terminal(J,T) :- not true(cell(1,1,b),J,T),not true(cell(1,2,b),J,T),not true(cell(1,3,b),J,T), \
not true(cell(2,1,b),J,T),not true(cell(2,2,b),J,T),not true(cell(2,3,b),J,T), \
not true(cell(3,1,b),J,T),not true(cell(3,2,b),J,T),not true(cell(3,3,b),J,T), program(J), tdom(T).')

print('goal(xplayer, 50, J, T) :- not true(cell(1,1,b),J,T),not true(cell(1,2,b),J,T),not true(cell(1,3,b),J,T), \
not true(cell(2,1,b),J,T),not true(cell(2,2,b),J,T),not true(cell(2,3,b),J,T), \
not true(cell(3,1,b),J,T),not true(cell(3,2,b),J,T),not true(cell(3,3,b),J,T), program(J), tdom(T).')

print('goal(oplayer, 50, J, T) :- not true(cell(1,1,b),J,T),not true(cell(1,2,b),J,T),not true(cell(1,3,b),J,T), \
not true(cell(2,1,b),J,T),not true(cell(2,2,b),J,T),not true(cell(2,3,b),J,T), \
not true(cell(3,1,b),J,T),not true(cell(3,2,b),J,T),not true(cell(3,3,b),J,T), program(J), tdom(T).')

print('goal(xplayer, 0, J, T) :- not goal(xplayer, 50, J, T), not goal(xplayer, 100, J, T), program(J), tdom(T).')
print('goal(oplayer, 0, J, T) :- not goal(oplayer, 50, J, T), not goal(oplayer, 100, J, T), program(J), tdom(T).')


for i in range(1, 4):
    print(f'goal(xplayer, 100, J, T) :- true(cell(1,{i},x),J,T),true(cell(2,{i},x),J,T),true(cell(3,{i},x),J,T), program(J), tdom(T).')    
    print(f'goal(oplayer, 100, J, T) :- true(cell(1,{i},o),J,T),true(cell(2,{i},o),J,T),true(cell(3,{i},o),J,T), program(J), tdom(T).')    
    print(f'terminal(J, T) :- true(cell(1,{i},x),J,T),true(cell(2,{i},x),J,T),true(cell(3,{i},x),J,T), program(J), tdom(T).')    
    print(f'terminal(J, T) :- true(cell(1,{i},o),J,T),true(cell(2,{i},o),J,T),true(cell(3,{i},o),J,T), program(J), tdom(T).')    
    print(f'goal(xplayer, 100, J, T) :- true(cell({i},1,x),J,T),true(cell({i},2,x),J,T),true(cell({i},3,x),J,T), program(J), tdom(T).')    
    print(f'goal(oplayer, 100, J, T) :- true(cell({i},1,o),J,T),true(cell({i},2,o),J,T),true(cell({i},3,o),J,T), program(J), tdom(T).')    
    print(f'terminal(J, T) :- true(cell({i},1,x),J,T),true(cell({i},2,x),J,T),true(cell({i},3,x),J,T), program(J), tdom(T).')    
    print(f'terminal(J, T) :- true(cell({i},1,o),J,T),true(cell({i},2,o),J,T),true(cell({i},3,o),J,T), program(J), tdom(T).')    


print('goal(xplayer, 100, J, T) :- true(cell(1,1,x),J,T),true(cell(2,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).')    
print('goal(oplayer, 100, J, T) :- true(cell(1,1,o),J,T),true(cell(2,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).')    
print('terminal(J, T) :- true(cell(1,1,x),J,T),true(cell(2,2,x),J,T),true(cell(3,3,x),J,T), program(J), tdom(T).')    
print('terminal(J, T) :- true(cell(1,1,o),J,T),true(cell(2,2,o),J,T),true(cell(3,3,o),J,T), program(J), tdom(T).')    


print('goal(xplayer, 100, J, T) :- true(cell(1,3,x),J,T),true(cell(2,2,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).')    
print('goal(oplayer, 100, J, T) :- true(cell(1,3,o),J,T),true(cell(2,2,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).')    
print('terminal(J, T) :- true(cell(1,3,x),J,T),true(cell(2,2,x),J,T),true(cell(3,1,x),J,T), program(J), tdom(T).')    
print('terminal(J, T) :- true(cell(1,3,o),J,T),true(cell(2,2,o),J,T),true(cell(3,1,o),J,T), program(J), tdom(T).')    

