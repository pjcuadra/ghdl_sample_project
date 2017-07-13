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

entity output_lkup_table is
  port (
    curr_state : in std_logic_vector(3 downto 0);
    output_val : out std_logic_vector(1 downto 0));
end output_lkup_table;

architecture paper_wired of output_lkup_table is
begin

  with curr_state select
    output_val <= "00" when "0000",
                  "11" when "0001",
                  "11" when "0010",
                  "00" when "0011",
                  "10" when "0100",
                  "01" when "0101",
                  "01" when "0110",
                  "10" when "0111",
                  "11" when "1000",
                  "00" when "1001",
                  "00" when "1010",
                  "11" when "1011",
                  "01" when "1100",
                  "10" when "1101",
                  "10" when "1110",
                  "01" when "1111",
                  "00" when others;

end paper_wired;
