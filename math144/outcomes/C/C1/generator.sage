from sage.all import * 

class Generator(BaseGenerator):
    def data(self):
        t = var('t') # only used for plotting the answer!
        # pick a center
        xc = randrange(-2, 3)
        yc = randrange(1, 6)
        center = (xc, yc)
        # arctan2 I guess, loolllll
        center_complex = sqrt(xc^2+yc^2)*exp(I*arctan2(yc, xc))
        # pick a circumference
        C = randrange(10, 20, 2)
        radius = C/(2*pi)
        deltad = C/8
        # pick a starting point: right, top, left, or bottom?
        theta0 = choice([0, pi/2, pi, 3*pi/2])
        # pick a direction
        direction = choice(["clockwise", "counterclockwise"])
        # you can plot points by complex coordinates, which is probably easier
        if direction == "counterclockwise":
            sinusoid = radius*sin(2*pi/C *t+theta0) + yc # hacky but works!
            pts = [center_complex + radius*exp(I*(theta0 + k*pi/4)) for k in range(5)]
            textlocs = [center_complex + 1.05*radius*exp(I*(theta0 + k*pi/4)) for k in range(5)]
        else:
            sinusoid = radius*sin(-2*pi/C *t+theta0) + yc
            pts = [center_complex + radius*exp(I*(theta0 - k*pi/4)) for k in range(5)]
            textlocs = [center_complex + 1.05*radius*exp(I*(theta0 - k*pi/4)) for k in range(5)]
        return {
            "center": center,
            "yc": yc,
            "circumference": C,
            'radius': round(radius, 3),
            "deltad": round(deltad, 2),
            "direction": direction,
            # some stuff that's just for graphics generation:
            "domain": (t, 0, C+deltad),
            "pts": pts,
            "textlocs": textlocs,
            'sinusoid': sinusoid,
            "circleplot": None,
            "sinusoidplot": None
        }

    @provide_data
    def graphics(data):
        circ = circle(data["center"], data["radius"]).plot()
        circ += point(data["center"])
        circ += text('(%s, %s)'%(data["center"][0], 
                                 data['center'][1]),
                                 data['center'],
                                 vertical_alignment = "top",
                                 horizontal_alignment = "left")
        circ += point(data["pts"])
        for k in range(5):
            circ += text('P%s'%k, 
                         (data['textlocs'][k].real(),
                          data['textlocs'][k].imag()))
        sinusoid = plot(data["sinusoid"], data["domain"])
        return {
            "circleplot": circ,
            "sinusoidplot": sinusoid
        }
        
"""
Variables generated above are available in the
data dictionary (see `data["lines"]` below). Graphics
take a long time to generate and take up a lot of
space on the disk, so consider carefully if they are necessary.

This should return a dictionary of the form
`{filename_string: graphics_object}` which will each produce
`f"{filename_string}.png}"`.
"""
