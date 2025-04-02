
# blocks world

print('role(robot).')
print('tdom(1..4).')

block = ['a','b','c']

for b in block:
    print(f'base(clear({b})).')

for b in block:
    print(f'base(table({b})).')

for b in block:
    for c in block:
        if b != c:
            print(f'base(on({b},{c})).')

for i in range(1, 5):
    print(f'base(step({i})).')

for b in block:
    for c in block:
        if b != c:
            print(f'input(robot,s({b},{c})).')


for b in block:
    for c in block:
        if b != c:
            print(f'input(robot,u({b},{c})).')

print('init(clear(b)).')
print('init(clear(c)).')
print('init(on(c,a)).')
print('init(table(a)).')
print('init(table(b)).')
print('init(step(1)).')

rid = 1
legal = 0

skip = 0

def print_legal_rule(role:str, act:str, fluents:list):
    global rid
    global legal
    global skip
    if rid == 1 and skip == 0:
        skip = 1
        return
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

for x in block:
    for y in block: 
        if x != y:
            print_legal_rule('robot', f's({x},{y})', [f'+clear({x})', f'+table({x})', f'+clear({y})'])

for x in block:
    for y in block:
        if x != y: 
            print_legal_rule('robot', f'u({x},{y})', [f'+clear({x})', f'+on({x},{y})'])

for x in block:
    for y in block:
        if x != y:
            print_next_rule(f'on({x},{y})', [f'+d robot|s({x},{y})'])

for x in block:
    for y in block:
        for u in block:
            for v in block:
                if u != v and x != y:
                    print_next_rule(f'on({x},{y})', [f'+d robot|s({u},{v})', f'+f on({x},{y})'])

for x in block:
    for u in block:
        for v in block:
            if u != x and u != v:
                print_next_rule(f'table({x})', [f'+d robot|s({u},{v})', f'+f table({x})'])

for y in block:
    for u in block:
        for v in block:
            if v != y and u != v:
                print_next_rule(f'clear({y})', [f'+d robot|s({u},{v})', f'+f clear({y})'])

for x in block:
    for y in block:
        for u in block:
            for v in block:
                if u != x and u != v and x != y:
                    print_next_rule(f'on({x},{y})', [f'+d robot|u({u},{v})', f'+f on({x},{y})'])


for x in block:
    for y in block:
        if x != y:
            print_next_rule(f'table({x})', [f'+d robot|u({x},{y})'])


for x in block:
    for y in block:
        if x != y:
            print_next_rule(f'clear({y})', [f'+d robot|u({x},{y})'])


for x in block:
    for u in block:
        for v in block:
            if u != v:
                print_next_rule(f'table({x})', [f'+d robot|u({u},{v})', f'+f table({x})'])

for x in block:
    for u in block:
        for v in block:
            if u != v:
                print_next_rule(f'clear({x})', [f'+d robot|u({u},{v})', f'+f clear({x})'])


for i in range(2, 5):
    print_next_rule(f'step({i})', [f'+f step({i-1})'])

print(f'legal_rule(1..{legal}).')
print(f'old_rule(1..{rid-1}).')
print(f'rule(1..{rid-1}).')

print('goal(robot,100,J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), program(J), tdom(T).')
print('goal(robot,0,J,T) :- not true(on(a,b),J,T), program(J), tdom(T).')
print('goal(robot,0,J,T) :- not true(on(b,c),J,T), program(J), tdom(T).')
print('terminal(J,T) :- true(step(4),J,T), program(J), tdom(T).')
print('terminal(J,T) :- true(on(a,b),J,T), true(on(b,c),J,T), program(J), tdom(T).')

