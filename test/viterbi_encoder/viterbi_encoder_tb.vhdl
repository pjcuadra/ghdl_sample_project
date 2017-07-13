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

--  A testbench has no ports.
entity viterbi_encoder_tb is
end viterbi_encoder_tb;

architecture behav of viterbi_encoder_tb is
  component viterbi_encoder is
    port (
      clk    : in std_logic;
      input  : in std_logic_vector(0 downto 0);
      output : out std_logic_vector(1 downto 0));
  end component;

  for vit_encoder: viterbi_encoder use entity work.viterbi_encoder(state_machine);

  -- Signal definition
  signal clk : std_logic := '0';
  signal input : std_logic_vector(0 downto 0);
  signal output : std_logic_vector(1 downto 0);

begin

  vit_encoder: viterbi_encoder
   port map(
     clk => clk,
     input => input,
     output => output
   );

  --  This process does the real job.
  process

     type pattern_type is record
        --  The inputs of the adder.
        clk : std_logic;
        input : std_logic_vector(0 downto 0);
     end record;
     --  The patterns to apply.
     type pattern_array is array (natural range <>) of pattern_type;
     constant patterns : pattern_array :=
       (('0', "0"),
        ('0', "1"),
        ('1', "1"),

        ('0', "0"),
        ('1', "0"),

        ('0', "1"),
        ('1', "1"),

        ('0', "1"),
        ('1', "1"),

        ('0', "0"),
        ('1', "0"),
        ('0', "0"),
        ('1', "0"),
        ('0', "0"),
        ('1', "0")
        );
  begin
     --  Check each pattern.
     for i in patterns'range loop
        --  Set the inputs.
        input <= patterns(i).input;
        clk <= patterns(i).clk;

        --  Wait for the results.
        wait for 1 ns;
        --  Check the outputs.
        -- assert s = patterns(i).s
        --    report "bad sum value" severity error;
        -- assert co = patterns(i).co
        --    report "bad carry out value" severity error;
     end loop;
     assert false report "end of test" severity note;
     --  Wait forever; this will finish the simulation.
     wait;
  end process;


end behav;
