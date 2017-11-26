How to play:
Open 3 terminals (server, blue player, red player)

Start the Stratego Server (Terminal 1):
navigate to stratego folder type:
iex --sname <<server node name>> --cookie game -S mix
  
Start Red Player (Terminal 2):
iex --sname <<red node name>> --cookie game -S mix
  note: I am not sure why I was not able to do this iex --sname <<node name>> --cookie game -S mix run -e StrategoPlayer.connect(<<node name>>) I kept getting a bash error unexpected token '('

Start Blue Player (Terminal 3):
iex --sname <<blue node name>> --cookie game -S mix

Here are commands you can use:
StrategoPlayer.Impl.play(:blue or :red) This lets the server and other player know someone is connected
StrategoPlayer.Impl.player_ready(:blue or :red) This lets the server and other player know you are done placing pieces
StrategoPlayer.Impl.place_piece(<<player>>,<<piece>>,{x,y}) piece: :marshal, :general, :colonel, :major, :captain, :lieutenant, :sergeant, :miner, :scout, :spy, :bomb, :flag
StrategoPlayer.Impl.move_piece({x,y},<<direction>>) direction: :up, :down, :left, :right
StrategoPlayer.Impl.print_board This will print out the positions of both players pieces
