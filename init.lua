print("ace_noise: mod loading")

minetest.after(5,
	       function(params)
		  minetest.chat_send_all("Welcome!!! This game has the amazing ace_noise mod. Punch the noise blocks. Snickasnickasnickasnicka")
	       end
)

local ace_noise_siren_handle
local siren_state = "off"

minetest.register_on_punchnode(
   function(pos, node, puncher)
      if node.name == "ace_noise:noise"
      then
         if siren_state == "off"
         then
            minetest.chat_send_all("EMERGENCY SIREN ACTIVATED!")
            ace_noise_siren_handle = minetest.sound_play("ace_noise_civildefense", {pos = pos, gain = 1.0,})
            siren_state = "on"
         else
            minetest.chat_send_all("All Clear. All Clear.")
            minetest.sound_stop(ace_noise_siren_handle)
            siren_state = "off"
         end
         print("ace_noise: ace_noise_siren_handle = " .. ace_noise_siren_handle)
         print("ace_noise: siren_state = " .. tostring(siren_state))
      end
   end
)

minetest.register_node("ace_noise:noise", {
                          description = "Noise",
                          tiles = {"ace_noise_noise_block.png"},
})

print("ace_noise: mod loaded")
