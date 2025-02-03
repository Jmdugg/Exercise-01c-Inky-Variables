/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
 Variable Checking:
 Equality: "charlie" == "charlie"
 not equality: 1 != 2
 Greater: >
 Less: <
 Great or Equal: >=
 less or equal: <=
 
 
*/

VAR Health = 5
VAR Lost_thing = ""
VAR clues = 0
VAR thing_name = ""
-> Memory

== Memory ==
It's dusk. You are deep in a forest. Dark trees tower over you. Moss and ferns line the forest floor. Sunlight creeps through the forest canopy. Despite the scenery you feel uneasy. You're looking for something...what is it?
* [A Ghost] 
~ Lost_thing = "Ghost" 
-> Forest_path
* [Your Brother]
~ Lost_thing = "Brother"
-> Forest_path


== Forest_path ==
{Call_out2:...what now?}
{not Right_path and not Left_path and not Clue_pickup: Right. {Lost_thing == "Ghost": {Lost_thing} hunting. You can't believe you let your friends convince you to do this. But, a dare is a dare, and you're no chicken. Local legend has it that in the darkest part of the woods, in the last hours of day, you can hear the Ghost's wails. You said you didn't believe it was true and got triple-dog-dared to find the ghost. Man this sucks.} {Lost_thing == "Brother": Your little {Lost_thing}. How far did he go? This is definitely cheating in hide and seek. If mom finds out you played close to the woods and your brother got lost she'll kill you! (You're also pretty worried about your brother)}}

You look up at the path before you. It forks in two directions. The Left path is slightly more worn down, it looks like a lot of people have been that way before. The Right path looks a little more overgrown, rocks and leaves cover it. 
{not Clue_pickup:There is something on the ground.} 

{Clue_pickup: You have {clues} clue(s).}
* {Lost_thing == "Ghost"} [Call out to Ghost] -> Call_out
* {Lost_thing == "Brother"} [Call out to your Brother] -> Call_out
+ [Take the Left path] -> Left_path
+ [Take the Right path] -> Right_path
* [Pick up the thing] -> Clue_pickup
+ {clues > 0} [Check clues] -> Check_clues

== Left_path ==
You start walking down the Left path. You know what they say, 'always take the road more traveled'...or at least you think that's the saying. Anyway, as you march deeper and deeper into the forest the tree canopy begins to close in on you. It gets so dark that you can barely see a couple feet in front of you. {candle_pickup or Flashlight: Now that you have this {Lost_thing == "Ghost": candle} {Lost_thing == "Brother": Flashlight} you should be able to go further.} {not candle_pickup and not Flashlight: Maybe you should go back and look for something to light the way...} 
+ {candle_pickup} [Continue] -> Clearing
+ {Flashlight} [Continue] -> Clearing
+ [Go Back] -> Forest_path
-> END

=== Clearing ===
You continue onwards with the {Lost_thing == "Ghost": candle} {Lost_thing == "Brother": flashlight} clutched tightly in your hands. The light casts strange shadows all around you. As you follow the path in between the trees you begin to hear a faint crying sound. {Lost_thing == "Ghost": Not like the "wail" of the Ghost but more like...a sad little kid.} 
-> END



== Right_path ==

{not Look_around1 or not Look_around2: Well, the Right path has to be the right path, right? You cautiously step over the fallen leaves and loose rocks. When you look up <>}
{Lost_thing == "Brother": you're at the old playground. Why did they choose to build a playground in the middle of the woods? We'll never know. But your brother loved playing here before your mom told you to stop going into the forest.} 
{Lost_thing == "Ghost": you're in a cemetery. The wind is whistling through the tree branches. Other than the wind, it's eerily silent.}
+ {Lost_thing == "Ghost"} [Look around] -> Look_around1
+ {Lost_thing == "Brother"} [Look around] -> Look_around2
+ [Go Back] -> Forest_path
-> END

=== Call_out ===
You open your mouth to call out to {Lost_thing == "Brother": your {Lost_thing}} {Lost_thing != "Brother": the {Lost_thing}}. But wait, what the heck was his name again?
+ [Will]
~ thing_name = "Will"
-> Call_out2
+ [Dustin]
~ thing_name = "Dustin"
-> Call_out2
+ [Hugh]
~ thing_name = "Hugh"
-> Call_out2
-> END

