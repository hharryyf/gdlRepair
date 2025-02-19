succ = set()
adj = set()
cell = set()
gold = set()
adj.add(('a','b'))
adj.add(('b','c'))
adj.add(('c','d'))
adj.add(('d','a'))
print('tdom(1..9).')

for i in range(1,10):
    succ.add((i,i+1))
cell.add('a')
cell.add('b')
cell.add('c')
cell.add('d')
gold.add('a')
gold.add('b')
gold.add('c')
gold.add('d')
gold.add('i')
print('role(robot).')
print('base(cell(a)).')
print('base(cell(b)).')
print('base(cell(c)).')
print('base(cell(d)).')
print('base(gold(a)).')
print('base(gold(b)).')
print('base(gold(c)).')
print('base(gold(d)).')
print('base(gold(i)).')
print('base(step(1)).')
for i in range(1,10):
    print(f'base(step({i+1})).')

print('input(robot,move).')
print('input(robot,grab).')
print('input(robot,drop).')

print('init(cell(a)).')
print('init(gold(c)).')
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

for x in gold:
    if x != i:
        print_next_rule(f'gold({x})', [f'+d robot|drop', f'+f gold({x})'])

print_legal_rule('robot', 'move', [])


for x in cell:
    print_legal_rule('robot', 'grab', [f'+cell({x})', f'+gold({x})'])

print_legal_rule('robot', 'drop', [f'+gold(i)'])


for f in adj:
    x,y = f[0], f[1]
    print_next_rule(f'cell({y})', [f'+d robot|move', f'+f cell({x})'])

for x in cell:
    print_next_rule(f'cell({x})', [f'+d robot|grab', f'+f cell({x})'])

for x in cell:
    print_next_rule(f'cell({x})', [f'+d robot|drop', f'+f cell({x})'])

for x in gold:
    print_next_rule(f'gold({x})', [f'+d robot|move', f'+f gold({x})'])

for x in cell:
    print_next_rule(f'gold(i)', [f'+d robot|grab', f'+f cell({x})', f'+f gold({x})'])

print_next_rule(f'gold(i)', [f'+d robot|grab', f'+f gold(i)'])

for x in cell:
  for y in gold:
    if x != y:
        print_next_rule(f'gold({y})', [f'+d robot|grab', f'+f cell({x})', f'+f gold({y})'])
      
for s in succ:
    print_next_rule(f'step({s[1]})', [f'+f step({s[0]})'])
      

for x in cell:
    print_next_rule(f'gold({x})', [f'+d robot|drop', f'+f cell({x})', f'+f gold(i)'])


print(f'legal_rule(1..{legal}).')
print(f'old_rule(1..{rid-1}).')
print(f'rule(1..{rid-1}).')
print('goal(robot,100,J,T) :- true(gold(a),J,T), program(J), tdom(T).')
print('terminal(J,T) :- program(J), tdom(T), true(step(10), T).')
print('terminal(J,T) :- program(J), tdom(T), true(gold(a), J,T).')
