# GDLrepair

Find the minimal repair to make a multi-player GDL weakly winnable or strongly winnable.

Input format:

The game encoding must be in ASP format. The next/legal rule must be grounded. The body of legal rules can only contain true predicates, the body of next rules can only contain does and true predicates. For the i-th rule, if the head is *legal(r,a)*, it is encoded as *original_head(I,r,a)*. If the head is *next(f)*, it is encoded as *original_head(I,f)*. For an atom in the body,
if it is *true(f)*, it is encoded as *original_body(I,pos,f)*, if it is *does(r,a)*, it is encoded as *original_body(I,pos,r,a)*.
If it is appeared as a negative literal, it is encoded as *original_body(I,neg,f)* and *original_body(I,neg,r,a)* respectively. 
 

**Repair weak winnability**

The input is an N-player GDL file. Run the following command to create the encoding files (must end with .lp)

```
python repair-N-player-weak.py [path-to-the-game-description.lp] [path-to-the-cost-file] [cost bound]
```

**Repair strong winnability**

Here, we can only answer the question, is there a repair that has a cost at most C such that *current* can win the game no matter what the *opponent* is doing.

```
python repair-2-player-strong.py [game-encoding-path] [horizon] [current] [opponent] [outputfile] [repair cost file] [optional other property files separated by ,]
```
