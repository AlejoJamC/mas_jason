# The forest, the goblin and the hero - Preconditions 

## Premise
Grodor the Goblin has stolen some of your items. In order for him to return them, he has sent you on a quest to search the forest and collect particular items of great value to him: a coin, a vase, and a gem. You need to collect these items, and then return to Grodor the Goblin and give them to him. Upon further consideration, you have decided that the forest is far too dangerous for you to be wandering around alone, so you have decided to employ an agent who will do the task for you.

## Brief
In the Jason project environment [~/env/ForestEnv.java](./env/ForestEnv.java) will find the correct test environment that you can use to check and demonstrate particular functionalities of the agent.

[~/agt/hero.asl](./src/agt/hero.asl) The Hero agent.

[~/agt/goblin.asl](./src/agt/goblin.asl) The Goblin agent.

### Task 1
Your task is to write the Hero agent, within the file `~/agt/hero.asl.` The agent’s task is described below, along with useful details about the environment. Your agent should be presented only in `~/agt/hero.asl`, as that is the only file which will be assessed. **You are not to make any changes to the behaviour of the environment**, *though you may add your own configuration of object placement* if you wish.

### Task 2
To demonstrate that your agent is working it may be helpful to also refer to specifics about the environment configuration. You should consider carefully how your environment is configured (ie: where are objects placed?). You can use the provided test environments to demonstrate the functionality of the agent.

## Required Functionality of Hero Agent
The hero agent is to move through the environment in a systematic way. 

It should collect:
- one (1) vase
- one (1) coin
- one (1) gem

Upon collecting these items, it should then move to where the goblin is, and drop the items at the goblin. 

If it does not find all three times, then it should not visit the goblin.

A rule has been placed in `~/agt/hero.asl` for you. This rule is at(P). This rule will state whether it is true that the Hero agent is in the same position as the agent named in the parameter P. For example, if there is an agent named “philby” within the system, then adding the achievement goal !at(philby) will instruct the hero agent to achieve the state of affairs where it is at the same position in the grid as the agent “philby”. If you wish to use this rule, you must define and implement an applicable plan.

Your code within the hero.asl file should contain your name and student ID at the top, and it should be well commented - it is very important to convey your understanding through these comments.

## The Goblin Agent
The goblin agent (given for you in `~/agt/goblin.asl`) is waiting in his given position (this is defined by the environment), and he will stash an item that is dropped in his location, should it be a coin, gem, or vase.

## The Forest Environment
The forest environment consists of an 8x8 grid, each square representing the location within the forest. Within several squares of the forest, there will be items that the Hero Agent can choose to pick up, if so desired. There may be a teleporter present (this is a square labelled as T) in the environment which teleports the hero to a different spot in the forest. The environment has several percepts and actions that can be utilised by the agent. These are:

### Percepts
`pos(hero, x, y)` The hero agent is at the position (x,y)

`pos(goblin, x, y)` The goblin agent is at the position (x,y)

`gem(hero)` The hero is at a position that contains a gem

`coin(hero)` The hero is at a position that contains a coin

`vase(hero)` The hero is at a position that contains a vase

`gem(goblin)` The goblin is at a position that contains a gem

`coin(goblin)` The goblin is at a position that contains a coin

`vase(goblin)` The goblin is at a position that contains a vase

`hero(coin)` The hero is currently holding a coin

`hero(vase)` The hero is currently holding a vase

`hero(gem) ` The hero is currently holding a gem

### Actions
`next(slot)` The hero will advance its position to the next one in the forest. This is on a left-to-right, top-to-bottom sequence. Once the hero agent reaches the final position of the forest, it will advance to the start position (in a wrap-around fashion).

`move towards(x,y)` The hero will move one step towards the location stated.

`pick(coin)` Hero will pick up the coin object in the current position, if there is one.

`drop(coin)` Hero will drop the coin object, should they have one, in the current position.

`stash(coin)` The Goblin will pick up the coin object that is in his current position and stash it. There is no percept to signal that the goblin has stashed an item.

`pick(gem)` Hero will pick up the gem object in the current position, if there is one.

`drop(gem)` Hero will drop the gem object, should they have one, in the current position. The hero will then advance to the next position.

`stash(gem)` The Goblin will pick up the gem object that is in his current position and stash it. There is no percept to signal that the goblin has stashed an item.

`pick(vase)` Hero will pick up the vase object in the current position, if there is one.

`drop(vase)` Hero will drop the vase object, should they have one, in the current position. The hero will then advance to the next position.

`stash(vase)` The Goblin will pick up the vase object that is in his current position and stash it. There is no percept to signal that the goblin has stashed an item.

### Environmental Configurations
There are several preset environmental configurations provided. To select between these presets, you need to modify the argument on line 3 of ~/forest.mas2j. For example, environment: csck504.ForestEnv(0) and environment: csck504.ForestEnv(1) would instantiate different presets (preset 0, and preset 1, respectively). The presets are described in the table below.

In all of the environmental presets, the following remain true:

The forest will always be an 8x8 grid
The presence or placement of objects and agents within the forest will not change once instantiated (ie: it is not a dynamic environment).
The hero agent will always start in position 0,0.

|  Preset | Key Highlight  |
|---|---|
| 0 |  All items present |
| 1 |  Not all items present |
| 2 |  Goblin in random position |
| 3 |  Some duplicate items present |
| 4 |  A teleporter is present |
| 5 |  A random configuration |

## Tips for Code
Your hero agent should do as is described above. A basic implementation would be expected to collect the three items (if present) and drop them at the goblin. More advanced implementations would deal with the teleporter and deal with multiple objects. It is important that the agent acts rationally in all situations, so consider carefully how you make your agent behave in different situations – use your understanding of what it means for an agent to be rational in its actions and allow this to inform your agent's actions.

Further marks can be obtained for particularly elegant or efficient solutions. Your code should be well commented, so that it is clear to the marker that you understand what your code is doing - it is very important to convey your understanding of the agent and how they interact with the environment within these comments. Your code should be nicely laid out, in a consistent manner.
