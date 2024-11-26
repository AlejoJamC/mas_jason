//STUDENT NAME:
//STUDENT ID:

// Rules
// The rule at(P): The Hero is at the position of agent P (variable),
// if agent P's position is identical to Hero's position.
// Beliefs
// The belief that the hero is located at the same positions as the agent P.
at(P) :- pos(P, X, Y) & pos(hero, X, Y).


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
!search_for_items.


// The subgoal encapsulates the agent's intention to fin the missing items.
// Moreover the plan is triggered when the agent adopt this subgoal 
+!search_for_items : not hero(gem) | not hero(coin) | not hero(vase) <- 
    next(slot); 
    !check_for_items. // the recursive behavior will be explain below

// Different contexts are specified here to show the conditions under which the plan is applicable:
// The hero does not yet have one or more of the items: gem, coin, or vase.
// - The logical operator | means “or.” This plan executes as long as at least one of the following is true:
// - The hero does not have the gem (not hero(gem)).
// - The hero does not have the coin (not hero(coin)).
// - The hero does not have the vase (not hero(vase)).
+!search_for_items : hero(gem) & hero(coin) & hero(vase) <- 
    !remember_goblin; // saving the location when is passing over it.
    !go_to_goblin. // Termination condition when all items are collected

// Check for each item at the hero's current position
+!check_for_items : gem(hero) <- 
    pick(gem); 
    .print("Gem collected!"); 
    !search_for_items.

+!check_for_items : coin(hero) <- 
    pick(coin); 
    .print("Coin collected!"); 
    !search_for_items.

+!check_for_items : vase(hero) <- 
    pick(vase); 
    .print("Vase collected!"); 
    !search_for_items.

// If the contexts remains true, it could means for instance:
// the hero has not yet collect all the items available in the environment
// the plan re-invokes !search_for_items recursively through the !check_for_items subgoal.
+!check_for_items : true <- 
    !search_for_items.

// Remember the goblin's position when passing over it
+!remember_goblin : pos(goblin, X, Y) <- 
    +pos(goblin_location, X, Y);
    .print("Goblin was detected!").

// Goal to go to the goblin after collecting all items
+!go_to_goblin : pos(goblin_location, X, Y) <- 
	.print("Going to the Goblin's location.");
    !move_to(X, Y); 
    !deliver_items.

// This fragment of the code defines a plan for the goal !move_to(X, Y). 
// The generic method/plan ensures the hero moves toward a specific target 
// location(X,Y) in the grid, recursively re-invoking until the destination is reached.
+!move_to(X, Y) : not at(goblin) <- // the context of the triggered event not at goblin
    move_towards(X, Y); // From the precepts and preconditions move towards(x,y) The hero will move one step towards the location stated.
    ?pos(hero, HX, HY); // this query the current position from hero's belief 
    .print("Moving: Current position (" , HX , "," , HY , ") -> Target (" , X , "," , Y , ")."); // this is visual message for debugging
    !move_to(X, Y).

// Debugging purpuses added the final location of the hero 
+!move_to(X, Y) : at(goblin) <- // when the context clause is true this helps to scape from the recusrive loop
    .print("Reached target position at (" , X , "," , Y , ").").

// Validate sequentially to deliver all collected items for the goblin
// and use actions from the preconditions drop, stash
// 
+!deliver_items : at(goblin) & not goblin(gem) & hero(gem) <- 
    drop(gem); 
    stash(gem); 
    .print("Delivered gem to the goblin."); 
    !deliver_items.

+!deliver_items : at(goblin) & not goblin(coin) & hero(coin) <- 
	drop(coin); 
	stash(coin); 
	.print("Delivered coin to the goblin."); 
	!deliver_items.

// This execution is secuencial but recursive and the last item vase in this fixed case
// invoke the competition goal for the agent.
+!deliver_items : at(goblin) & not goblin(vase) & hero(vase) <- 
	drop(vase); 
	stash(vase); 
	.print("Delivered vase to the goblin."); 
	!check_completion.

// This plan is the final step of the agent's sequence. Check all items have benn delivered
// to the goblin and extis with a message.
+!check_completion : not hero(gem) & not hero(coin) & not hero(vase) <- 
    .print("All items delivered successfully. Mission complete!").