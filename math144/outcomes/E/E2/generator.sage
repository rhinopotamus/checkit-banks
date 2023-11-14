from sage.all import *

class Generator(BaseGenerator):
    def data(self):
        concave = choice(["concave up", "concave down"])
        creasing = choice(["increasing", "decreasing"])
        lim = choice([-1, 1]) * randrange(1, 6))
        if concave == "concave up" and creasing == "increasing":
            pm = "+"
            growdec = "b > 1"
            limdir = "t \\to -\infty"
        elif concave == "concave up" and creasing == "decreasing":
            pm = "+"
            growdec = "b < 1"
            limdir = "t \\to \infty"
        elif concave == "concave down" and creasing == "increasing":
            pm = "-"
            growdec = "b < 1"
            limdir = "t \\to \infty"
        else: # if concave == "concave down" and creasing == "decreasing":
            pm = "-"
            growdec = "b > 1"
            limdir = "t \\to -\infty"

        return {
            "concave": concave,
            "creasing": creasing,
            "pm": pm,
            "growdec": growdec,
            "limdir": limdir,
            "lim": lim
        }
