-- Copyright 2017 Pedro Cuadra <pjcuadra@gmail.com>
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License. */

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.STD_LOGIC_ARITH.ALL;
-- use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity next_state_lkup_table is
  generic (
    output : integer := 2;
    input  : integer := 1;
    memory : integer := 4);
  port (
    input_val  : in std_logic_vector(input - 1 downto 0);
    curr_state : in std_logic_vector((input * memory) - 1 downto 0);
    next_state : out std_logic_vector((input * memory) - 1 downto 0));
end next_state_lkup_table;

architecture shift_reg of next_state_lkup_table is
begin

  next_state((input * memory) - 1 downto input) <= curr_state((input * memory) - 1 - input downto 0);
  next_state(input - 1 downto 0) <= input_val;

end shift_reg;