== Call_out2 ==
You remember now, {thing_name}. {Lost_thing == "Brother": The forest must be messing with your brain if you forgot your own brother's name.} You shout somewhat timidly, "{thing_name}! Are you there?!<>

{Lost_thing == "Ghost": Um...If you're there can you give me a sign or something? I really don't want to lose my allowance to my idiot friends..."}
{Lost_thing == "Brother": You can come out now, I promise I won't tell mom you ran away. Let's just go home, yeah?"}

+ [Silence] -> Forest_path


=== Look_around1 ===
{headstones: Poor kid. I wonder what happened to him.}
{headstones + investigate: You suddenly don't want to look for ghosts anymore.}
You look around at the aged headstones which are worn but still withstanding the test of time. Towards the back of the cemetery you can see a mausoleum. A faint yellowish glow is shining through the door that's cracked open. You really hope that isn't the ghost...

{headstones: You have {clues} clue(s).}

+ [Go to the mausoleum] -> mausoleum
* {Call_out2} [Look at the headstones more] -> headstones
+ {clues >= 1} [Check clues] -> Check_clues
+ [Go Back] -> Right_path
-> END

== headstones ==
You crouch down to the first headstone in front of you and read the inscription: "Here lies<>
{thing_name == "Will": Will B. Back}{thing_name == "Dustin": Dustin Ashes} {thing_name == "Hugh": Hugh Will Benext}. Beloved son, gone too soon." The dates on the headstone say that he was only 10 years old...
~ clues = clues + 1
+ [Go Back] -> Look_around1

== mausoleum ==
Given the creepy glow coming from inside, you think the mausoleum is your best bet at finding that Ghost. You cross the cemetery weaving through the rows of tombstones before finally stopping outside of the door. Bracing yourself you give it one big push and the door swings inward revealing...an altar? Maybe it's a shrine? 
+ [Investigate] -> investigate
+ [Go Back] -> Look_around1
-> END
== investigate
~ clues = clues + 1
On the top of a tomb rests at least ten candles surrounding a picture of a ten year old boy sporting a dorky grin that's missing a few teeth. In front of the shrine is a wilted boquet of flowers with a note that reads "{Call_out: Dear {thing_name},} I'm sorry I couldn't be a better sibling. I'm sorry I couldn't find you. Forgive me, we can play hide and seek when we meet again."
{investigate: You have {clues} clue(s).}
+ [Go Outside] -> Look_around1
+ {clues >= 1} [Check clues] -> Check_clues
* {Left_path} [Pick up candle] -> candle_pickup

== candle_pickup
Careful not to spill hot wax on yourself, you pick up the closest candle and a box of matches lying beside it.
+ [Go Back] -> investigate

== Look_around2 ==
Looking around you can see a rusted swing set, a slide, and a jungle gym. The swings sway gently in the breeze and make a creaking noise back and forth. It sends shivers down your spine. Your brother isn't here but maybe he stopped by. Maybe you should look around for clues...
* [Check the Swings] -> swings
+ {not Flashlight} [Check the slide] -> slide
* [Check the jungle gym] -> jungle_gym
+ [Go Back] -> Forest_path
-> END

== swings ==
There's not much that's super interesting about the rusty swings. You remember how one time you decided to jump off of them and broke your arm. You didn't want to even look at the swings for months after that, but you would still push your little brother on them. The hinges whine as the swings sway back and forth. What a terrible noise. You decide to walk away.
+ [Go Back] -> Look_around2
-> END

== slide ==
The slide is connected to the top of the jungle gym. It's one of those slides that looks like a big curly tube. You used to love the slide because the static from going down it would make your hair stand up. Your brother liked it too. You climb up and peer inside. There is no way this thing is OSHA certified anymore. {not Flashlight: Theres something at the bottom of the slide.}
* [Pick up thing] -> Flashlight
+ [Go Back] -> Look_around2
-> END

== jungle_gym ==
The jungle gym is pretty plain. Not like the new playgrounds they put in by your school. Its mostly rusty iron bars and some wooden platforms. You never could get the hang of the monkey bars but your Brother was always really good at them. 
+ [Go Back] -> Look_around2
-> END

=== Flashlight ===
You go to the bottom of the slide and pick up what appears to be a Flashlight. One click on and off tells you it that works. You pocket it. 
+ [Go Back] -> Look_around2
-> END



=== Clue_pickup ===
~ clues = clues + 1
{Lost_thing == "Ghost": You pick up the weird thing. Ugh it's covered in slime...or ectoplasm? Maybe the Ghost is nearby... The trail of goo leads to the Right.}
{Lost_thing == "Brother":You pick up the thing. It's one of your brother's toys. His favorite dinosaur that only has one horn. It broke off while your brother was playing with it and he cried for days. The dinosaur was lying in front of the Left path.}
* [Go Back] -> Forest_path
-> END


== Check_clues ==
{Lost_thing == "Ghost" and clues >= 1 and Clue_pickup: 1. Ectoplasm leading down the Right path}
{Lost_thing == "Ghost" and clues >= 1 and headstones: 2. Headstone reading "{thing_name}". It couldn't be the Ghost "{thing_name}"...could it?}
{Lost_thing == "Ghost" and clues >= 1 and investigate: 3.  A missing 10 year old kid. It looks like they never found him.}
{Lost_thing == "Brother" and clues >= 1 and Clue_pickup: 1. Your brother's toy dinosaur. It was lying in front of the Left path.}
+ {clues <= 1} [Go Back] -> Forest_path
+ {clues >= 2} [Go Back] -> Look_around1
-> END