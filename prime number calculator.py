def genprimes(limit): 
    D = {}            
    q = 2

    while q <= limit:
        if q not in D:
            yield q
            D[q * q] = [q]
        else:
            for p in D[q]:
                D.setdefault(p + q, []).append(p)
            del D[q]
        q += 1

p = genprimes(100)
prms = [i for i in p]

print(prms)
