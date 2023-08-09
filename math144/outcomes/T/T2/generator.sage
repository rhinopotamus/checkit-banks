from sage.all import *

class Generator(BaseGenerator):
    def data(self):
        ### PART A!
        angle1A = choice([pi/13, pi/11, pi/8, pi/7, pi/5, 2*pi/5])
        angle2A = pi/2 - angle1A
        length1A = choice(range(1,10))
        sideA = choice(["the hypotenuse", 
                       "the side adjacent to that angle", 
                       "the side opposite that angle"])
        if sideA == "the hypotenuse":
            hypA = length1A
            adjA = hypA * cos(angle1A)
            oppA = hypA * sin(angle1A)
        elif sideA == "the side adjacent to that angle":
            adjA = length1A
            hypA = adjA / cos(angle1A)
            oppA = adjA * tan(angle1A)
        else: # if sideA == "the side opposite that angle":
            oppA = length1A
            hypA = oppA / sin(angle1A)
            adjA = oppA / tan(angle1A)

        ### PART B!
        [side1B, side2B] = sample(["the hypotenuse", "one leg", "one leg"])
        if side1B == side2B: # they're both legs!
            side2B = "the other leg"
            [length1B, length2B] = sample(range(1, 10), 2)
            [adjB, oppB] = [length1B, length2B]
            hypB = sqrt(adjB^2 + oppB^2)
            angle1B = arctan(oppB / adjB)
            angle2B = arctan(adjB / oppB)
        elif side1B == "the hypotenuse": # we're in hyp-leg territory!
            [length2B, length1B] = sorted(sample(range(1,10), 2))
            hypB = length1B
            adjB = length2B
            oppB = sqrt(hypB^2 - adjB^2)
            angle1B = arcsin(oppB / hypB)
            angle2B = arccos(oppB / hypB)
        else: #side2B is the hypotenuse and side1B is a leg
            [length1B, length2B] = sorted(sample(range(1,10), 2))
            hypB = length2B
            adjB = length1B
            oppB = sqrt(hypB^2 - adjB^2)
            angle1B = arcsin(oppB / hypB)
            angle2B = arccos(oppB / hypB)
        

        ### PART C!
        [x, y, r, theta] = [var('x'), var('y'), var('r'), var('theta')]
        length1C = choice([x,y,r])
        if length1C == r:
            [v1, v2] = [y,x]
            length1C = choice(range(1,10))
            hypC = length1C
            adjC = x
            oppC = y
            ans1C = sqrt(length1C^2 - x^2)
            ans2C = length1C * sin(theta)
        elif length1C == x:
            [v1, v2] = [y, r]
            length1C = choice(range(1,10))
            hypC = r
            adjC = length1C
            oppC = y
            ans1C = sqrt(r^2 - length1C^2)
            ans2C = length1C * tan(theta)
        else: # if length1C == y:
            [v1, v2] = [x, r]
            length1C = choice(range(1,10))
            hypC = r
            adjC = x
            oppC = length1C
            ans1C = sqrt(r^2 - length1C^2)
            ans2C = length1C / tan(theta)
        
        
        return {
            "length1A": length1A,
            "sideA": sideA,
            "angle1A": angle1A,
            "angle2A": angle2A,
            "oppA": oppA,
            "adjA": adjA,
            "hypA": hypA,
            "side1B": side1B,
            "side2B": side2B,
            "length1B": length1B,
            "length2B": length2B,
            "angle1B": angle1B,
            "angle2B": angle2B,
            "oppB": oppB,
            "adjB": adjB,
            "hypB": hypB,
            "v1": v1,
            "v2": v2,
            "length1C": length1C,
            "oppC": oppC,
            "adjC": adjC,
            "hypC": hypC,
            "ans1C": ans1C,
            "ans2C": ans2C
        }

# NOTES:
# This works! The json-formatted lists pass back correctly.
# Annoyances:
# - Ordered list doesn't appear to be working correctly.
# - Sage renders pi-fractions weird.
# - I accidentally got a tan(3pi/2) whose value is undefined.