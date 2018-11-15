### Installation and run

1. Install project

```
git clone git@github.com:slavakisel/my-binance.git
cd my-binance
bin/setup
```

2. Setup .env content

3. Run:
```
bundle exec ruby trades.rb
```

### Example

```
 ~/src/my-binance (master=) › bundle exec ruby trades.rb -s ENGETH
```

Output:

```
Usage: trades.rb [options]
    -s, --symbol NAME                [Optional] Trade pair (default ASTETH)

+--------+------------+-------------+----------------+-------------------------+
| Symbol | Price      | Quantity    | Comission      | Traded At               |
+--------+------------+-------------+----------------+-------------------------+
| ENGETH | 0.00543460 | 20.00000000 | 0.00254083 BNB | 2018-01-07 04:26:46 UTC |
| ENGETH | 0.00452880 | 10.00000000 | 0.00159177 BNB | 2018-01-20 09:14:46 UTC |
| ENGETH | 0.00452880 | 24.00000000 | 0.00382026 BNB | 2018-01-20 09:14:46 UTC |
| ENGETH | 0.00350960 | 47.00000000 | 0.00225138 BNB | 2018-02-14 17:41:29 UTC |
| ENGETH | 0.00250000 | 30.00000000 | 0.00334851 BNB | 2018-03-09 13:59:24 UTC |
| ENGETH | 0.00249910 | 71.00000000 | 0.00789277 BNB | 2018-03-09 14:01:20 UTC |
| ENGETH | 0.00401000 | 7.00000000  | 0.00068914 BNB | 2018-04-23 08:29:41 UTC |
| ENGETH | 0.00401000 | 19.00000000 | 0.00187052 BNB | 2018-04-23 08:29:41 UTC |
| ENGETH | 0.00332000 | 40.00000000 | 0.00336246 BNB | 2018-05-21 09:32:43 UTC |
| ENGETH | 0.00332000 | 5.00000000  | 0.00042030 BNB | 2018-05-21 09:32:43 UTC |
| ENGETH | 0.00234000 | 53.00000000 | 0.00275530 BNB | 2018-08-19 15:06:49 UTC |
| ENGETH | 0.00235980 | 12.00000000 | 0.00062384 BNB | 2018-08-19 15:06:49 UTC |
+--------+------------+-------------+----------------+-------------------------+
```
