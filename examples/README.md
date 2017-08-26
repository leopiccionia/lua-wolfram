# Example

A terminal client for Wolfram|Alpha written in Lua, with nice pretty-printing.

## How to run

Running `lua wolfram-cli.lua --help` prints the following:

```
ARGUMENTS:
  query      Query to Wolfram|Alpha server. (required)

OPTIONS:
  -f, --full Whether to return full results.
```

## Additional dependencies

Apart from package's dependencies, these are additional dependancies for running this package:
* [cliargs](https://luarocks.org/modules/amireh/lua_cliargs)
* [lua-term](https://luarocks.org/modules/hoelzro/lua-term)