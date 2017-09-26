# kakoune-grasp

[kakoune](http://kakoune.org) plugin to work with [grasp](http://www.graspjs.com/), the JavaScript AST query engine.

## Install

Add `grasp.kak` to your autoload dir: `~/.config/kak/autoload/`.

## Usage

It provides the following commands:

- `grasp-e`: select using grasp equery - i.e. the `function __ (__) { __ }` query will select all functions with a 1 expression body
- `grasp-s`: select using grasp squery - i.e. the `if.test` query will select the content of all `()` following if conditions

Please refer to [grasp's documentation](http://www.graspjs.com/docs/) for further info.

## See also

- [eslint-formatter-kakoune](https://github.com/Delapouite/eslint-formatter-kakoune)
- [kakoune-flow](https://github.com/Delapouite/kakoune-flow)
- [kakoune-ecmascript](https://github.com/Delapouite/kakoune-ecmascript)
- [kakoune-typescript](https://github.com/atomrc/kakoune-typescript)

## Licence

MIT
