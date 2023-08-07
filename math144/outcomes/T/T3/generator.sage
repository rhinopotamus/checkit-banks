from sage.all import *

class Generator(BaseGenerator):
    def data(self):
        funcs = [arcsin, arcsin, arcsin, arccos, arccos, arccos, arctan, arctan]
        sincoslist = [0, 1/2, -1/2, sqrt(2)/2, -sqrt(2)/2, sqrt(3)/2, -sqrt(3)/2, 1, -1]
        tanlist = [0, 1/sqrt(3), -1/sqrt(3), 1, -1, sqrt(3), -sqrt(3)]
        ratios = sample(sincoslist, 3) + sample(sincoslist, 3) + sample(tanlist, 2)
        # build a shuffle-able list of triples...
        foo = [(
            funcs[i],
            ratios[i],
            funcs[i](ratios[i]) 
        ) for i in range(8)]
        shuffle(foo)
        # ... and then rip them apart!!!!
        promptjson = [
            {"func": foo[i][0],
             "ratio": foo[i][1]} for i in range(8)
        ]
        answerjson = [
            {"ans": foo[i][2]} for i in range(8)
        ]

        return {
            "promptjson": promptjson,
            "answerjson": answerjson
        }

# NOTES:
# This works! The json-formatted lists pass back correctly.
# Annoyances:
# - Ordered list doesn't appear to be working correctly.
# - Sage renders pi-fractions weird.
# - I accidentally got a tan(3pi/2) whose value is undefined.