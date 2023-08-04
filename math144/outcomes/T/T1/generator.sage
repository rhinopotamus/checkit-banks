from sage.all import *

class Generator(BaseGenerator):
    def data(self):
        funcs = [choice([sin, cos, tan]) for i in range(8)]
        angles = sample([0,         pi/6,   pi/4,   pi/3,
                           pi/2,  5*pi/6, 3*pi/4, 2*pi/3,
                           pi,    7*pi/6, 5*pi/4, 4*pi/3,
                         3*pi/2, 11*pi/6, 7*pi/4, 5*pi/3,
                                   -pi/6,  -pi/4,  -pi/3], 8)
        tablejson = [
            {"func": funcs[i], 
             "angle": angles[i]} for i in range(8)
        ]
        triple = choice([(3,4,5),
                         (5,12,13),
                         (6,8,10),
                         (8,15,17)])
        ans_uc = [funcs[i](angles[i]) for i in range(8)]
        answerjson = [
            {"ans": ans_uc[i]} for i in range(8)
        ]

        return {
            "tablejson": tablejson,
            "answerjson": answerjson,
            "leg1": triple[0],
            "leg2": triple[1],
            "hyp": triple[2]
        }

# NOTES:
# This works! The json-formatted lists pass back correctly.
# Annoyances:
# - Ordered list doesn't appear to be working correctly.
# - Sage renders pi-fractions weird.
# - I accidentally got a tan(3pi/2) whose value is undefined.