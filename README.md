# GDL Repair

Find the minimal repair to make a multi-player GDL weakly winnable/strongly winnable and termination and playable + additional GTL requirements


* To reproduce the experiments

For tic-tac-toe with only well-formedness

```
    python repair-gc.py tic_tac_toe_2 -1 usc 1
```


For tic-tac-toe with only well-formedness + fluent dynamic

```
    python repair-gc.py tic_tac_toe_3 -1 usc 1
```


For tic-tac-toe with only well-formedness + fluent dynamic + turn-taking

```
    python repair-gc.py tic_tac_toe_3 -1 usc 1 instances/tic_tac_toe_3/turn.lp 
```


For blocks world:

```
    python repair-gc.py blocks_1 -1 usc 1 
```

For the toy example:

```
    python repair-gc.py toy_1 -1 usc 1 
```

For the toy example with fluent dynamic

```
    python repair-gc.py toy_2 -1 usc 1 
```

## Dependencies

* Guess and Check https://github.com/potassco/guess_and_check

* Clingo https://github.com/potassco/guide/releases (clingo must be put into PATH)

* Python 3+

