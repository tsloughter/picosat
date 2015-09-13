Erlang Picosat
=====

Based on [Haskell's picosat bindings](https://github.com/sdiehl/haskell-picosat).

Build
-----

```
$ rebar3 compile
```

Usage
-----

If we have a table of variables representing logical statements we can enumerate them with integers.

```text
A  1
B  2
C  3
D  4
E  5
F  6
```

Then the clause can be written as sequences of positive integers
(assertion) and negative integers (negation):

```text
(A v ¬B v C)
1 -2 3 0
```

```text
(B v D v E)
2 4 5 0
```

```text
(D V F)
4 6 0
```

Solutions to a statement of the form:

```text
(A v ¬B v C) ∧ (B v D v E) ∧ (D v F)
```

Can be written as zero-terminated lists of integers:

```text
1 -2 3 0
2 4 5 0
4 6 0
```

To use the Erlang bindings simply pass a list of clauses to
the ``solve`` function, this will return either the solution or
the atoms ``unsatisfiable`` or ``unknown``.

```
$ rebar3 shell
1> picosat:solve([[1, -2, 3], [2,4,5], [4,6]]).
[1,-2,3,4,5,6]
```

The solution given we can interpret as:

```text
1   A
-2 ¬B
3   C
4   D
5   E
6   F
```
