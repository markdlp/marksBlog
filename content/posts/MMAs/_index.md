---
title: "MMAs"
date: 2024-11-15T14:03:39Z
draft: false
---

### Parametric Study of a Microwave Absorber Based on Metamaterials.

_this post is pushed directly without preview as my windows pc cant handle docker 
along w/ every other program I ran for this all at once_

In the fall semester of academic year 2024-2025 I decided took upon a project in order to
design a microwave absorber based on metamaterials. In this post I will document the
progress as I learn and develop the cell and the modeling in order to lay everything
publicly available and also to short of understand better as I try and explain the process
to this figurative rubber ducky that _is_ my editor, not the one it _has_ because vs code 
pets is not very feature rich at the moment. Finally I have opened a GitHub repository
for the report that I'll eventually submit to my university and for based upon I'll be 
credited, it can be found [here](https://github.com/markdlp/ParametricStudy_MicrowaveAbsorberBasedOnMetamaterials).

So at first I start by designing a basic layout in CST..

for this I'll implement a three-layer structure:
- A dielectric Substrate w/ a metal Resonance Layer
- An Air Layer
- A Metal Copper Back-Plate

At first I'll place the substrate without the resonance layer: ![Substrate](img/substrate.bmp)
Later I'll place the metal resonance layer as well but there are a number of possible candidates
I think of trying to simulate whereas the vertical layout is pretty much fixed.

Without _further' ado_ I'll place the two other layers below Z=0, turn on the orthographic side
view to remove shadows and voila: ![verticaLayout](img/verticaLayout.bmp)
I think it really gives a sense of scale as the air layer truly shadows the other two.

Now its time to add the ring that is of the same material and thickness as the backplate and lies
on top of the dielectric substrate. ![ring](img/ring.bmp)

Now I'll try and perform a simulation using the frequency solver in CST just to get an idea 
how the component behaves, the boundaries will be periodic along the XY plate and I will add
absorbing conditions along the Z axis.