
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.SADlibrary.all;


entity main is

end _main;


architecture tb of _main is

    constant data_width: integer := 8;
    signal clk, rst, w_en, r_en: std_logic;
    signal data_in, data_out: std_logic_vector(data_width - 1 downto 0);
    signal addr: std_logic_vector(2 downto 0);


    begin
        the_final   :   memory  generic map (data_width) 
                                port map (clk, rst, w_en, r_en, addr, data_in, data_out);
        
        clock_sig:
            process 
                begin  
                    clk <= '1';
                    wait for 1 ns;
                    clk <= '0';
                    wait for 1 ns;
            end process;

        run_main:
            process
                begin
                    rst <= '1';
                    wait for 1 ns;
                    rst <= '0';
                    addr <= "010";
                    w_en <= '1';
                    wait for 1 ns;                   
                    data_in <= x"02";
                    wait for 1 ns;
                    w_en <= '0';
                    r_en <= '1';
                    wait for 2 ns;
                    addr <= "001";
                    wait for 1 ns;
                    data_in <= x"01";
                    wait for 1 ns;
                    w_en <= '0';
                    wait;


            end process;
end tb;