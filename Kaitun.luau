if game.GameId == 7326934954 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/xshibau/Kaitun/refs/heads/main/Kaitun99night.luau"))()
elseif game.GameId == 8014099969 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/xshibau/Kaitun/refs/heads/main/KaitunPTHFM.luau"))()
else
 local player = game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()
 player:Kick("[Aura Hub]: Load Failed - Script Not Support")
end
