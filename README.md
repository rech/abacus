# Abacus

[![Build Status](https://travis-ci.org/sungiant/abacus.png?branch=master)][status]
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)][mit]
[![Nuget Version](https://img.shields.io/nuget/v/Abacus.svg)][nuget]
[![Chat](https://img.shields.io/badge/gitter-join%20chat-green.svg)][chat]

## Overview

Abacus is a zero-dependency cross-precision 3D maths library for .NET, Mono and .NET Core, built with a primary focus on performance and efficiency.  Abacus is ideal for use developing real-time 3D applications and deterministic network simulations.  

Documentation for Abacus can be found [here][docs].

## Why?

Remember [XNA][xna]?  It was a popular framework for building games and 3D applications using C#; part of the framework consisted of an excellent maths library for use with floating point numbers.

On a number of occasions we found ourselves wanting to use XNA's maths library in C# projects of our own, yet we didn't want to be tied to the prerequisites imposed by XNA.  We also wanted the ability to use the same set of functionality with with differing levels of precision, i.e. a library that would expose the same API for working with 32-bit floating point numbers as it did for working with 64-bit floating point numbers and even 64-bit fixed point numbers.

Abacus aims to provide all of the features of the XNA maths library whilst also supporting multiple levels of precision.

## Getting started

Abacus is available as a stand-alone library via [nuget][nuget].  Here's an example nuget `packages.config` file that pulls in Abacus:

```xml
<?xml version="1.0" encoding="utf-8"?>
<packages>
  <package id="Abacus" version="0.9.2"/>
</packages>
```

Alternatively, as all code associated with each of Abacus' supported levels of precision gets generated into a single C# source file, it is easy to simply copy the appropriate [Abacus.XYZ.cs][sources] file for the precision you need straight into your project.

## So, what types are actually supported?

Abacus provides implementations of the following data types:

* `Vector2`
* `Vector3`
* `Vector4`
* `Matrix44`
* `Quaternion`

consistently across the following precisions:

* `Single` (`float`)
* `Double` (`double`)
* `Fixed32` (proof of concept)


## Status

Is Abacus ready to be used?  Yes indeed.

Abacus currently runs 638 unit tests with each build and has complete test coverage over both 32-bit and 64-bit floating point precision (`float` and `double`).

One goal of the project is for Abacus to consistently support mathematical operations and data types for more than just `float` and `double` precision numbers.  Abacus is being built to provide it's own implementations for various fixed point number formats and additional floating point number formats:

* `Fixed32`
* `Fixed64`
* `Fixed128`
* `Half`
* `Quadruple`

Currently full support for these types with full unit test coverage is the next step on the roadmap.

At this stage a working  `Fixed32` type is provided as a proof of concept, however, the unit tests associated with the type are currently disabled as in their present form they do not .


## Example usage

```cs
/**
 * Choose which level of precision to use simply by
 * commenting out all but the appropriate 'using'
 * statement:
 */

// using Abacus.SinglePrecision;
using Abacus.DoublePrecision;
// using Abacus.Fixed32Precision;

class Program
{
    public static void Main (string[] args)
    {
        var a = new Vector2 (-100, +50);
        var b = new Vector2 (+90, -70);

        var c = new Vector2 (-20, +5);
        var d = new Vector2 (+30, -5);
        
        Vector2 result;
        double amount = 0.4;
        
        Vector2.CatmullRom (ref a, ref b, ref c, ref d, ref amount, out result);
        
        System.Console.WriteLine ("result: " + result);
    }
}

```


## Roadmap

This roadmap gives some insight into what's next for the project.  We'd like to spend more time working on this project and get Abacus to version 1.6.x; if this is something you'd like to see happen too please show your support for the project by giving it a Github star and let us know on [Gitter][chat].

#### Version 0.9.x [COMPLETE]

MVP release.

- [x] Full support for `float` and `double`.
- [x] Full test coverage.
- [x] Proof of concept - Fixed 32 bit precision number data type (`Fixed32`).

#### Version 1.0.x

Full, tested support for a single fixed point real number.

- [ ] Finalised Fixed 32 bit precision number data type (`Fixed32`).
- [ ] Full unit test coverage configured with appropriate margins of error.

#### Version 1.2.x

New data types

- [ ] Plane type (`Plane`).
- [ ] Ray type (`Ray`).
- [ ] Full unit test coverage.

#### Version 1.3.x

New 3D bounding data types.

- [ ] Box type (`Box`).
- [ ] Sphere type (`Sphere`).
- [ ] Frustum type (`Frustum`).
- [ ] Full unit test coverage.

#### Version 1.4.x

New 2D bounding data types.

- [ ] Triangle type (`Triangle`).
- [ ] Quad type (`Quad`).
- [ ] Full unit test coverage.

#### Version 1.5.x

Increased support for fixed point.

- [ ] Fixed 64 bit precision number data type (`Fixed64`).
- [ ] Fixed 128 bit precision number data type (`Fixed128`).
- [ ] Full unit test coverage configured with appropriate margins of error.

#### Version 1.6.x

Additional support for floating point.

- [ ] Half precision floating point number data type (`Float16`).
- [ ] Quadruple precision floating point number data type (`Float128`).
- [ ] Full unit test coverage configured with appropriate margins of error.

## Technical Details

Authoring a consistent API for Abacus across multiple levels of precision presents techinical challenge because the C# language has limited support for experessing constraints for generics; for this reason Abacus has been built using a templatization mechanism to ensure a consitent API across precisions, this can be a little cumbersome to work with from an author's perspective, however, as a user it works well and brings the added benefit that the entire libary is generated into a small set of files (one for each level of precision), making Abacus easy to embed into any C# project.

## About the name

Abacus is named after a maths library that Ash worked with in the past when he was a programmer at [Black Rock Studio][br].

## Contributing

If you find a bug or have an issue please reach out via the GitHub Issue tracking system.  If you are using Abacus in a project of you own please show your support and let us know on [Gitter][chat].

## Donate

[![Become a patron](https://c5.patreon.com/external/logo/become_a_patron_button.png)](https://www.patreon.com/sungiant)

## License

Abacus is licensed under the **[MIT License][mit]**; you may not use this software except in compliance with the License.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[mit]: https://raw.githubusercontent.com/sungiant/abacus/master/LICENSE
[nuget]: https://www.nuget.org/packages/Abacus/
[sources]: https://github.com/sungiant/abacus/tree/master/source/abacus/src/main/cs
[xna]: https://en.wikipedia.org/wiki/Microsoft_XNA
[hacker]: https://www.hackerrank.com
[br]: https://en.wikipedia.org/wiki/Black_Rock_Studio
[status]: https://travis-ci.org/sungiant/abacus
[chat]: https://gitter.im/sungiant/abacus?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge
[docs]: http://sungiant.github.io/abacus/annotated.html


