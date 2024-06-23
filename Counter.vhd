library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    generic(
        data_width  :   	integer := 16
    );
    port(
    	clk         :	in  std_logic;
    	rst_count   :	in  std_logic;
    	en_count    :	in  std_logic;
        output      :	out std_logic_vector(data_width - 1 downto 0)
    );
end counter;


architecture c of counter is
	signal counter_up: std_logic_vector(data_width - 1 downto 0);
	begin
		process(clk, rst_count, en_count) is
			begin

			if clk'event and clk = '1' then
			  	if rst_count = '1' then
					counter_up <= x"0000";
			  	else
					if en_count = '1' then 
						counter_up <= counter_up + x"0001"; 
					else
						counter_up <= counter_up;
					end if;
				
				end if;
			end if;
			output <= counter_up;

		end process;
end architecture;


