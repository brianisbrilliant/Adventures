# Author: Michael Mendez & Brian Foster
# Title: Island - A story arc in the game 'Adventure'

// look at this later: https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md#conditional-choices

You’re on a pirate ship, chained to an oar in the brig. You are one of many prisoners rowing. The ship is under attack and you can hear cannonfire and shouts from the deck. 
-> brig

=== brig ===



What will you do?

// break free with sword, cannonball breaks oar, convince the boatswain


*   [Try to break free with a stashed sword] 
    -> swordChain
+   [Try to convince the boatswain to free you] 
    -> convinceBoatswain
+   [wait] Patience is a virtue... 
    -> luckycannonball

    = luckycannonball
    {~||||A Cannonball from the other ship breaks your oar-> upToDeck}
    -> brig

    = swordChain
    You try to cut the chain...
    {~You swing the sword and cut the chain, then you cut down the boatswain-> upToDeck|You swing the sword and miss, chopping off your hand. You will be left to bleed to death-> brigDeath|The boatswain notices your sword and swiftly gores you with his own blade-> brigDeath|You swing the sword and it doesn't break the chain. The boatswain notices and cuts you down-> brigDeath}
    -> DONE
    
    = brigDeath
    .
    Life isn't worth much in the brig of a pirate ship.
    -> upToDeck.constructionZone

    = convinceBoatswain
    You try to convince the boatswain.
    	// 25% chance
    *   Appeal to his humanity 
    	{~Turns out he doesn't have any humanity.-> luckycannonball|He laughs in your face and walks away. -> luckycannonball|He beats you terribly for assuming he has any humanity. What were you thinking? -> luckycannonball|Your persuasiveness works!?! -> upToDeck}
    *   Swear to fight for the crew 
    	// 50% chance
    	{~ He understands the need and hands you a sword-> upToDeck|He doesn't trust you with a sword-> luckycannonball}
    +   ->
    	He won't hear any more talk from you. -> luckycannonball
-> DONE

=== upToDeck ===
!
You climb the ladder towards fire, explosions, clashing swords, and death. Once on deck, take a moment to take stock of the situation. You see pirates fighting each other on the ship you're on, and more pirates are swinging from an adjacent ship on the starboard side to join the fray. A quick look up shows you that both ships are flying pirate colors. On the leeward side, you see land that isn't too far away. -> shipchoice

= shipchoice

*   [Join the fray] You join the fray, attacking the next pirate that swings over from the other ship.-> shipattack
*   [Swim for shore] You leap overboard and swim for for the land you saw while your captors are distracted. -> constructionZone
*   [Get to the other ship] "The enemy of my enemy is my friend," you think to yourself. You grab a rope and swing from the rigging to the neighboring ship, escaping your captors. 
    As you land, you're immediately surrounded by a dozen or more pirates. You drop your sword. 
    **   "Please help me"[], you beg. "I was a prisoner on that ship, but I escaped during the fighting. I'll help you in this battle in exchange for my freedom, you can just drop me off anywhere after." 
    
    The pirates aboard share a raucous laugh before throwing you in their brig and chaining you to an oar. It turns out pirates can't be trusted. 
    -> otherbrig
    **   "Need some help, mates?" []you ask confidently. "I'm not with those guys, so I thought I'd come over and offer my help."
    The pirates look at you incredulously for a moment. One of them steps forward with a chuckle. "You're a fool if you think we'd trust you on our ship for a moment." 
    You have just one second to consider your mistake before he runs you through with his cutlass. turns out pirates are not very trusting. 
    -> shipdeath
    
= shipattack 
+   [Attack] You {~lunge at your opponent, catching him off guard and deciding the fight quickly.-> shipvictory|swing at your opponent. He {blocks, but is thrown off-balance, and unable to counterattack. -> shipattack|deflects your sword, creating an opening and efficiently running you through. -> shipdeath}} 

= shipvictory
The pirate's cutlass skitters across the deck. It's an obvious upgrade to the smaller blade you had, so you retrieve it and toss your old one. 
You scan the ship for another target, but realize that the cannonfire has taken its toll... The ship is taking on water, and clearly beyond saving. -> shipchoice
= shipdeath
Your first breath of freedom from captivity was also your last. Try again? ->END

= otherbrig
While an impressive coincidence, it's disappointing to have a glimpse of freedom, only to then find yourself right back where you started. 
-> brig
= constructionZone
... More of the story is coming, refresh the page to start over...


-> END


