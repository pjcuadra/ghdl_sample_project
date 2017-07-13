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

entity viterbi_encoder is
  port (
    clk    : in std_logic;
    input  : in std_logic_vector(0 downto 0);
    output : out std_logic_vector(1 downto 0) := "00");
end viterbi_encoder;

architecture state_machine of viterbi_encoder is
  signal next_state : std_logic_vector(3 downto 0) := "0000";
  signal curr_state : std_logic_vector(3 downto 0) := "0000";
  signal output_s   : std_logic_vector(1 downto 0) := "00";
  signal ser_count  : integer := 0;

  component next_state_lkup_table is
    generic (
      output : integer := 2;
      input  : integer := 1;
      memory : integer := 4);
    port (
      input_val  : in std_logic_vector(input - 1 downto 0);
      curr_state : in std_logic_vector((input * memory) - 1 downto 0);
      next_state : out std_logic_vector((input * memory) - 1 downto 0));
  end component;

  component output_lkup_table is
    port (
      curr_state : in std_logic_vector(3 downto 0);
      output_val : out std_logic_vector(1 downto 0));
  end component;

begin

  next_lkup : next_state_lkup_table
    generic map(
      output => 2,
      input  => 1,
      memory => 4)
    port map(
      input_val => input,
      curr_state => curr_state,
      next_state => next_state);

  out_lkup: output_lkup_table
    port map(
      curr_state => curr_state,
      output_val => output
    );

  main_p: process (clk)
  begin
    if (clk'event) and (clk='1') then
      curr_state <= next_state;
      ser_count <= 0;
    else
      curr_state <= curr_state;
    end if;
  end process;

end state_machine;
