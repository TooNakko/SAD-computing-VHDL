library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
-- Define memory size and data width

entity memory is
    generic (
      data_width : integer := 16
    );
    port (
      clk : in std_logic;
      rst : in std_logic;
      w_en : in std_logic;  -- Write enable
      r_en : in std_logic;  -- Read enable
      addr : in std_logic_vector(data_width - 1 downto 0); -- Address bus
      data_in : in std_logic_vector(data_width-1 downto 0); -- Data input
      data_out : out std_logic_vector(data_width-1 downto 0) -- Data output
    );
end entity;

architecture rtl of memory is
    type mem_array is array (0 to 15) of std_logic_vector(data_width-1 downto 0);
    signal ram : mem_array ;
begin
    process(clk, rst) is
    begin
        if (clk'event and clk = '1') then
            if (rst = '1') then
                -- Reset memory to all zeros on reset
                ram <= (others => x"0000");
            elsif (w_en = '1') then
                -- Write operation (enable with we, disable read with re)
                ram(to_integer(unsigned(addr))) <= data_in;
            end if;
        end if;
    end process;

    -- Read operation (always combinational)
    data_out <= ram(to_integer(unsigned(addr))) when r_en = '1'; 
end rtl;

