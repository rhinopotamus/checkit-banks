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
            simplify(funcs[i](ratios[i])) # Why is simplify necessary? Who knows!!
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

        #### Part B: contexts
        # I'm honestly just gonna hardcode some
        # Maybe I can make this fancier later, buuuuuut idc right now

        (context, contextans) = choice([
            ("In order to be compliant with the Americans with Disabilities Act, \
            the slope of a ramp must be no steeper than a 1:12 ratio -- \
            that is, the ramp can only rise 1 inch for every 12 inches long it is. \
            What's the maximum angle, <em>in degrees</em>, the ramp can make \
            with the flat ground around it? <em>Draw and label a picture!</em>", 
            # Make sure this string literal works
            "\\theta = \\arctan\\left(\\dfrac{1}{12}\\right) \\approx 4.764^\circ."),
            ("A photographer is taking pictures of a hot air balloon launch. \
            When the balloon launches, the photographer is 850 feet away \
            from the balloon. What angle up from the ground does the \
            photographer have to tilt their camera at to take a picture \
            when the balloon is 200 feet off the ground? \
            <em>Draw and label a picture!</em>", 
            "\\theta = \\arctan\left(\dfrac{200}{850}\\right) \\approx 13.24^\circ."),
            ("Because shingles aren't meant to have water sitting on them, \
            the minimum roof pitch for shingles is a 2:12 pitch -- \
            that is, the roof must rise at least 2 inches for every 12 inches \
            long it is. What's the minimum angle, <em>in degrees</em>, \
            that a shingled roof must make from horizontal? \
            <em>Draw and label a picture!</em>",
            "\\theta = \\arctan\\left(\\dfrac{2}{12}\\right) \\approx 9.462^\circ."),
        ])

        return {
            "promptjson": promptjson,
            "answerjson": answerjson,
            "context": context,
            "contextans": contextans
        }