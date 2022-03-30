library ieee;
use ieee.std_logic_1164.all;

entity xbar_gen is
  generic(n: integer:= 8)
  port(s: in std_logic_vector (N-1 downto 0);
       y1, y2: out std_logic);
end xbar_gen;

architecture rtl of xbar_gen is
  signal x1: std_logic_vector(0 to n);
  signal x2: std_logic_vector(0 to n);
  begin
      x1(0) <= '1';
      x2(0) <= '0';
      for i in 0 to n - 1 generate
        xbars: entity work.xbar_v3 port map(x1(i), x2(i), s(i), x1(i + 1), x2(i + 1));
      end generate;
      y1 <= x1(n);
      y2 <= x2(n);
end rtl;+