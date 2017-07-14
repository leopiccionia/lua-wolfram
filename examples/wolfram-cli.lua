#!/usr/bin/env luajit
local cli = require 'cliargs'

cli:argument('query', 'Query to Wolfram|Alpha server.')
cli:option('-f, --full', 'Whether to return full results.', false)

local args = assert(cli:parse(_G.arg))

local WolframAlpha = require 'wolfram'
local wolfram = WolframAlpha('YOUR-API-KEY-HERE')

if not args.full then
    local body = assert(wolfram:query(args.query))
    print(body)
else
    local body = assert(wolfram:full_query(args.query))
    for key, pod in pairs(body) do
        print(key .. ':')
        for subkey, subpod in pairs(pod) do
            if type(subkey) == 'string' then
                print('\t' .. subkey .. ':')
                print('\t\t' .. subpod)
            else
                print('\t' .. subpod)
            end
        end
    end
end