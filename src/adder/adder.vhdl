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

entity adder is
  -- `i0`, `i1` and the carry-in `ci` are inputs of the adder.
  -- `s` is the sum output, `co` is the carry-out.
  port (i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
end adder;

architecture rtl of adder is
begin
   --  This full-adder architecture contains two concurrent assignment.
   --  Compute the sum.
   s <= i0 xor i1 xor ci;
   --  Compute the carry.
   co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end rtl;
