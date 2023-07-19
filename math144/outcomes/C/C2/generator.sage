from sage.all import * 

class Generator(BaseGenerator):
    def data(self):
        t = var('t')
        a = choice([0.7, 0.8, 1.75, 2.25, 3]) # amplitude
        P = choice([0.2, 0.5, 0.6, 0.75, 0.8, 1, 3, 5, 7, 15]) # choose period, report k
        b = choice([0.25, 0.5, 0.75, 1,2,3]) * choice([-1,1]) # horiz shift
        c = randrange(0.1, 1, 0.1) * choice([-1, 1]) # midline
        sinusoid = choice([a*sin((2*pi/P)(t-b))+c, a*cos((2*pi/P)(t-b))+c])
        sinusoids = [{
            "sinusoid": sinusoid,
            "amplitude": a,
            "period": P,
            "phase": b,
            "midline": c,
            "findformula": True,
            "filename": "find",
        }]
        a = randrange(1, 100, 0.1) * choice([-1,1]) # amplitude
        P = choice([0.2, 0.5, 0.6, 0.75, 0.8, 1, 3, 5, 7, 15]) # choose period, report k
        b = choice([0.25, 0.5, 0.75, 1,2,3]) * choice([-1,1]) # horiz shift
        c = randrange(0.1, 1, 0.1) * choice([-1, 1]) # midline
        sinusoid = choice([a*sin((2*pi/P)(t-b))+c, a*cos((2*pi/P)(t-b))+c])
        sinusoids += [{
            "sinusoid": sinusoid,
            "amplitude": a,
            "period": P,
            "phase": b,
            "findfeatures": True,
            "midline": c
        }]
        return {
            "sinusoids": sinusoids
        }

    @provide_data
    def graphics(data):
        """
        Variables generated above are available in the
        data dictionary (see `data["lines"]` below). Graphics
        take a long time to generate and take up a lot of
        space on the disk, so consider carefully if they are necessary.

        This should return a dictionary of the form
        `{filename_string: graphics_object}` which will each produce
        `f"{filename_string}.png}"`.
        """
        return {
            graph_data["filename"]: plot(graph_data["sinusoid"])
            for graph_data in data["sinusoids"]
        }