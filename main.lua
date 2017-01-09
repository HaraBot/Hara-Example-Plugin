-- This plugin is for example purpose only, but you may modify the code to suit yourself.

bot.enablePlugin(function()
    bot.log("info", bot:getDescription():getName() .. " has been enabled!")
end)

bot.disablePlugin(function()
    bot.log("info", bot:getDescription():getName() .. " has been disabled! See you later.")
end)

bot.registerCommand("hello", "hello [name]", function(m, args)
    if args[1] ~= nil then
        m.channel:sendMessage("Hello there <@" .. args[1] .. ">")
    else
        m.channel:sendMessage("Hello <@" .. m.author.name .. ">")
    end
end)
