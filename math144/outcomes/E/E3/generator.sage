from sage.all import *

class Generator(BaseGenerator):
    def data(self):
    #### PART A
        t = var('t')
        y=var('y')
        # need (d-a)/c > 0 and nonzero c:
        c = (choice(range(18)) + 2) * choice([-1, 1])
        ad = flatten([(i, -i) for i in range(20) if i > 0])
        if c > 0: # need d > a
            (a, d) = sorted(sample(ad, 2))
        else: # need d < a
            (d, a) = sorted(sample(ad, 2))
        # need q > 0 and q != 1
        q = 1
        while q == 1 or q == 0:
            q = abs(QQ.random_element(num_bound = 20))
        (m, b) = sample(ad, 2)
    #### PART B
        (A, B, C, M, R) = sample(ad, 5)
    #### PART C
        y = var('y')
        (P, V) = sample(ad, 2)
        # it would be bad if k was zero 
        k = round(1-random(), 2)*choice([-1, 1])

        return {
            'parta': latex(a+c*q^(m*t+b)==d),
            'a': a,
            'c': c,
            'd': d,
            'q': q,
            'm': m,
            'b': b,
            'dminusa': d-a,
            'partb': latex(A*ln(M*t+B)+C==R),
            'A': A,
            'B': B,
            'C': C,
            'M': M,
            'R': R,
            'RminusC': R-C,
            'partc': latex(y==P*exp(k*t)+V),
            'P': P,
            'V': V,
            'k': k
        }
