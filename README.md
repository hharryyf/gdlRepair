# GDL Repair

Find the minimal repair to make a multi-player GDL weakly winnable/strongly winnable and termination and playable.

## Description

**Input format:**

* The game encoding must be in ASP format. 

* The next/legal rule must be grounded. 

* The body of legal rules can only contain true predicates, the body of next rules can only contain does and true predicates. 

* For the i-th rule, if the head is ```legal(r,a)```, it is encoded as ```original_head(I,r,a)```. 

* If the head is ```next(f)```, it is encoded as ```original_head(I,f)```. 

* For an atom in the body, if it is ```true(f)```, it is encoded as ```original_body(I,pos,f)```, if it is ```does(r,a)```, it is encoded as ```original_body(I,pos,r,a)```. If it is appeared as a negative literal, it is encoded as ```original_body(I,neg,f)``` and ```original_body(I,neg,r,a)``` respectively. 
 
* To reproduce the experiments

For tic-tac-toe:

```
    python repair-gc.py tic_tac_toe_1 -1 bb 3 instances/tic_tac_toe_1/turn.lp 
```

For blocks world:

```
    python repair-gc.py blocks_1 -1 bb 3 
```

For the toy example:

```
    python repair-gc.py toy -1 bb 3 
```

## Dependencies

* Guess and Check https://github.com/potassco/guess_and_check

* Clingo https://github.com/potassco/guide/releases (clingo must be put into PATH)

* Python 3+

