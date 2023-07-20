from sage.all import * 

class Generator(BaseGenerator):
    def data(self):
        t = var('t')
        a = choice([0.7, 0.8, 1.75, 2.25, 3]) # amplitude
        P = choice([0.2, 0.5, 0.6, 0.75, 0.8, 1, 3, 5, 7, 15]) # choose period, report k
        b = choice([0.25, 0.5, 0.75, 1,2,3]) * choice([-1,1]) # horiz shift
        c = choice([0.2, 0.3, 0.5, 0.75, 1]) * choice([-1, 1]) # midline
        a = round(a, 2)
        P = round(P, 2)
        b = round(b, 2)
        c = round(c, 2)
        # plotting domain:
        left = min(-1, b-P/4); right = max(1, b+5*P/4)
        domain = (t, left, right)
        fn = choice([sin, cos])
        # choose some points for labeling:
        if fn == sin:
            pts = [
                (b      , c),
                (b+P/4  , c+a),
                (b+P/2  , c),
                (b+3*P/4, c-a)
            ]
        else:
            pts = [
                (b      , c+a),
                (b+P/4  , c),
                (b+P/2  , c-a),
                (b+3*P/4, c)
            ]
        pts = sample(pts, 2)
        # a line at either the top or the bottom of the function
        tb = choice([
            plot(c+a, domain, color = 'green') +  
                text("y=%s"%round(c+a, 2), 
                     (right, c+a),
                     color = 'green',
                     vertical_alignment = 'bottom'),
            plot(c-a, domain, color = 'green') +  
                text("y=%s"%round(c-a, 2), 
                     (right, c-a),
                     color = 'green',
                     vertical_alignment = 'top')
        ])
        sinusoid = a*fn((2*pi/P)*(t-b))+c
        sinusoids = [{
            "sinusoid": sinusoid,
            "fn": fn,
            "amplitude": a,
            "period": P,
            "phase": b,
            "midline": c,
            "findformula": True,
            "filename": "find",
            "domain": domain,
            "pts": pts,
            "tb": tb
        }]
        a = choice([0.7, 0.8, 1.75, 2.25, 3]) # amplitude
        P = choice([0.2, 0.5, 0.6, 0.75, 0.8, 1, 3, 5, 7, 15]) # choose period, report k
        b = choice([0.25, 0.5, 0.75, 1,2,3]) * choice([-1,1]) # horiz shift
        c = choice([0.2, 0.3, 0.5, 0.75, 1]) * choice([-1, 1]) # midline
        fn = choice([sin, cos])
        sinusoid = a*fn((2*pi/P)*(t-b))+c
        sinusoids += [{
            "sinusoid": sinusoid,
            "fn": fn,
            "amplitude": round(a, 2),
            "period": round(P, 2),
            "phase": round(b, 2),
            "midline": round(c, 2),
            "findfeatures": True
        }]
        shuffle(sinusoids)
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
        for graph_data in data["sinusoids"]:
            try: graph_data["findformula"]
            except: continue
            G = plot(graph_data['sinusoid'], graph_data['domain'])
            G += graph_data['tb']
            G += points(graph_data['pts'], color ='red')
            for pt in graph_data['pts']:
                G += text('  (%s, %s)'%(round(pt[0], 2),
                                        round(pt[1], 2)),
                          pt,
                          horizontal_alignment='left',
                          vertical_alignment='top',
                          color='red')
            return {
                graph_data["filename"]: G
            }