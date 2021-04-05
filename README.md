<h1 align="center">Virgil</h1>

<p align="center">
    <a href="#dependencies">Dependencies</a> |
    <a href="#compiling--running">Compiling & Running</a>
</p>

A basic demo showcasing Virgil and used as a test bed for features.

### Dependencies

---

- `virgil` (if installed system wide)
- `libsdl2-2.0-0` (if compiling with virgil as a subproject)

### Compiling & Running

---

The demo can be compiled with Virgil multiple ways, you can install Virgil system wide as either a static library or shared library as shown on the [Virgil Compiling Steps](https://www.github.com/lxmcf/virgil#compiling) and link to the demo or by using virgil as a subproject...

```bash
# If using Virgil as a meson subproject
meson build -Duse-subproject=true --default-library=static
ninja -C build
build/virgil-demo

# If using Virgil as a system wide install
meson build
ninja -C build
build/virgil-demo
```
