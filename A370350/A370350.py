# used to generate b-file
def a(n, C = 5):
    s = 0
    while n > 1:
        d, r = divmod(n, C)
        n = n + 1 + d if r else d
        s += 1
    return s
for i in range(1,10000):
    print(i, a(i))
