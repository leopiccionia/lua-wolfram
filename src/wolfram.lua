local http = require 'socket.http'
local json = require 'cjson'
local url = require 'socket.url'

local WolframAlpha = {

    full_query = function(self, input)
        local body, err = http.request(
            'https://api.wolframalpha.com/v2/query?appid=' .. self.appid
            .. '&input=' .. url.escape(input)
            .. '&format=plaintext&output=JSON'
        )

        if err >= 200 and err < 300 then
            local results = {}
            body = json.decode(body)

            for _, pod in ipairs(body.queryresult.pods) do
                local newpod = {}
                if pod.subpods then
                    for _, subpod in ipairs(pod.subpods) do
                        if subpod.plaintext ~= '' then
                            if subpod.title ~= '' then
                                newpod[subpod.title] = subpod.plaintext
                            else
                                table.insert(newpod, subpod.plaintext)
                            end
                        end
                    end
                end

                -- TODO: Infos
                if #newpod > 0 then
                    results[pod.title] = newpod
                end
            end
            results.Plots = nil
            return results
        else
            return nil, err
        end
    end,

    query = function(self, input)
        local body, err = http.request(
            'https://api.wolframalpha.com/v1/result?appid=' .. self.appid
            .. '&i=' .. url.escape(input)
            .. '&format=plaintext'
        )

        if err >= 200 and err < 300 then
            return body
        else
            return nil, err
        end
    end

}

setmetatable(WolframAlpha, {
    __call = function(self, appid)
        if not appid then
            error('AppID not informed.')
        end
        return setmetatable({
            appid = appid
        }, {
            __index = WolframAlpha
        })
    end
})

return WolframAlpha