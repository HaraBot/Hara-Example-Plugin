-- This plugin is for example purpose only, but you may modify the code to suit yourself.
--[[

	API Mapping:

	bot.prefix 
	bot.getClient()
	bot.requestBuffer(function())
	plugin.getDescription().*
	plugin.registerCommand(name, usage, function(message, args))
	plugin.pluginEnable(function())
	plugin.pluginDisable(function())
	plugin.registerEvent(eventName, function(event))
	emoji.getAlias(unicodeEmoji)
	emoji.getEmoji(alias)
	logger.info(message)
	logger.warn(message)
	logger.error(message)
	logger.debug(message)

]]--

plugin.pluginEnable(function()
	logger.info(plugin.getDescription():getName() .. " has been enabled!")
end)

plguin.pluginDisable(function()
	logger.info(plugin.getDescription():getName() .. " has been disabled! See you later.")
end)

bot.registerCommand("hello", "hello [name]", function(m, args)
	if args[1] ~= nil then
		bot.requestBuffer(function()
			-- If the client is being rate limited the message will be sent after the bucket clears.
			m:getChannel():sendMessage("Hello there " .. args[1])
		end)
	else
		bot.requestBuffer(function()
			m:getChannel():sendMessage("Hello " .. m:getMessage():getAuthor():getID())
		end)
	end
end)

bot.registerEvent(events.ReactionAddEvent, function(event)
	if emoji.getString(event:getReaction():toString()) == ":+1:" and event:getMessage():getAuthor():getID() == bot.getClient():getOurUser():getID() then
		bot.requestBuffer(function()
			event:getMessage():getChannel():sendMessage("I'm pleased you liked it " .. event:getUser():mention())
		end)
	end
end)
