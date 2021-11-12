# Modular Font Editor K

<img src="https://raw.githubusercontent.com/MFEK/docs/master/blob/logo.png" width="250">

**Modular Font Editor K** (MFEK) is an open source (Apache 2.0 licensed) modular font editor. It attempts to apply the Unix adage that each program should do one thing and do it well to a GUI font editor.

MFEK is still very alpha, and many parts are missing (including a good website!). You can help!

**[Why MFEK?](https://github.com/MFEK/docs/blob/master/doc/Why.md)**

To pull all modules, why not use this script?

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/MFEK/docs/master/blob/pull_all_modules.sh)"

To see who wrote an MFEK module, check its `AUTHORS` file. The two main authors of MFEK are Fredrick R. Brennan (@ctrlcctrlv) and Matthew Blanchard (@MatthewBlanchard).

## Current roadmap as of 2021-11-02
![Current roadmap as of 2021-11-02](https://raw.githubusercontent.com/MFEK/docs/master/roadmap/roadmap.png)
### Roadmap key
* Dotted line around module name — module not started.
* Dashed line around module name — module started, yet far from completion.
* No line around module name — module is still far from being begun, and may indeed be unnecessary and never be begun.
* A bold black arrow represents a program calling a program.
* A red arrow represents a program including a library.
* A black arrow represents a library including a library.
* All libraries and programs are assumed to be in Rust unless noted otherwise.

## Modular programs

* [`MFEKglif`](https://github.com/MFEK/glif) (.glif editor w/planned Spiro support)
* [`MFEKstroke`](https://github.com/MFEK/stroke) (applies different kinds of strokes to .glif files with open contours)
* [`MFEKmetadata`](https://github.com/MFEK/metadata) (UFO metadata querier)
* [`MFEKabout`](https://github.com/MFEK/about) (MFEK's about screen)

### Planned

* `MFEKufo` (a launcher for MFEKglif that displays all glyphs)
* `MFEKdesignspace` (design space XML creator/editor)
* `MFEKtransform` (transform, skew glyphs w/CLI options / GUI)
* `MFEKinterpolate` (an interpolation confirmer / tester)
* `MFEKmetrics` (load UFO file into HarfBuzz and output typed text, edit horizontal/vertical kerning and bearings)
* `MFEKopentype` (OpenType layout editor based on @simoncozens' ideas)
* `MFEKexport` (frontend to fontmake)

#### Far off

* `MFEKpshints` (Add PostScript hints to glyphs and test them)
* `MFEKtruetype` (basically would be an open source version of Visual TrueType (VTT))

## Libraries

* [`glifparser.rlib`](https://github.com/MFEK/glifparser.rlib) (a .glif parser)
  * [`integer-or-float.rlib`](https://github.com/MFEK/integer_or_float.rlib) (implements a .glif data type)
  * <sub><sup>(We need this because Norad has no support for `<lib>` in `.glif` files, and due to how they went about implementing Norad, fixing that is trickier than having my own glyph parser. Furthermore, as I plan to support Spiro, B-Splines, etc., through UFO format extensions, I should have one anyway.)</sup></sub>
* [`icu-data.rlib`](https://github.com/MFEK/icu-data.rlib) (Unicode ICU data without C libicu, currently only encodings)
* [`ipc.rlib`](https://github.com/MFEK/ipc.rlib) (_very_ basic inter-process communication functions)
* [`math.rlib`](https://github.com/MFEK/math.rlib) (implements algorithms for MFEKstroke: Pattern-Along-Path, Variable/Constant Width Stroke, etc.)

### Planned

* libskef (Port of @skef's &laquo;Expand Stroke&raquo; feature to a reusable C API. Will likely also require `SplineSet` type from FontForge.)
* spiro-rs (Port of libspiro to Rust, probably will be done via `bindgen`)
