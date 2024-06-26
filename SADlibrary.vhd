

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.std_logic_unsigned.ALL;

package SADlibrary is
    component memory is
        generic (
            data_width  :   integer := 16
        );
        port (
            clk         :   in std_logic;
            rst         :   in std_logic;
            w_en        :   in std_logic; 
            r_en        :   in std_logic; 
            addr        :   in std_logic_vector(data_width-1 downto 0);
            data_in     :   in std_logic_vector(data_width-1 downto 0);
            data_out    :   out std_logic_vector(data_width-1 downto 0) 
        );
    end component;


    component counter is
        generic(
            data_width  :   integer := 16
        );
        port(
        	clk         :   in std_logic;
        	rst_count   :   in std_logic;
        	en_count    :   in std_logic;
            output      :   out std_logic_vector(data_width - 1 downto 0)
        );
    end component;


    component datapath is
    generic(
        data_width      :   integer := 16;
        matrix_size     :   std_logic_vector(16 - 1 downto 0) := x"0010"
    );  
    port(   
        clk             :   in  std_logic;
        rst             :   in  std_logic;
        rst_count       :   in  std_logic;
        start           :   in  std_logic;
        calc_en         :   in  std_logic;
        x_in            :   in  std_logic_vector(data_width - 1 downto 0);
        y_in            :   in  std_logic_vector(data_width - 1 downto 0);
        w_en_x          :   in  std_logic;
        r_en_x          :   in  std_logic;
        w_en_y          :   in  std_logic;
        r_en_y          :   in  std_logic;
        w_en_z          :   in  std_logic;
        r_en_z          :   in  std_logic;
        cnt_eq_size     :   out std_logic;
        SAD_o           :   out std_logic_vector(data_width - 1 downto 0)
    );
    end component;



    component controller is
    generic(
        data_width      :   integer := 16
    );
    port(
        clk             :   in  std_logic;
        rst             :   in  std_logic;
        start           :   in  std_logic;
        rst_count       :   out std_logic;
        r_en_x          :   out std_logic;
        r_en_y          :   out std_logic;
        w_en_z          :   out std_logic;
        r_en_z          :   out std_logic;
        calc_en         :   out std_logic;
        count_eq_size   :   in  std_logic;
        done            :   out std_logic

    );
    end component;


    component computeSAD is
    generic(
        data_width  :   integer     := 16;
        matrix_size :   std_logic_vector(16 - 1 downto 0) := x"0010"
    );
    port(
        clk             :   in  std_logic;
        rst             :   in  std_logic;
        start           :   in  std_logic;
        w_en_x          :   in  std_logic;
        w_en_y          :   in  std_logic;
        x_in            :   in  std_logic_vector(data_width-1 downto 0);
        y_in            :   in  std_logic_vector(data_width-1 downto 0);
        SAD_o           :   out std_logic_vector(data_width-1 downto 0);
        done            :   out std_logic
    );
    end component;



end package;