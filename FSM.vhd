LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.all;

Entity FSM is port ( clk, rst, start                        : in std_logic;
                     stop_vnpu, stop_cnpu, stop_dec         : in std_logic;--
                     start_vnpu, start_cnpu, start_decision : out std_logic;
                     end_decode                             : out std_logic;
                     cpt_decision                           : in std_logic_vector(2 downto 0)
                     ); 
end;

Architecture arch of FSM is  
  type etat is (repos,init, cn_up, vn_up, decision, fin);
  signal etat_p, etat_f : etat;
  
  
  Begin
   process(clk, rst,start)
     begin
       if (rst='1') then etat_p<= repos;
       elsif(clk'event and clk='1' and start='1') then
        etat_p<= etat_f;
      end if;
    end process;
    
    process (etat_p,start,stop_vnpu,stop_cnpu,stop_dec,cpt_decision )
      begin
         case etat_p is
         when repos => start_vnpu<= '0'; start_cnpu<= '0'; start_decision <= '0';end_decode<= '0';
                       if start ='1' then etat_f <= init;
                       else etat_f <= repos; 
                       end if; 
         when init => start_vnpu <= '1';start_cnpu<= '0'; start_decision <= '0';end_decode<= '0';
                       if stop_vnpu ='1' then etat_f <= cn_up;
                       else etat_f <= init; 
                       end if; 
         when cn_up => start_cnpu <= '1';start_vnpu<= '0'; start_decision <= '0';end_decode<= '0';
                       if stop_cnpu ='1' then etat_f <= vn_up;
                       else etat_f <= cn_up; 
                       end if; 
         when vn_up => start_vnpu <= '1';start_cnpu<= '0'; start_decision <= '0';end_decode<= '0' ;
                       if stop_vnpu ='1' then etat_f <= decision;
                       else etat_f <= vn_up; 
                       end if; 
         when decision => start_decision <= '1';start_vnpu <= '0';start_cnpu<= '0';end_decode<= '0' ;
                         if stop_dec ='1' then etat_f <= fin;
                         elsif (cpt_decision= "111") then etat_f <= cn_up; 
                         else etat_f <= decision;
                         end if; 
         when fin => end_decode <= '1';start_decision <= '0';start_vnpu <= '0';start_cnpu<= '0' ;
                     etat_f <= repos;
  end case;
end process;

end ;