extends Resource
class_name Passengers
## The passengers the train has to bring from station X to Y

var destination: Station

## When patience hits 0 in any phase the game is over.
## Patience is changed by the process function of either station or the train.
var patience: float
## TODO: Hook this up with the game-over.


