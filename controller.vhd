
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use work.SADLibrary.all;


entity controller is
    generic(
        data_width: integer := 16
    );
    port(
        clk             :       in  std_logic;
        rst             :       in  std_logic;
        start           :       in  std_logic;
        rst_count       :       out std_logic;
        r_en_x          :       out std_logic;
        r_en_y          :       out std_logic;
        w_en_z          :       out std_logic;
        r_en_z          :       out std_logic;
        calc_en         :       out std_logic;
        count_eq_size   :       in  std_logic;
        done            :       out std_logic
    );
end controller;


architecture rtl of controller is

type    stage_level is (s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);
signal  stage           :       stage_level;


begin
    process(clk, rst) is
        begin
            if (rst = '1') then
                stage <= s1;
            elsif ( clk'event and clk = '1') then
                case stage is
                    when s1 =>
                        stage <= s2;
                    when s2 =>
                        if (start = '1') then
                            stage <= s3;                        
                        else
                            stage <= s2;
                        end if;
                    when s3 =>
                        stage <= s4;
                    when s4 =>
                        stage <=s5;
                    when s5 =>
                        stage <= s6;
                    when s6 =>
                        stage <=s7;
                    when s7 =>
                        stage <= s8;
                    when s8 =>
                        if (count_eq_size = '1') then
                            stage <= s9;
                        else
                            stage <= s4;
                        end if;
                    when s9 =>
                        stage <= s10;
                    when s10 =>
                        if(start = '0') then
                            stage <= s1;
                        else
                            stage <= s10;
                        end if;
                end case;
            end if;
    end process;

rst_count   <= '1' when (stage = s1 or stage = s3) else '0';
r_en_x      <= '1' when stage = s4 else '0';
r_en_y      <= '1' when stage = s4 else '0';
w_en_z      <= '1' when stage = s5 else '0';
r_en_z      <= '1' when (stage = s6 or stage = s1) else '0';
calc_en     <= '1' when stage = s6 else '0';
done        <= '1' when stage = s9 else '0';

   
end rtl;