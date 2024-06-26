
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;
use work.SadLibrary.all;


entity datapath is
    generic(
        data_width  :       integer                           := 16;  
        matrix_size :       std_logic_vector(16 - 1 downto 0) := x"0010"
    );
    port(
        clk         :       in  std_logic;
        rst         :       in  std_logic;
        rst_count   :       in  std_logic;
        start       :       in  std_logic;
        calc_en     :       in  std_logic;
        x_in        :       in  std_logic_vector(data_width - 1 downto 0);
        y_in        :       in  std_logic_vector(data_width - 1 downto 0);
        w_en_x      :       in  std_logic;
        r_en_x      :       in  std_logic;
        w_en_y      :       in  std_logic;
        r_en_y      :       in  std_logic;
        w_en_z      :       in  std_logic;
        r_en_z      :       in  std_logic;
        cnt_eq_size :       out std_logic;
        SAD_o       :       out std_logic_vector(data_width - 1 downto 0)
    );
end datapath;


architecture rtl of datapath is

signal  addr, x_out, y_out, mux_1_out, mux_2_out, sub_mux12_out, z_in, z_out: std_logic_vector(data_width-1 downto 0);
signal  comp_gt_out, en_count: std_logic;


begin
    Memory_x    :   memory  port map    (clk, rst, w_en_x, r_en_x, addr, x_in, x_out);
    Memory_y    :   memory  port map    (clk, rst, w_en_y, r_en_y, addr, y_in, y_out);
    Memory_z    :   memory  port map    (clk, rst, w_en_z, r_en_z, addr, z_in, z_out);
    TheCounter  :   counter port map    (clk, rst_count, en_count, addr);
    
    en_count        <= calc_en when start = '1' else w_en_x;
    comp_gt_out     <= '1' when signed(x_out) > signed(y_out) else '0';
    
    mux_1_out       <= x_out when comp_gt_out = '1' else y_out;
    mux_2_out       <= x_out when comp_gt_out = '0' else y_out;
    cnt_eq_size     <= '1' when addr = matrix_size else '0';
    sub_mux12_out   <= mux_1_out - mux_2_out;
    z_in            <= z_out + sub_mux12_out when (start = '1') else (others => '0');
    SAD_o           <= z_out;
end rtl; 