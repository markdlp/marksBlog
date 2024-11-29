---
title: "MMAs"
date: 2024-11-15T14:03:39Z
draft: false
---
{{< katex >}}
### Parametric Study of a Microwave Absorber Based on Metamaterials.

_this post is a work in progress_

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

Then I will move the substrate, air and backplate layers all below Z=0 just ti make is easier
with designing the arrows. For this I make the assumption that both the arrow body and point are
\\(\alpha = 0.5mm\\) of width. ![nonparallel](img/parallel.png)
In order to accurately place all the curve points that define the arrow some basic calculations
shall be made. The two points of the arrow base lie exactly on the arc of the ring and are 
equidistant from curve y=x so the in order to find their cartesian coordinates the following
system shall be solved. 

```matlab
syms x1 x2

eq1 = 2*(x1 - x2)^2 == .5^2;
eq2 = sqrt(x2^2 + x1^2) == 2.7;

sol = solve([eq1, eq2], [x1 x2]);
disp([sol.x1 sol.x2]);
```
$$
    \displaystyle \begin{array}{l} \left(\begin{array}{cc} \sigma_3 -\frac{2916\,\sigma_1 }{1433} & -\sigma_1 \newline \sigma_4 -\frac{2916\,\sigma_2 }{1433} & -\sigma_2 \newline \frac{2916\,\sigma_1 }{1433}-\sigma_3  & \sigma_1 \newline \frac{2916\,\sigma_2 }{1433}-\sigma_4  & \sigma_2  \end{array}\right)\newline\newline \textrm{where}\newline \sigma_1 =\sqrt{\frac{729}{200}-\frac{7\,\sqrt{59}}{80}}\newline \sigma_2 =\sqrt{\frac{7\,\sqrt{59}}{80}+\frac{729}{200}}\newline \sigma_3 =\frac{400\,{{\left(\frac{729}{200}-\frac{7\,\sqrt{59}}{80}\right)}}^{3/2} }{1433}\newline \sigma_4 =\frac{400\,{{\left(\frac{7\,\sqrt{59}}{80}+\frac{729}{200}\right)}}^{3/2} }{1433}\end{array}
$$

Which results in two points/quadrant so picking out the two points of the 1st quadrant and 
inserting them to CST the arrow body is parallel again ![corrected](img/corretArrowBase.png)

Then the arrow is mirrored against the X, the Y and the XY planes in order to reach all four 
sides of the cell, then the face is covered with copper and a height of d=0.035mm is also 
attributed, which is why it was important to move all other layers below Z=0. ![mirrored](img/mirroredArrows.png)
![rna](img/RingAndArrows.png)

Now I'll try and perform a simulation using the frequency solver in CST just to get an idea 
how the component behaves, the boundaries will be periodic along the XY plate and I will add
absorbing conditions along the Z axis.

For reference the mesh with only the ring element on the surface ends up such as: ![onlyRing](img/mesh.png)