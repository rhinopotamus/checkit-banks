from sage.all import * 

class Generator(BaseGenerator):
    def data(self):
        t = var('t')
        a = choice([0.7, 0.8, 1.75, 2.25, 3]) # amplitude
        P = choice([0.2, 0.5, 0.6, 0.75, 0.8, 1, 3, 5, 7, 15]) # choose period, report k
        b = choice([0.25, 0.5, 0.75, 1,2,3]) * choice([-1,1]) # horiz shift
        c = choice([0.2, 0.3, 0.5, 0.75, 1]) * choice([-1, 1]) # midline
        fn = choice([sin, cos])
        sinusoid = a*fn((2*pi/P)*(t-b))+c
        sinusoids = [{
            "sinusoid": sinusoid,
            "fn": fn,
            "amplitude": round(a, 2),
            "period": round(P, 2),
            "phase": round(b, 2),
            "midline": round(c, 2),
            "findformula": True,
            "filename": "find",
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
            if graph_data["fn"] == sin:
                pts = [ # I should actually calculate and pass these in the generator.
                    (graph_data["phase"] , 
                     graph_data["midline"]),
                    (graph_data["phase"] + graph_data["period"]/4 , 
                     graph_data["midline"] + graph_data["amplitude"]),
                    (graph_data["phase"] + graph_data["period"]/2 , 
                     graph_data["midline"]),
                    (graph_data["phase"] + 3*graph_data["period"]/4 , 
                     graph_data["midline"] - graph_data["amplitude"])
                ]
            else:
                pts = [
                    (graph_data["phase"], 
                     graph_data["midline"] + graph_data["amplitude"]),
                    (graph_data["phase"] + graph_data["period"]/4 , 
                     graph_data["midline"]),
                    (graph_data["phase"] + graph_data["period"]/2 , 
                     graph_data["midline"] - graph_data["amplitude"]),
                    (graph_data["phase"] + 3*graph_data["period"]/4 , 
                     graph_data["midline"])
                ]
            pts = sample(pts, 2)
            G = plot(graph_data['sinusoid'], 
                     (t, -1, graph_data["phase"] + graph_data["period"]))
            # This needs better domain logic.
            G += points(pts, color ='red')
            for pt in pts:
                G += text('  (%s,%s)'%(pt[0],pt[1]),pt,horizontal_alignment='left',color='red')
            tb = choice([graph_data["midline"] + graph_data["amplitude"],
                         graph_data["midline"] - graph_data["amplitude"]])
            G += plot(tb, 
                      (t, -1, graph_data["phase"] + graph_data["period"]), 
                      color = 'green') + \
                    text("y=%s"%tb, 
                         (graph_data["phase"] + graph_data["period"], tb),
                         vertical_alignment = 'top',
                         horizontal_alignment = 'right',
                         color = 'green')
            return {
                graph_data["filename"]: G
            }