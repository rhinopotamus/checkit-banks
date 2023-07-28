from sage.all import *

class Generator(BaseGenerator):
    def data(self):
        [t1, t2] = sorted(sample([2,3,5,7,11,13,17,19], 2))
        [y1, y2] = sample([1,2,3,5,7,9,11,13,14,17,19], 2)
        deltat = t2 - t1

        return {
            "t1": t1,
            "t2": t2,
            "deltat": deltat,
            "y1": y1,
            "y2": y2
        }
