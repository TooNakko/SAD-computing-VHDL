
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.SADLibrary.all;


entity computeSAD is
    generic(
        data_width  :       integer := 16;
        matrix_size :       std_logic_vector(16 - 1 downto 0) := x"0010"
    );
    port(
        clk         :       in  std_logic;
        rst         :       in  std_logic;
        start       :       in  std_logic;
        w_en_x      :       in  std_logic;
        w_en_y      :       in  std_logic;
        x_in        :       in  std_logic_vector(data_width-1 downto 0);
        y_in        :       in  std_logic_vector(data_width-1 downto 0);
        SAD_o       :       out std_logic_vector(data_width-1 downto 0);
        done        :       out std_logic
    );
end computeSAD;


architecture rtl of computeSAD is

signal  rst_count, r_en_x, r_en_y, calc_en, count_eq_size: std_logic;
signal  w_en_z, r_en_z: std_logic;
signal  y_mux_dff, y_dff_out: std_logic;


begin
    C   :   controller  port map (clk, rst, start, rst_count, r_en_x, r_en_y,w_en_z, r_en_z, calc_en, count_eq_size,done);
    D   :   datapath    port map (clk, rst, rst_count, start, calc_en, x_in, y_in, w_en_x, r_en_x, w_en_y, r_en_y, w_en_z, r_en_z, count_eq_size,SAD_o);

end rtl;