//STUDENT NAME:
//STUDENT ID:

//Hero is at the position of agent P (variable), if agent P's position is identical to Hero's position 
at(P) :- pos(P,X,Y) & pos(hero,X,Y).


//Initial goal
!started.

/*
* In the event that the agent must achieve "started", under all circumstances, print the message.
*/
+!started 
   :true
   <- .print("I'm not scared of that smelly Goblin!").

