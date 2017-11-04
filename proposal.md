Name: Bryan Komoff          ID:   46986970

## Proposed Project

To keep with the game theme I am going to try and recreate one of my favorite childhood games Stratego. 
If you are not familiar with the game it is a mixture of chess and capture the flag. Here is a link to
the wikipedia page https://en.wikipedia.org/wiki/Stratego. The idea of the game is to move your pieces
around the board and look for the other players flag. To make sure I am able to complete this on time
I will have the AI always start with the same board layout and probably use the same moves for each game.
If I am able to get done early I will give the computer opponent some smarts. I am also going to create a
web app to give the project a little more life. Trying to create an ASCII game board might be a little tough
to update.
  
## Outline Structure

1) Phoenix web application for game interaction
2) A couple of modules that will supervise an OTP server which will handle keeping track of the game state (i.e. computer / human board positions)
3) A module that will handle the AI moves.
4) A module that will update the board pieces.
5) A module that will create the board and read in where the player want their pieces on the board plus place the AI pieces on the board

I'm a little worried about the scope of this work but it should be doable. If you feel like this a little too ambitious I do have another proposal for a CSV parser program that would
take in a lot of data and allow you to customize into a report. This is more towards something I can use at work. I can propose that. 
