from sage.all import *

class Generator(BaseGenerator):
    def data(self):
        # pick two different letters
        [v1, v2] = sample([var('x'), var('s'), var('t'), var('z'), var('y')], 2)

        # coefficients and exponents
        [a, b, c, d] = sample(list(primes(50))+[-i for i in primes(50)], 4)
        p = choice([1,2])

        terms = [a*v1^p, b*v1, c*v2^2, d*v2^p]
        factors = [v1, v2 if p==1 else v2^2]
        expr = terms[0].add(b*v1, c*v2^2, d*v2^p, hold = True)
        
        return {
            "terms": terms,
            "term0": terms[0],
            "term1": terms[1],
            "term2": terms[2],
            "term3": terms[3],
            "factors": factors, # would be cool if I could pass lists!
            "factor0": factors[0],
            "factor1": factors[1],
            "sum": expr,
            "result": expr.unhold()
        }
