

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.SADlibrary.all;


entity testbench2 is

end testbench2;


architecture tb of testbench2 is

    constant data_width           : integer := 16;
    constant matrix_size          : integer := 16;
    signal clk, rst, en, w_en_x, w_en_y : std_logic;
    signal SAD_o: std_logic_vector(data_width - 1 downto 0);

    begin
        computeSAD_process  : counter  generic map(data_width)
                                             port map(clk, rst, en, SAD_o);

        clock_sig:
            process 
                begin  
                    clk <= '1';
                    wait for 1 ns;
                    clk <= '0';
                    wait for 1 ns;
            end process;
        cuminside:
            process
                begin  
                    rst <= '1';
                    wait for 4 ns;
                    rst <= '0';
                    en <= '1';
                    wait for 20 ns;
                    rst <= '1';
                    wait for 2 ns;
                    rst <= '0';
                    wait for 12 ns;
                    en <= '0';
                    wait for 8 ns;
                    en <= '1';
                    
                    wait;
            end process;
 

end tb;