#description:
# Welcomes new members to group and engages in small talk.

#Commands:
#hello- Responds with a hello message
#hi- same as hello
#how are you- Responds with a polite greeting
#send the joining message to me-Responds with the joining message
#tell me more about <channel-name>- sends descriptive information about the channel

#Author:
# the-ethan-hunt
welcome_message_1= [ 
"Hi",
"Hello",
"Hi there,",
"Hola"
]

welcome_message_2= [
"! Looks like you are a fresher here.",
"! Welcome to GDG Vadodara."
]

welcome_message_3= [
"It would be great to introduce yourself!",
"Why don't you tell us a bit about you?"
]

channels_info= [
"Hello, welcome to GDG's Slack!",
"The following is a list of channels and the type of dicussions the channel contains:",
"- #android -> Queries related to Android programmming are answered here",
"- #announcements -> announcements regarding the next GDG meet-up",
"- #app-and-projects -> Show off your latest app or project with reviews from experts!",
"- #general -> A general dicussion group",
"- #profiles -> Share your social profiles for better networking!",
"- #random -> A place for random jibber-jabber",
"- #sports -> A channel to discuss about any day to play. GDG is not just about coding!",
"- #support -> Speak out any complaint or feedback to the admins",
"- #web -> A channel to discuss latest webDev projects"].join('\n')
channel_descriptions = JSON.parse require("fs").readFileSync("channel_long_descriptions.json")
sorry_no_information= "Oops! It seems there is nothing known about this channel. Why don't you be a contributor here?"

plugin =(robot) ->
	robot.respond/ /(hello|hi)/i,(msg)->
		msg.send "Hi @#{msg.message.user.name)!"

	robot.respond /how are you/i, (msg) ->
		msg.send "Things are good, @#{msg.message.user.name}!What about you?"

	robot.respond /how is Google/i,(msg) ->
		msg.send "Google is awesome, @#{msg.message.user.name}!"

	robot.respond /(send the )?joining message( to me)?/i,(msg)->
		msg.send{room: msg.message.user.name},channels_info

	robot.respond /(tell me )?more about \#?([a-z-]+)/, (msg) ->
		channel_name = msg.match[2]
		channel_more_info = sorry_no_information
		if channel_descriptions[channel_name]
			channel_more_info= channel_desciptions[chaneel_name]
		robot.send {room: msg.message.user.name}, channel_more_info

	robot.enter(msg) ->
		if msg.message.room == "general"
			robot.send{ room: msg.message.user.name}, channels_info
			randNum = Math.floor(Math.random() =10)
			msg.send welocme_message_1[randNum % (welcome_message_1.length-1)] +\
				'@' + msg.message.user.anme + welcome_message_2[randNum % \ (welcome_message_2.length-1)] + welcome_message_3[randNum % \ (welcome_message_3.length-1)] + welcome_message_4
		else
			robot.send{room:msg.message.user.name},"Hey #{msg.message.user.name}, You just joined ##{msg.message.room}, here's more to know about this channel!"
			more_about_the_channel = sorry_no_information
			if channel_description[msg.message.room]
				more_about_the_channel = channel.descriptions[msg.message.room]
			robot.send {room: msg.message.user.name}, more_about_the_channel

module.exports = plugin
