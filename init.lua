print("++++ Hahahaha - hello from Dad +++++")

minetest.after(5,
	       function(params)
		  minetest.chat_send_all("Welcome!!! This game has the amazing ace_noise mod. Punch the noise blocks. Snickasnickasnickasnicka")
	       end
)

minetest.register_on_punchnode(
   function(pos, node, puncher)
      if node.name == "ace_noise:noise"
      then
	 minetest.chat_send_all("EMERGENCY SIREN ACTIVATED!")
         handle = minetest.sound_play("ace_noise_civildefense", {gain = 1.0,})
         minetest.register_on_punchnode(
            function(pos, node, puncher)
               if node.name == "ace_noise:noise"
               then
                  minetest.chat_send_all("All Clear. All Clear.")
                  minetest.sound_stop(handle)
               end
         end)
      end
   end
)

minetest.register_node("ace_noise:noise", {
	description = "Noise",
	tiles = {"ace_noise_noise_block.png"},
})
