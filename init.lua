minetest.register_privilege("bob_ross", "Allows colorizing the skybox.")

local rn = function()
  local m = math.random(4294967296)
  local c = string.format("#%08x", m)
  return c
end

local function beat_the_devil_out_of_it(name)
  if minetest.check_player_privs(name, { bob_ross = true }) then
    return {
      base_color = rn(),
      sky_color = {
        day_horizon = rn(), fog_tint_type = "default",
        fog_moon_tint = rn(), fog_sun_tint = rn(),
        dawn_sky = rn(), night_horizon = rn(),
        day_sky = rn(), night_sky = rn(),
        indoors = rn(), dawn_horizon = rn()
      },
      type = "regular",
      fog = {
        fog_start = -1,
        fog_distance = -1
      },
      clouds = true,
      textures = {}
    }
  end
end

minetest.register_chatcommand("bob_ross", {
  description = "Happy little clouds in a Happy little sky",
  params = "",
  privs = {bob_ross = true},
  func = function(name, param)
    local player = minetest.get_player_by_name(name)
    if player then
      player:set_sky(beat_the_devil_out_of_it(name))
    end
  end
})


  

------------------------------------------------------------------------------------
-- MIT License                                                                    --
--                                                                                --
-- Copyright (c) 2024  monk                                                       --
--                                                                                --
-- Permission is hereby granted, free of charge, to any person obtaining a copy   --
-- of this software and associated documentation files (the "Software"), to deal  --
-- in the Software without restriction, including without limitation the rights   --
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell      --
-- copies of the Software, and to permit persons to whom the Software is          --
-- furnished to do so, subject to the following conditions:                       --
--                                                                                --
-- The above copyright notice and this permission notice shall be included in all --
-- copies or substantial portions of the Software.                                --
--                                                                                --
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR     --
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,       --
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE    --
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER         --
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,  --
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE  --
-- SOFTWARE.                                                                      --
------------------------------------------------------------------------------------
