
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;
use work.SADlibrary.all;


entity testbench is

end testbench;


architecture tb of testbench is

    constant data_width           : integer := 16;
    constant matrix_size          : integer := 16;
    signal clk, rst, start, w_en_x, w_en_y, debug_sig : std_logic;
    signal x_in, y_in, SAD_o: std_logic_vector(data_width - 1 downto 0);

    begin
        computeSAD_process  : computeSAD  generic map(data_width, matrix_size)
                                             port map(clk, rst, start, w_en_x,w_en_y, x_in, y_in, SAD_o,debug_sig);

        clock_sig:
            process 
                begin  
                    clk <= '1';
                    wait for 1 ns;
                    clk <= '0';
                    wait for 1 ns;
            end process;
        


        reset:
            process
                begin
                    rst <= '1';
                    wait for 4 ns;
                    rst <= '0';
                    wait;
            end process;
        
        write_enable_x:
            process 
                begin 
                    w_en_x <= '0';
                    wait for 5 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    w_en_x <= '1';
                    wait for 2 ns;
                    w_en_x <= '0';
                    wait for 2 ns;
                    wait;
            end process;

        write_enable_y:
            process 
                begin 
                    w_en_y <= '0';
                    wait for 5 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    w_en_y <= '1';
                    wait for 2 ns;
                    w_en_y <= '0';
                    wait for 2 ns;
                    wait;
            end process;
        
        compute:
            process
                begin
                    start <= '0';
                    wait for 5 ns;
                    x_in <= x"0002";
                    y_in <= x"0001";
                    wait for 4 ns;
                    x_in <= x"0012";
                    y_in <= x"0000";
                    wait for 4 ns;
                    x_in <= x"0002";
                    y_in <= x"0001";
                    wait for 4 ns;
                    x_in <= x"0000";
                    y_in <= x"000A";
                    wait for 4 ns;
                    x_in <= x"0007";
                    y_in <= x"0007";
                    wait for 4 ns;
                    x_in <= x"0002";
                    y_in <= x"0011";
                    wait for 4 ns;
                    x_in <= x"0002";
                    y_in <= x"0006";
                    wait for 4 ns;
                    x_in <= x"0006";
                    y_in <= x"000B";
                    wait for 4 ns;
                    x_in <= x"0005";
                    y_in <= x"0001";
                    wait for 4 ns;
                    x_in <= x"0002";
                    y_in <= x"0001";
                    wait for 4 ns;
                    x_in <= x"000C";
                    y_in <= x"000B";
                    wait for 4 ns;
                    x_in <= x"000A";
                    y_in <= x"0009";
                    wait for 4 ns;
                    x_in <= x"0008";
                    y_in <= x"0000";
                    wait for 4 ns;
                    x_in <= x"000F";
                    y_in <= x"000F";
                    wait for 4 ns;
                    x_in <= x"0012";
                    y_in <= x"0011";
                    wait for 4 ns;
                    x_in <= x"002D";
                    y_in <= x"000D";
                    wait for 4 ns;
                    start <= '1';
                    wait;
            end process;


end tb;