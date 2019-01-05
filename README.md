# kakoune-grasp

[kakoune](http://kakoune.org) plugin to work with [grasp](http://www.graspjs.com/), the JavaScript AST query engine.

## Purpose

Kakoune already offers a lot of primitives to select portions of text :
simple keys (`w`), text-objects (like `<a-i>b`) or more complex regex crafting (`s`).

Grasp is a tool that transforms a JavaScript source file into a queryable Abstract Syntax Tree.
This way you can very easily ask for the location of all the `if (cond) { statements… }` blocks in the code:

```
grasp if <file>
```

Please refer to [grasp's documentation](http://www.graspjs.com/docs/) for further info about available queries.

This plugin lets you type grasp queries right from Kakoune's command line to quickly select all the bits you need:
arrays, booleans, arrow functions…

## Install

Add `grasp.kak` to your autoload dir: `~/.config/kak/autoload/`.

## Usage

It provides the following command: `grasp <engine> <mode> <query>`

- `<engine>` is `e` for equery or `s` for squery.
- `<mode>` is `all` which selects all occurrences of the buffer, or `main` which only selects what you asked only
- if it seats right under your main cursor (i.e. if you are inside a function body and query `func` it will only
select this specific function).
- `<query>` is passed to grasp. Use the autocompletion menu to guide you for common queries.

Command aliases are also available:

- `grasp-e`
- `grasp-s`
- `grasp-e-main`
- `grasp-s-main`

The `mode-grasp` command opens an info waiting for your next key:

```
a: array
A: array elements
b: block
c: call
e: else
f: func decl
F: func expr
i: if
I: if then
j: jsx element
J: jsx attr
k: key
l: lambda
m: method
o: object
O: object props
t: ternary
r: return
v: value

# Suggested mappings

map global normal <a-g> ':mode-grasp main<ret>' -docstring 'grasp s main'
map global normal <a-G> ':mode-grasp all<ret>' -docstring 'grasp s all'
```

## See also

- [kak-tree](https://github.com/ul/kak-tree)
- [eslint-formatter-kakoune](https://github.com/Delapouite/eslint-formatter-kakoune)
- [kakoune-flow](https://github.com/Delapouite/kakoune-flow)
- [kakoune-ecmascript](https://github.com/Delapouite/kakoune-ecmascript)
- [kakoune-typescript](https://github.com/atomrc/kakoune-typescript)

## Licence

MIT
