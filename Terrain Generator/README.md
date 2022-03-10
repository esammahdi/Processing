TerrainGenerator: A Procedual 3D Terrain Generator
=================================================

A simple procedual 3D terrain generator made using *[Processing Language](https://processing.org/)* , meant as a project for a Computer Graphics class. However, it has been extended with functionalaties like WholeImage mode, which will use the terrain grid squares as pixels and paint an image over the mooving terrain. And texture mode, which will map a texture to the grid (see: [Usage](#usage).)

[![License](https://img.shields.io/badge/License-CC0-lightgray.svg?style=flat-square)](https://creativecommons.org/publicdomain/zero/1.0/)
[![Latest release](http://img.shields.io/badge/beta-0.1.0-blue.svg?style=flat-square)](https://github.com/mhucka/readmine/releases)



Table of contents
-----------------

* [Introduction](#introduction)
* [Installation](#installation)
* [Usage](#usage)
* [Known issues and limitations](#known-issues-and-limitations)
* [License](#license)
* [Authors and history](#authors-and-history)
* [Acknowledgments](#acknowledgments)


Introduction
------------

A simple procedual 3D terrain generator made using [Processing](https://processing.org/) Language, meant as a project for a Computer Graphics class. The initial goal was to learn how to turn a basic 2D grid into a moving 3D terrain, but it later evolved into displaying pictures and textures on the grid.

The program offers a UI that allows the user to tweak various parameters such as the width/height of the grid, movement speed/direction ...etc. The changes are reflected in the rendered scene immediatlly.

The program also demonstrates the importance of having a good organic noise generating algorithm, as the psuedo-random algorithm that comes with most programming languages just does not make it.

Installation
------------

The only prerequisite needed to launch the app is having java (v.17+) installed on your machine. After that you can just run the executable in the 
[application.windows](application.windows) folder!\
Alternatively, you can also use processing editor to compile the code and bundle the java installation with it, which will eliminate the need to install java seperately.

Usage
-----

Nothing special needed for starting the app, just launch the executable. After that you should be greeted with a screen lik below : 
<p align="center">
  <img width="700" align="center" src="https://github.com/esammahdi/Processing/blob/main/Terrain%20Generator/.github_usercontent/javaw_MLv45cfaR4.png" alt="Start screen"/>
</p

### Basic operation

The program offers various features to try:

1. Noise Algorithm :
  Perhaps one of the most important point about the program, as the entire idea of the project is to draw a 2D grid and then give it a 3D illusion by rotating the x axies of the scene and giving the points random Z values between a given range. As mentioned above the progranm demonstrates the need for organic noise generating algorithms (sometimes even dedicated hardware), as normal pseudo-random algorithms does not make it.\
  The program uses *[Perlin Noise](https://en.wikipedia.org/wiki/Perlin_noise)* algorithm, a type of gradient noise developed by [Ken Perlin](https://en.wikipedia.org/wiki/Ken_Perlin), and will allow you to compare it with the normal pseudo-random algorithm provided with Java.
  <p align="center">
  <img width="700" align="center" src="https://github.com/esammahdi/Processing/blob/main/Terrain%20Generator/.github_usercontent/javaw_MLv45cfaR4.png" alt="Start screen"/>
</p
1. Width/Height, Rotation Angles, Fill, Stroke, Speed, Direction and other parameters : 
2. Mesh Type :
3. Lightning :
4. Texture Mode :
5. WholeImage Mode :


Finally, the [Authors and history](#authors-and-history) section should inform readers who the authors are; it is also a place where you can acknowledge other contributions to the work and the use of other people's software or tools.


Known issues and limitations
----------------------------
+ Camera Issue :
+ Images in WholeImage mode are blurry and unclear :
+ UI elements may going over the screen :
+ Wrong vertex selection for some mesh types : 
+ Sliders initial values :


License
-------

This program is distributed under the terms of the [Creative Commons 1.0 Universal license (CC0)](https://creativecommons.org/publicdomain/zero/1.0/).  The license applies to this file and other files in the [GitHub repository](https://github.com/esammahdi/Processing/edit/main/Terrain%20Generator/) hosting this file.


Authors and history
---------------------------

In this section, list the authors and contributors to your software project.  (The original author of this file is [Mike Hucka](http://www.cds.caltech.edu/~mhucka/).)  Adding additional notes here about the history of the project can make it more interesting and compelling.


Acknowledgments
---------------

If your work was funded by any organization or institution, acknowledge their support here.  In addition, if your work relies on other software libraries, or was inspired by looking at other work, it is appropriate to acknowledge this intellectual debt too.  For example, in the process of developing this file, I used not only my own ideas and experiences &ndash; I read many (sometimes contradictory) recommendations for README files and examined real READMEs in actual use, and tried to distill the best ideas into the result you see here.  Sources included the following:


* https://github.com/davidbgk/open-source-template/
* https://www.makeareadme.com
* https://github.com/lappleapple/feedmereadmes
* https://github.com/badges/shields
