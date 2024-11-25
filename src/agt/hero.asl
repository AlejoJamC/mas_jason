//STUDENT NAME:
//STUDENT ID:

// Rules
// The rule at(P): The Hero is at the position of agent P (variable),
// if agent P's position is identical to Hero's position.
// Beliefs
// The belief that the hero is located at the same positions as the agent P.
at(P) :- pos(P,X,Y) & pos(hero,X,Y).


// Initial objective to be achieved by the agents
// The !started command represents an achievement goal that the agent attempts
// to fulfill by executing the plan associated with the event +!started.
!started. 


// Plans and Events
// [ +! ] indicates that the agent is adopting the achievement goal !started 
// described above.
+!started :true <- 
// true means the plan has no specific conditions for execution—it will always execute 
// whenever the triggering event occurs.
   .print("The Agents have been initialized");
   .print("I'm not scared of that smelly Goblin!").


// Another goal or a subgoal to achieve by the agents, in this case move though the grid.
// The [ ! ] indicates another achievement goal the agent must attempt to fulfill as part of this plan.
!check(slots).

// ===================
// ===================
