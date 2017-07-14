# lua-wolfram

**lua-wolfram** is an unofficial library for accessing plaintext results from [Wolfram|Alpha](https://www.wolframalpha.com), world's top computational knowledge engine.

## Installing

lua-wolfram is available in [LuaRocks](https://luarocks.org/modules/leopiccionia/lua-wolfram).

```
luarocks install lua-wolfram
```

## How to use

The API requires an AppID, that can be obtained [here](https://products.wolframalpha.com/api/).

```lua
local WolframAlpha = require "wolfram"
local client = WolframAlpha("YOUR-API-KEY-HERE")

local short_answer = assert(wolfram:query("What's the capital of USA?"))
local long_answer = assert(wolfram:full_query("square root of 2"))
```

Method `query()` returns the the most immediate interpretation of the query, as a string:

```lua
"Washington, District of Columbia, United States"
```

The method `full_query()`, on the other side, returns many views about the same query. It returns a table:

```lua
{
    ["Constant name"] = {
        "Pythagora's constant"
    },
    ["Continued fraction"] = {
        "[1; 2^_]"
    },
    ["All 2nd roots of 2"] = {
        "sqrt(2)≈1.4142  (real, principal root)",
        "-sqrt(2)≈-1.4142  (real root)"
    },
    ["Input"] = {
        "sqrt(2)"
    },
    ["Decimal approximation"] = {
        "1.414213562373095048801688724209698078569671875376948073176…"
    }
}
```

Please notice that subtables can contain both numerical and textual indexes (i.e. act as array, dictionary, or both).

## Examples

Please look at [examples](/examples) folder.